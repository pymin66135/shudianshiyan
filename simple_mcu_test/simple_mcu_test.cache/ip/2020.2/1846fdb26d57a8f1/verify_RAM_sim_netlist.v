// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Sun Jul  5 16:12:41 2026
// Host        : pymin66135 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ verify_RAM_sim_netlist.v
// Design      : verify_RAM
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7k160tffg676-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "verify_RAM,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_4 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 20400)
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
