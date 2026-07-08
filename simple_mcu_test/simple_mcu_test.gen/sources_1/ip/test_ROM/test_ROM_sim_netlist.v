// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Sun Jul  5 16:25:25 2026
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
    douta,
    clkb,
    enb,
    addrb,
    doutb);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [5:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [15:0]douta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [5:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [15:0]doutb;

  wire [5:0]addra;
  wire [5:0]addrb;
  wire clka;
  wire clkb;
  wire [15:0]douta;
  wire [15:0]doutb;
  wire ena;
  wire enb;
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
  (* C_HAS_ENB = "1" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "1" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "1" *) 
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
  (* C_MEM_TYPE = "4" *) 
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
        .addrb(addrb),
        .clka(clka),
        .clkb(clkb),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(doutb),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(enb),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 18720)
`pragma protect data_block
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
HmiwcoMI0Iy6JR9XV3HO5Um2zOkiPENe
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
