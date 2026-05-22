// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Thu May 14 13:53:37 2026
// Host        : DESKTOP-1Q97FT3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ test_flags_and_result_rom_sim_netlist.v
// Design      : test_flags_and_result_rom
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7k160tffg676-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "test_flags_and_result_rom,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_4 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 19056)
`pragma protect data_block
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
U0HXxtEL7lPMW51lVFkn66ul
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
