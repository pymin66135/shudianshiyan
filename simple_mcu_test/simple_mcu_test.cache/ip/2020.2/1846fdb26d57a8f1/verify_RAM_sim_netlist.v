// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Tue Jun  2 15:41:57 2026
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
