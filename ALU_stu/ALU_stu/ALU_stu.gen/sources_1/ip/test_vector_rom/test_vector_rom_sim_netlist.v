// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Thu May 14 13:53:37 2026
// Host        : DESKTOP-1Q97FT3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top test_vector_rom -prefix
//               test_vector_rom_ test_vector_rom_sim_netlist.v
// Design      : test_vector_rom
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7k160tffg676-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "test_vector_rom,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module test_vector_rom
   (clka,
    ena,
    addra,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [6:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [65:0]douta;

  wire [6:0]addra;
  wire clka;
  wire [65:0]douta;
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
  wire [65:0]NLW_U0_doutb_UNCONNECTED;
  wire [6:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [6:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [65:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "7" *) 
  (* C_ADDRB_WIDTH = "7" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "1" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     6.4408 mW" *) 
  (* C_FAMILY = "kintex7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
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
  (* C_INIT_FILE = "test_vector_rom.mem" *) 
  (* C_INIT_FILE_NAME = "test_vector_rom.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "3" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "128" *) 
  (* C_READ_DEPTH_B = "128" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "66" *) 
  (* C_READ_WIDTH_B = "66" *) 
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
  (* C_WRITE_DEPTH_A = "128" *) 
  (* C_WRITE_DEPTH_B = "128" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "66" *) 
  (* C_WRITE_WIDTH_B = "66" *) 
  (* C_XDEVICEFAMILY = "kintex7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  test_vector_rom_blk_mem_gen_v8_4_4 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[65:0]),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[6:0]),
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
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[6:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[65:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 29264)
`pragma protect data_block
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
n9TBkMK8zf/UuQJc9HkTYCP1IYNq5Og=
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
