// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Thu May 14 13:53:37 2026
// Host        : DESKTOP-1Q97FT3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top test_flags_and_result_rom -prefix
//               test_flags_and_result_rom_ test_flags_and_result_rom_sim_netlist.v
// Design      : test_flags_and_result_rom
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7k160tffg676-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "test_flags_and_result_rom,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module test_flags_and_result_rom
   (clka,
    ena,
    addra,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [6:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [35:0]douta;

  wire [6:0]addra;
  wire clka;
  wire [35:0]douta;
  wire ena;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [35:0]NLW_U0_doutb_UNCONNECTED;
  wire [6:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [6:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [35:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "7" *) 
  (* C_ADDRB_WIDTH = "7" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "0" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     3.5416 mW" *) 
  (* C_FAMILY = "kintex7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "test_flags_and_result_rom.mem" *) 
  (* C_INIT_FILE_NAME = "test_flags_and_result_rom.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "3" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "128" *) 
  (* C_READ_DEPTH_B = "128" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "36" *) 
  (* C_READ_WIDTH_B = "36" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "128" *) 
  (* C_WRITE_DEPTH_B = "128" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "36" *) 
  (* C_WRITE_WIDTH_B = "36" *) 
  (* C_XDEVICEFAMILY = "kintex7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  test_flags_and_result_rom_blk_mem_gen_v8_4_4 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[35:0]),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[6:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[6:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[35:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(1'b0),
        .web(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2020.2"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
QGLtnqZzRetDH6gCWT4Js6wuLlZfrNx/VJp3sfR2NF+cxypO5AxN0oDKLJJtmdrtE/ueNDg+Qf7Z
TqBNRojORA==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
B6Ger3hRvfjHkaJ+W8639Kl3TzC9TogLuklOXEiMNdc4Im+DjEUzxb3DKlzu0VW3zxZqjJ3+wsW/
LnRmPCESi5Y9eRJaLFXg79EMfoj4X+nTdHAP6yCfltBADKegZ12gpnB/8ey5yn2KA74LUtPC7jna
iyjqSfsWLGnz6UdXzwk=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
BX+DxgMPRyZbYojCUR9Sk8Lq+3ZigBz4yMFHQkmurfdfDzyTPJCE827eGiPyTenK1QPVhEtf9g06
0BFXq/0COPuU1BWJwdkz1c4dE6/exDwhvEh+hPx3vRY6z8fDEf6aGVIXrHDvrmddehe7yMSIpo+k
aXHR06EEdfHCFY4TggYwhcJVXjkE+ApsVuyfmEfPmYjo8hCWyQyBsUWIOY03q1+MvUjjsmTwgs9g
fh5MY9ToaLfoJxPKdCpsqrBX4LJ+VDGFlAqIcqHTE2jCmPiToZAFXB7fzf1wDjFCBlJyFVDBGi0i
m+CouLSb7X1mvVhdDZgNrZDJMV688Bu3o54vew==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
DaIU/Ddc8USbZ2mURzujJDWDH1JbHl5tFVOOQ2aVaUPIA71yyE38OXVLEtF8rNmujYH30nEeQ+FV
LVJ16aaHw+iiuaqorTM3K5KLohVlN+WlcEtSXHuPNHjw8ddqtzpaX7pH1zqZH+YmfCL5oaNLqDH4
rkBnUl0/Gm/hzSwKjYhXGQFYQ+gGP99OjXakzrAqZzp/Iq4gt+Z5902/JV9thd/isHQImJ0QyK8M
EKM579iPAfXGes2mbiNYHcvDmSPYmW1zlhOE++N1EKeea7j/msnKeyhlC+hGE4Xfn4TVvqgQexCT
rp/wS/MosY6WH1aKFQlFH2hEppA7KXUaQlvG+w==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
XmWoAt4X8hrCJ5yTyug4ajJW5UhfkLNibzjihWzZ4Cr9hQSvWZoTc8rjGsLPbz6Le+/9iI5KxecS
eR0wiAO+G2IkwhZgVBeZdKoFnlnTVAyLjk9wMAFXNyJZM6b1NDbfXlPcUsC6JePvPlwwdWknkSsC
r3KvgkWAS+O3xvRmaNw=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Hw3Y+rShKrXiUViyNU1/O2qv6TgheLHBnFMj1i9MUGrHYqh9pLfLYUgWR7S2vj4jv4S+Ks0BpP4p
dKEqVAFmTCfQNEUHaVcFPkOHgig6L4mhLY6HUUKJoRgiQepgLi/W3V+ZZPQSQFkB3CU4MsJzhXvR
yLcpDriZy8cnAHD87Zi5DrNGBzj3kigJeM0du6lCQbxtF5aEdoaNP+YTnIFtcqYhoYnswQlYt0sV
HKgFA8VzqzL5WYnpH7+1IKmFkJBHkyqHCa9wPK0qCKnxkuDj70YzPVqQ+cocdKU+/gNdpCOdZlci
F2HTxrgfrXndJru3TiDqu4UavqAe0MNuFp3t0w==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
XPVggoWL6aXz+MpODTOZhEUQDa0vfEnUDaYeEHXm2vGyqKJujN2c/FFAFBeBYdJATLsIsQ+BqoPc
pBbcFYXDBfOtFIW2dH6Y1OoD65KyJ/hAq8coa21kFgq4hFat5vzZ2iIfkCpTUr4vDZO7Xne8cZO9
WsHffoTCt5rS59wWm2b8I5R8Eh2TUbQg3RCyrcnD66cvcEnlXe1CNMQ4/loVJpA4IBinBf820Wjc
vw2fZbGI0jXC+ACSHOviH63Xwmn+aRV5Ppkup7IYoon/ieKapRQeASu3TTY37xSBXiInSdtMTzJ6
+4GfO4eSHVriCk/sWbuTBzfRzoSShrnHjzz5LA==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2020_08", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
L78XuiswVcgO2gtebzL7SA9BC/jJGAM0v6S9pzmyqL+QYzRneiYeGyDmsW33jEVVSTuNjTXkBLY7
yTOKQruatwe4V0OLi6174saSAmPgerSV1GyLP7KhmusLV/N61avC9TPam+tekhKeE0tds4EnJ3et
4JdLh+SE4Z4pcuqCjB5MFneIYKKWDx7siU6oesAQtoSJOesfMchX63MhOjOHFP/ch+1gHv3T45hg
IGF7V7TrdREVE4f9631tlVJ1o2Dypsmo/76Itz5WCGlTMjAnWXN8IXxKN+PZ3dyt1wjrZm2P/td+
xiGszFnSLrRvw/HferwtSmRx8q0fiHZ88roGTw==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
kDX5kq2QEe25429T6vQqBCFvV1McKTJRYfK99ymVNK2GGvGLXSzgwJHwB2fj9rM0wme3zYYY0vQR
x+9F4L7KLlOVY6qY3LB59uDzyXBI3mMZaS905HXHJkdZHWtQWpfHhl27LqL+8FSluaD6F+KFfYOV
CwIOVuCIp/XjxFXpNBik7YiPt4kHOlDA97IXNLnYUn/g1csGqeNWce4UTne50ggWvLYGbTFGmTjT
N67TpUiGRVRCSv8Tax72GWFIMFZk3Tlp68ZUSQEybZMWX1U9XdMdtxfvNGhf8mi5jQJ2SupSzKu4
T/+53IN9T8aLePAiGBKKG1ZBj4y1ZyYA7XYvjw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 18880)
`pragma protect data_block
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
EG14tam+aDIas9nTMA==
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
