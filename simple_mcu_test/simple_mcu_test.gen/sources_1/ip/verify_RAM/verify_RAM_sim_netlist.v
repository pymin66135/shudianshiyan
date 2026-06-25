// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Fri Jun 12 09:41:33 2026
// Host        : pymin66135 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top verify_RAM -prefix
//               verify_RAM_ verify_RAM_sim_netlist.v
// Design      : verify_RAM
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7k160tffg676-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "verify_RAM,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module verify_RAM
   (clka,
    ena,
    wea,
    addra,
    dina,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [5:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [15:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [15:0]douta;

  wire [5:0]addra;
  wire clka;
  wire [15:0]dina;
  wire [15:0]douta;
  wire ena;
  wire [0:0]wea;
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.87285 mW" *) 
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
  (* C_INIT_FILE = "verify_RAM.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "0" *) 
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
  verify_RAM_blk_mem_gen_v8_4_4 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
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
        .wea(wea),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 20064)
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
