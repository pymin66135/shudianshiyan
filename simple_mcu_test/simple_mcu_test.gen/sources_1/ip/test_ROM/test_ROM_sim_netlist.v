// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Fri Jun 12 09:41:33 2026
// Host        : pymin66135 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top test_ROM -prefix
//               test_ROM_ test_ROM_sim_netlist.v
// Design      : test_ROM
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7k160tffg676-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "test_ROM,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module test_ROM
   (clka,
    ena,
    addra,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [5:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [15:0]douta;

  wire [5:0]addra;
  wire clka;
  wire [15:0]douta;
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
  wire [15:0]NLW_U0_doutb_UNCONNECTED;
  wire [5:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [5:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [15:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "6" *) 
  (* C_ADDRB_WIDTH = "6" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.7096 mW" *) 
  (* C_FAMILY = "kintex7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "1" *) 
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
  (* C_INIT_FILE = "test_ROM.mem" *) 
  (* C_INIT_FILE_NAME = "test_ROM.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "3" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "64" *) 
  (* C_READ_DEPTH_B = "64" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "16" *) 
  (* C_READ_WIDTH_B = "16" *) 
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
  (* C_WRITE_DEPTH_A = "64" *) 
  (* C_WRITE_DEPTH_B = "64" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "16" *) 
  (* C_WRITE_WIDTH_B = "16" *) 
  (* C_XDEVICEFAMILY = "kintex7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  test_ROM_blk_mem_gen_v8_4_4 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[15:0]),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[5:0]),
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
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[5:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[15:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 19376)
`pragma protect data_block
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
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
