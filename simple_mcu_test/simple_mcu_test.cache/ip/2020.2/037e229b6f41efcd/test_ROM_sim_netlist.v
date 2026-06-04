// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Tue Jun  2 15:40:48 2026
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
uZvaBMlaPIBjFfjDlnbLkB70L6CwZQ==
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
