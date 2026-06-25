// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Fri Jun 12 09:41:33 2026
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
