// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Tue Jun  2 15:41:57 2026
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
mpp2
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
