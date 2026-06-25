// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Fri Jun 12 09:41:33 2026
// Host        : pymin66135 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ test_ROM_sim_netlist.v
// Design      : test_ROM
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7k160tffg676-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "test_ROM,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_4 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 19744)
`pragma protect data_block
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
qsooc4MDnOg/i/YUeSjQd5a23s1i4Q==
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
