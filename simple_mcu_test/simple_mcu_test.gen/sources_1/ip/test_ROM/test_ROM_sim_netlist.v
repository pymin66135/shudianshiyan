// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Tue Jun  2 15:40:48 2026
// Host        : pymin66135 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               f:/FPGA/shudianshiyan/simple_mcu_test/simple_mcu_test.gen/sources_1/ip/test_ROM/test_ROM_sim_netlist.v
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 19664)
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
