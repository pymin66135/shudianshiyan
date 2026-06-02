#!/usr/bin/env python3
"""Generate the V0 demo program.hex.

This is not a full ARM assembler. It only encodes the small A32 subset used
by this V0 package:
- MOV/ADD/SUB/AND/ORR with register or imm8 operand2, rotate_imm=0
- LDR/STR with [Rn, #imm12]
- B/BL with A32 PC+8 branch rule
"""
from __future__ import annotations
from pathlib import Path

COND_AL = 0xE << 28

OPCODES = {
    "AND": 0b0000,
    "SUB": 0b0010,
    "ADD": 0b0100,
    "ORR": 0b1100,
    "MOV": 0b1101,
}


def dp_reg(op: str, rd: int, rn: int, rm: int, s: int = 0) -> int:
    return COND_AL | (0 << 26) | (0 << 25) | (OPCODES[op] << 21) | (s << 20) | (rn << 16) | (rd << 12) | rm


def dp_imm(op: str, rd: int, rn: int, imm8: int, s: int = 0) -> int:
    assert 0 <= imm8 <= 0xFF
    return COND_AL | (0 << 26) | (1 << 25) | (OPCODES[op] << 21) | (s << 20) | (rn << 16) | (rd << 12) | imm8


def mov_imm(rd: int, imm8: int, s: int = 0) -> int:
    return dp_imm("MOV", rd, 0, imm8, s)


def ldr_str(load: bool, rd: int, rn: int, imm12: int) -> int:
    assert 0 <= imm12 <= 0xFFF
    # cond | 01 | I=0 | P=1 | U=1 | B=0 | W=0 | L
    return COND_AL | (0b01 << 26) | (1 << 24) | (1 << 23) | ((1 if load else 0) << 20) | (rn << 16) | (rd << 12) | imm12


def branch(link: bool, pc: int, target: int) -> int:
    imm = (target - (pc + 8)) >> 2
    if imm < 0:
        imm &= 0xFFFFFF
    assert 0 <= imm <= 0xFFFFFF
    return COND_AL | (0b101 << 25) | ((1 if link else 0) << 24) | imm


def main() -> None:
    instrs = []
    emit = instrs.append

    emit(mov_imm(0, 5))                      # 0
    emit(mov_imm(1, 3))                      # 4
    emit(dp_reg("ADD", 2, 0, 1))             # 8
    emit(dp_reg("SUB", 3, 0, 1))             # 12
    emit(dp_reg("AND", 4, 0, 1))             # 16
    emit(dp_reg("ORR", 5, 0, 1))             # 20
    emit(mov_imm(7, 0))                      # 24
    emit(ldr_str(False, 2, 7, 0))            # 28
    emit(ldr_str(False, 3, 7, 4))            # 32
    emit(ldr_str(False, 4, 7, 8))            # 36
    emit(ldr_str(False, 5, 7, 12))           # 40
    emit(ldr_str(True, 6, 7, 0))             # 44
    emit(dp_imm("ADD", 8, 6, 4))             # 48
    emit(ldr_str(False, 8, 7, 16))           # 52
    emit(branch(False, pc=56, target=68))    # 56
    emit(mov_imm(9, 99))                     # 60 skipped
    emit(mov_imm(9, 88))                     # 64 skipped
    emit(dp_imm("ADD", 9, 0, 2))             # 68
    emit(branch(True, pc=72, target=84))     # 72
    emit(mov_imm(10, 77))                    # 76 skipped
    emit(mov_imm(10, 66))                    # 80 skipped
    emit(dp_imm("ADD", 11, 0, 7))            # 84
    emit(ldr_str(False, 11, 7, 20))          # 88
    emit(ldr_str(False, 14, 7, 24))          # 92

    out = Path(__file__).resolve().parents[1] / "program" / "program.hex"
    out.write_text("\n".join(f"{x:08X}" for x in instrs) + "\n", encoding="utf-8")
    print(f"Wrote {out}")


if __name__ == "__main__":
    main()
