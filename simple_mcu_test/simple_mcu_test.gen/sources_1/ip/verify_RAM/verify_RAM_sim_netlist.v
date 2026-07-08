// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Sun Jul  5 16:12:41 2026
// Host        : pymin66135 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               f:/FPGA/shudianshiyan/simple_mcu_test/simple_mcu_test.gen/sources_1/ip/verify_RAM/verify_RAM_sim_netlist.v
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 20352)
`pragma protect data_block
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
aGO9
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
