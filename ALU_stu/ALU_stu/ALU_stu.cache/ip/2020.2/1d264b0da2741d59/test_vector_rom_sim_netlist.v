// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Thu May 14 13:53:37 2026
// Host        : DESKTOP-1Q97FT3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ test_vector_rom_sim_netlist.v
// Design      : test_vector_rom
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7k160tffg676-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "test_vector_rom,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_4 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 29552)
`pragma protect data_block
HQ194LDrvbE5KmBzfUiB0uo3656uk7w6TMO852ZQh5i1CSVOyG72cXqXozKzC98e1CeednXV/BHL
JUo3VMr9AYXkhnz2XeOPQpPxmeTUpenDfxYNMg0AGyHIHFUwJvv27fMKjOFtorPa7a/0d1eIX4G9
p1De/AlJkI+j2x5e+cxsLreNimyHQPVZPd9TxobIDjYJh5/fKG4sozcU/ZgxKAF08K+AeyIiCUcg
iGXbhrnYxbE0iPPUSzgsoLDZkVf4VaHwS492sB9hbk+noGtp3spqUznImV9PzX/SwaP1OhdTNHmc
uWKmwa2CUOknzHEInp6kwiGW7ekvon3K+Yfz3drD3i9p1gk2nua1fmIY7bIqe3XhPLH+Z986t9Lz
MrXu3cqEuop9fNcY9o+nL0UbqMEsQGbztxFrUU77PUCuyeh9e9e76CMMV7oZYwsxNPREU6kfhGET
CPlG+e9CCB+KxReeB/hTIjTtSmlTJN/wzbxhMIIafOc6/jiZ0jCAtjUgNch05jbMUx2BG9EIF93H
etNB1Stzhz7Skjj0GhIkvnxrSZFdCac88ReKaAMU5FNP6xHkfEv2aMLQPwPzH3I5XRK4xxBNu5Ce
D5KpciCpEMszYlwVbKCKH4NBL08W8jjnw5aqJHsaqEkab1tugb+HeKuBkKorFF3deFINjnfuGi0E
Likaut+z0kRK4jcIKG0IiPArJh6OKF3zXu260uN1OHpa8zGq0UcnF3Uv2PecQx9rh1gJVKe3Olw7
DRDdnJDAk0fiyx6SSs9o5Btywxc+ft/PrXEEuuY9rhdmstnDlvLUc0nrT+4amir/jfEnVqd6HCAP
XpOLO8lJ0jFftV/7QTEqYI78qESO6XfkH7HC6SitymFVq5FlrX8eXwYWQ8x6kEAej+ftJ3+bp7Fe
TfHIQsrRlSEZUJjJEFm+jNVQLf6nuIBEtCDECuOBS46NmQqvhS3r9o1MeQOHwIg7Fu4W+HFz57yP
eBLte+1yazMQxGTICRpXRKhMzvoTjuEDZszSEpQNxpNLrybmNibv6+LTdI8SSst3Ot0DCa5sHXW4
y0T8VRds72C3krJPMHRkb1zaCy+X/qlnd3uv6rU6IDaEcwHsXLXjzL3NmTc2P6gvdluc4x0iVawZ
k/xa07U6uwjxoi1WT57ylOwnOjN2icB4ICi2pnVOPGi0qaHat7mcEVDYtwKxD2dO/2PJF4u6+j5Z
5VJiRsPuVFdfZmD0Qt4s5ulib7cDF0SJ3psa4lX47QgmrKvr33O8I5o1E3lzxbmsVfN6yoS2RL9F
ZTKECoDKwikRsg0iyxSxlq2+YMB9zPmn7H7IUhYfuneL4tKOfGvb3yDNV4eVeeMnh3e6lTt1GABt
jTLph6H8SrnwZt8gDwm+PWLWr62iXygSeCdOMvBIOdrOks+EkK0xIULBmyzo9AqoTznT95o93u3N
EJ0ZoKbdoJV2JxPq1E+rAbrKNkPG1sAZT80TszbDCO+fYFsgqpVnrEcQgnII3iM6D/enB0Ir8emY
+o0m/O1HDTz85hphVmujJUpQrj0Vxde2Wzp7luZRDKkhxIG0UXM7Ijv7g2uAYrLs8VoOjHhBGy0S
eipMPqNqhGcdg5xg35oU8afcfr7T1SVPU04OSCpwu+QqmaZf8NBTrCy9zS4sl/nuNMPjneX3y1EI
3IHZGYH56ex5SnS630Wa09X/wHZ0WBofRPZiqJXH6xPJ1g8aMudKaXu8w0Szu5eg704/inhOWcEl
7vTFpmDortHM24Q9FwJYpgiCXTjPYa5Nk5KOTaCirPuty0oNZ6JMogU5156RbV3Tvvqh9qkHEMh5
KY/yWpkA7ZzkSIPIDcpDiEFEeoefnk3DxkgPjFjsye52IBjXRq6Eg+uz57ejcijNKTqJregxdwoA
3/1/2PlYJI2AX/7LBEvvsQUXqhWZY3TENQBy0eIYEg8n+Q98hmy1juaUegLDPPfflLJwfIFciviI
kLhQgP/5NSBPeqKlJczZpUPg6PuEFGgtCCzqfoUzUN+7CndeZXnQ89lXUDgpWTtJQcfgjLAZ+3pM
wA98dNOe1MBurknBz3GOj45NQGOYPgYenQ1tqvnkP1Vj/ZD1YLCh3WS0GTqRD5l7NsasSC5XXxUO
O0KVLAEI/7vDEFRX4tsvgWfoEFp/Y9QwxQjuf4TWutudrepBGrQ60wSEItqydKBfPIyZ1vzZadi/
9SMVEG26xolk8fwjQGtWdzxhIUKQUsrH1qE7564HpOWrfgYui3ox0S8OdBwcHpkM85NzShzn0cSi
GSIvk10+vVeEeQRO7CGFy2B0rg0/NNHS2sXv+FAAjLm4Sxy33RpbbaCeYi7Cerek2r1OSSWLttkU
xZg7NqLBbP4NwJ6vKnvg3oN82YOwtzkegxFGAVLjVJ8EjcV7ldJ2wFV9ngLjjo0n1O0l/R/ywwOk
Kbdxnwl9G4AfAIjhZUIlji15VJVyB6sNZOQrWkeipMSeQ2KMdnnQ5ARdqi3x/u7qybzTSgGZdOcn
hsN1hgxlf8BFkEpqAngcLG0Ag4ftVQtKeQswIRZSWExr/bzhuzhjIr0N+YcCj9LZKt3eiE4purYC
hB8REQ5k6muAi3QNWbMt89Jjc2sqlxSX7tojo4/9RbYJPrfgYS1f7NNRLmZyfDOvf83HTrJhm6Bn
OY9QY6kcvIwosoEbqsLCRCF3wQWqNJuuZaQjmotihf0Qq4DY9QNgeZ3VWqQNBQG0rYPdIqZq95Gu
1AqGqJr1R/pWvRhwFKm6L6/If4/0p9qdHYxIbnblV8EZ455eQzVT9zPMC+EXgrjNQkJ41rqj0lvP
xlt47DzHEH750cUp5oFO1r9VMhIx6jhkz6GWE0Z0s6EY+Nf8ZCQs74wQx03IP++s0d77txXuwU0o
k0ANYxciyNs8cvIGqXd3+lXPyqMaSLb6rzAESm+mguyzwkGGz+Ln1tZO3zhg574LtSGt95RUl8mI
gmmwJ9G/O3kYu3DuRdUWrhP0nl80fue5wdIUUEavIQW7llrV8p3z2JCtg1hwHvubgGq6/MQUT+iV
hBIfuQFEPNRUDqA74W1LMP+10yPlnKXYhx+7+RqkqFcGUHlDN12DdCcXU4JLFGyWcL3lw+rpXFQL
S/08/vwdKbu/lp5WJ9T1IF3a3swkJLpXeBy1G+GoLJNGlx0bdu/63c0AAloU4O5qJv098bOa6VXe
lzgs3QnixkgfPTrs9TyaeHoGxyp6q6bSSi7jdYnF03StgpuqHwylS6C3yQjCi2jLQWt3sfPkBd2/
wYbb3g+/+8a0CTMy9+LfXIUrwm8z7eWPntbX9cL/Npf84BjvuCpVEfYkwU/NyJ0bIltroUTD6hRQ
0Ev3zo5rU4KXTWVn17lTkf8K0fHoo1g4ZSSwjY7aTVBXiaiz35R5XzG17TKEB5FvEsn9IIqoBpo0
DikgrZPqYYxYlsyNtPfnGiYliQtWjleB/tN5LXnJnzBdc+vLUOVJA23An8qWlFArATt5WdJcJgoU
cThEpINwSGYU47Kw8nWkF7If5GchVkjZX/QNqF2DNX6rQ4nOSrKpFZ/eZzTMwUFCnJgvvgcX8A7I
afBKojRFHjzauaTxNQ0WCabHXORDqcs8EI2CsTnX83tdt24twnpuXWRu9gxn+4KOg9hsIUfi6PSI
c8cX/O8ip8Gt6d2gpoTSo0gKLWSh133ACeX4vTjADX/3RxANvLb8PqONcYiYdiBBKfGrLEC35e9m
0uvB+SREo0NeX79JLOjbJlDlwRAsYOwxOcUiqYtpE/EIcxhaiFN22AfsnCVUhx8IMFMrWv0I7o9h
Dl2U319v1kRa/gZuKf7F7DrL2iXk7mAlzVHeCxER5M3Xw5OzoDRxkMMD52NQ9buVfHbFB+aLweud
4quKRgPohbgK05jgaGyO+Z+XS8MYK4sDNcfA28Tk/pxT4vSmX0Jb7DxU9tNfHiUojtWbGVWV2SDr
AuG3gAcmieXTDNMWFBF65Xl7T/4ayv4UkRL+4b/42ReX2imtxHUAUsPcate2N4EFUeEd8uMv/y53
8qHp7jhwL7hIFOfnynWdnID+r/+RIHnX+9KHMxk0id/o3MQU3L+G9dSYbuKkJ65KBJkK5FmKq6j1
ZRD3UGsINPZOGsdNVo2mOAWVMypvrNb0Qt30udjTRcZcO9RIIifyp/mWjE1yGqB1lJfqY6x4PID2
ilw3NStNz4FLgjSEnNra9d1WPAJox4oJsF40wm3NVfAUFTKPyh4OLLQouAA96xui4KKmUtPdOtIv
FGCW4qD5oKnnZb/k04QQsx3s0GNyVTX77jbXpyKcsrb1b2TiziMYEKZXuuCcWRNBi7NDEeeLKq/i
asFkWSglzFRX4LHiDLAosBpLLu/lY76qT/VHYWd9zY0jx5MgbLvFWstglgH9vh7CyuRUF8T/AvEj
OflvrWSr7rqjjSpCeu88WgxLwjopV9ELMIf4Rmm6zNQ0E/6UaxCh/VG14grlYKMFzGyEf+IQvCVP
MszWf81nF+wp7pngzVa8KitzR+oV2V7qLiWJC6u20uW8DLB5amffPkYr+D84oolcPnqwtbM35fYg
KSZtVCk7LGNzUn9N0vwKrzJV3q5K02ezJYNb9JPIiJqhvriha+Q44mLpwZl9BbI9kJWAku6IrC33
QiP8PTpySBo2d0mYVOAFx/g09I3h93Hig9sN1S/77qUS3eIUeiQ3d4lCw5BJJzghW1//lntVVoKM
iFvRObfevCoifKkA71ymH+v7x9fRxG5ZCTeUIWglXgvbWHYxDLlArBoiEXe0bUvp8qfkt+5Ugqo8
n7AFWy/vqgA9zdmnCREi7HLRP3y7faiysmLX5fYIxxuPpEY5io6uvrcpXxh75ujOPUDXipmQG87N
i6wvtg/ypQIipU8gsMjmmp/pdjJbQyn7r1N+5CmMJNVaPZezY8DATzFlJCGOMF9q4V/hyqncertx
6HfwMdeAoTEsX6MslXQLOCp3wT6ymXjNRqiQBMw7766Plo2N5U8dPqCQr+d0nz3nHsK4m5F1ETrW
a1yEhvur7SrlA/APNnUl8WmEQH/tdac35ads1wbR9g1NMqQMr9Hu8ErA3qjwhMOBeIYUPFgnL38g
V0eA87HTxB8wPuqaogm7+I13KeaiIenNEuwK1TPejShApZivhn+lKkOwcoEVINRtmM9Nmc+FSFDS
HQ8TangXxNd3BIuTvnnvbVuudB5J0s8E97wkQmwYHOdEEVD52CgxaQWarbkLRXuEyDxZdAgG6uH2
Zbgp28cVEE+pvIx/pqzZj025jH/v+o5uajO6fKNt07OwOagHDSZxF8BD1Hont5qwevMLOiF2v6dQ
Qpb/YmvXu8ha1LqRb72BFVZvbh2Kb48PK0Jdxkie4rJUwy3GQgKgmTAFBi+/Y3EY8sdBr4cY/xe9
amOpWaAuAdenpLOIH+/SHV0p49zjfw4q5dB4tLGlfuBQ8amI7W2xcgmycUcoDa0nb4tUMBFCJFuH
Ig9lAPAh9JWAo22Wefhbw0QfLbnmgY+Lk5HG8/WcFaS+atlA9BAqvlO6ekHYqnoncTsz3RcT/dqi
319mltkiFyYXrcp/mtey3yKaDlbNLXA2dMhluMGU8MHqcHm/Owa7HbtmDySEdDRxzHqxDkGW25/y
lQuhF8EaU3XCW9BSVsxLT8J8+u9uvpc80Xx3eZeyS0u1b3604lERHfHB6yGkMXgitR+hNcCvqPPb
f4IruXBZuKSTOw0RGg5UcJt2rnEavcFodZejk0Ix9ybAwfDtvNY7CoBCF8xKNLZihRJlVB5QeNjk
pC9WiDwZBxiHp3DPeEowUrmeqh6OZigHdcVf6PzyVbr0C6zSRpa1t0K2vKeI4p/tpNwdvBpNU75N
keZ9PCRP3QU21xDRWEAlv80ZGqBMInD0lW5qs01OT5M8nAhv2s54gHmICW15r5d0Qd4BLBkhg7TJ
PJVw1bREln01Wr4jd64QCoMIaIcPYuvjk7q/bQJrMnmdrG/5hzxZ3iDW/OYSYQhbYVBlIBAi9zka
lhafNmOgEVGKaa2tVKhC3xaIPOPCavS748DcJTFEXQfUy73Mzewxzr0uw6QljItdf/IN2PWHJlcD
wWxZ+czQHf8laGoSHlyn8h+5DmU9yNkjrmYPphrB2mRLbEATd2Lo+4IGkJwPqJa10VRx7W0PupD5
RkoRQYxo+J9XWYo6KwMeOp2dWfo5leIX6Hi+UJkAoyrGCecALVzX1mq4+0No2cU/JKv3S7RPScoc
GnTYyLMumdfnudH3p9VcR7NcbUKOlrqnWszxu/MXZY0KGWZX/o1EMPJ+vFplo8Ud/FyA0A37dDfQ
U9JEKQQw9IDYZJcH3uqBLjjoysHch4UBxzbOWfAeQdlJjSaxA2JpH5A+BgKyTuFDtiL3IMtTKu3P
QG64onFnJqYKAaJK3ou7gj07qiiJLa59sljTLZw5GtpnlLeKqdMQT4RSaz5GT6upH2fcdi7McFQc
9r7mBzoM+i7CHGbAEz6iinsAanb6YO1q1pphMHDrx6ESz8IexBBfkw7Cwb+cgwjDuXzsQqHa/kSS
RjZvgp2jmryl6jrRtniJwE/SmnBsMrI3H5piFDTpOs1cmNkmy8Hdm15x1OgihJPLeHGpp7mQgP2H
3LsepTgufLTKqETnezOy54cQcAhcubOlShVaMFgG5ckooMFxPfY4um/mtd7/CMjH27DviMlDqKaR
1bSjrPbVtsz0Svyy6zsMSW2tqacwG+Zvmv9TA8zclzMr2bdR0w8OhI8PEpWc2drktsxnhRvkc7x+
8nvm/6ONXeQol6Q7dLHW6u5ELDxr9FQMbEbVby2tYMW6+EULZD5hgLX1h4X+t2qlr0ZrdlFYA3+N
pR44/hj1PulfC7cug1F+B3CEXfuSsUAVgVNUq+QjCeRjXYgp73K7YbXS9XJkzhH0ul2qAQk7hzWN
0489hQnkbxnUgHdDmSlALKVT9dXafsLl9GLA699bN2pcUxqaO7DEW37D4BM6MsuOiHL+FCA8waBN
QCoLGRnamj403FWtYX5FdA3cSfNb/HPfcLoXyk0cfkCNpEupRfi17DXagOU8yXYjNkObEbi1NCLz
QtPuVPmF44cca2lQzYASALnzPgCg7zUnc5u/Cq0J6+kaG4G+JaSB/66ARreezMGlaE/wVKPuKVmA
UmTDKclwwyBjyqlnjL8lfdzBFioC7d8jfhZReDaEyrhYFfkmX5p8+P7nr2pAiVom0Pa1YifvXi8B
XQqXCizwjh4Kf1LNF1W8ebqlfC2/3TF0v6QYsf1sANttlOO/tOeP+fwJkjew+lF/kxHDHYXrg3co
+B+SFSVhgVyc3yxmdHUKuhoSczztkYMVMYZARpJp1n94aEdZj8WDVuL1Wn6fm2wTiqPm9XcBdT5w
47FY/O4IhC7WptJrbEFh5nhiMpi82Z7Qg91ntx7SJ2wHklifKKHW2V+TrdUTVLujLQjLwLcJetbX
okspJ28q9UY8uf4gr03k2vd6uAhJUMJwAwv0x/JgKNxD+Pgvn9hWB0F2fwjLgHbAwDY/wOAFKAOq
Ri+lOBDD46HDQL+hmdJBmPWcM6ReJeQMqjpdssM/2zD938dMCdtHZmDGBAWcvMH/SJe/8eYSEvKe
Jb6HiOaL0mfl+bvHrwXjT3K+Onp8pz08myF2qjrcLszLWfrtTvqFPgrG2l2dZWY8qjrDzllezqnC
IBpu+OQhsNHhE4sp0Wwi/6BaGKXAtUl56bOFlpsrI5H0sL/yoW0aI5ch2+7t9UlN0W54OAVpW3Ys
UmvAi4C7g0QHLF0F0VIT3T9m2OprJMdLkEESidCmiJ/TR2x/n9e2L8ekVTbm7nHQ7FruMYEEs0gd
EtMKBx2bkMlicRqxVT63o9PYksuHbch+HXv+P6crS1EuL3m8Il5DZ5NX3XDcDdkP3LD8loFeYGLV
HVgmHXr/pfCFKxTcCT3YMGrcSGfyhHjzwW9EcHbNrmXt3Z5w8vNpWq84Rmd43YUayoCY78/vwO1v
dEvyK0/7lhgBWWczDPuGepi0WjJ9bzCKm3irBoeMmr0qNTizoIVigrVSg6QhBW6MPwD+XEugLptg
vfQmULMJviG9VnGxnTNqlabvrHWBqZOoMa5/k//tV98aTBZTEDi5hlCco3XsudUPefsuAgW3JjCc
qjrKeDYlcePGpmY9+JU9c1CX+L8kSHxknvqlBuQNWezwSkfBcvIwCyjYYXhnb4Hn0lx9FcEPf473
uAd0IoZQTrTWiAQ63X3iZ5hRXX/mYuudyXPMN05NwSn7sjkCCczpZ3xiPKcRLghghCZ5Vs/pcYMy
Eba6CwqLUXxq5XPDeibsC0r9LWoS2hrOFnQLwb7LRGSQlsxUEMG7G7X0sAhp3+7Ws19mc3h6vglS
YDUMxt8wcy1DlwvqhrxUeToCmrk3U5cC6EgY6WRdL4iDTu/breHEBwK3X1YE9zSrrqztcFgehnSs
n1+bCLI3JoBopSwvLzF9mFGltoMbMkKOLJoKitdGVq09HsIImfR4GEtlsduwizWPEgAT6e4tIlyx
lfk3VQ8kQGZoEAxkLuFMbzitC6+WlbcNnL59x2hqaUuG15APbvqlZyc74Kr+Mx1AJGoc9ywT5Pjm
JR1GzXtxX41RqfLVoRbQT7TtM0cJbhRRYLlsSngJ+xVcg8LJMbskYoEft34QlAoEdeu1ZisikafO
F+6KcY0xievvO3anKM08yfLr9WdVFGucE0sRi0fuNtSHhr4WH7tJ8U5lDQ2bZbW20uDf1VUmPetL
g0y44IGy3E772GGIhojQGgtr682zsO5QyA3LsMbbiZSEOsL1DG7kvjZHRjwkasdN6hsqyQZQpH5g
CUqCBToX9hYLBTn1VujtcuOQSRsk65vUsL+qXgsl39LTWtmlccBnTi1vQXi3bI2y4z4drNRci8qV
4jR+lK/8XsY4GvG91Vqrv6UBQCOnCrYBIabd/+/tEqWPCjeoz1jzZ6XaxL7YycEUtO3YlVoxCZI/
jvI1YdiElKPdJjKH/Bh5eRyBr2PVY8p9azeGfhqs4sFHgKfM+ecDtk0iAF5sgvW+VikoVFqQMejC
16EcDTxpnyA1DcHtsIFF+RtUx8imCuJYkm3dIZJ9LkQhw8Ctfgwtv/ZHf8CASjLe5ZVYBYte5HTW
arQ1fELg8rjdQykb161YVX3qJirVy4cxWU/sloh2pvp6WkHf8FzIfRmj0Whs/EQ33slpURKCcdJj
Dj6C05MzDxUIxKIWrMQB34nrVOnpGQ0CLEOiDc1U9NqUvHsRL/ulp16yAyubz0pyBqYhNdNGN+k5
E924gOK7OMwFXDZgu2dOcOURVfKJHF9BB/oOjbwVNnWpKZTIS1stznKGEqFkvBH9QOmGvblrMPQM
himG99VjQPT3ILDPv2mA0TRrIiu27vCg2kmvGV94kgqia//tzMwkn+BmBXej8me9lo8SUMyR421P
1DenTbrF3pvqYYghPoZPQrTroX0zEoEPlSsMoAy9CM9TLwF3PkiVfRLlQnp7kehtaCtLQf+s5HDE
q/uyh6WIIHS7Ugs4HSYirKnGCz8AbMtQul4s2NuNWJ4vqQpX/sXDkL07XmWo0tId5a3VkA4nMvBH
g1QgU9n4+dHvvzVWuwE2CxtabJERXLgGEcM0PoZyEG1BwLCpzwdzkBHE4lzCmYmlr1trNehqFMW/
xIscUp4AZgYkEATVgCJ4JQOUN45qlVPvj9vQZvhlwsroNpbAn6EL7mgGsARTtSmmCixXez04EExc
bYW8EkcMA0iPgtsvF8Z7luHgkUDC2rLlHdcTni4A40rnNMV28IarCHAPmiCHsN1Qv/k8An0xCyPj
CZD3VvTZCro8PA2Uv+vzVmMOxs5w0i9uu3wp72sxMYb16KyjEsMpvaGkm07EeX5WyD7ozG0i1W4U
E1GDOESfgSGafAhw9C6y61Qhp3bVS9wGAQNjY+T84LSMNAfTtsl9Dl0JeikiM/JYJ7iQ6MEA2Ifq
3zgHz96FN74/VtMHIlZYZVRTNbEw0B//Ls1gTJ8DbonEzBNzGsZMehbUlw6W4m3BYDhIjUhJuT2p
rnSyaIV3q6FUJXOtLluw3eeZEHArHdAcsAr0lWcUimVHcDchoGghy5NeUPvHAOyPcfjDrMvrGINM
x5FlwIB5jzm/vhPXSCff9xkhlk9zrknb+/jLw/5as4lOZG5y0CNdzEYrX2VyK7lAXyvdw3Qcyhxz
+Unq94dcRA2EDBRr+7VGHrE0qWU9YZubOf0DhVkKs6gskK8Zi5afqmnDHa28aq81nkVEvt1wiZuL
tYSphxXx9wzHzJA0kq6OOxEz324T7WR6MzpYl8YsSVukKLBTlfM8Ihd23e6cGKYY8CtqQShBPbVZ
nienKr/Fk+3Cb/IEO31i0PdVG4HQaBm9+ZqjDsWRUn9K+8nWMhJKjCMjZIA3C7C9aa++LfSQnXXf
ZGqXwe2EobIK8eyhS/JmP41gmVQ8rXgLWEguPJvw0mVM128gDrHl/NOXzqHVAiMdtGuZDLNxhNuL
whFcSK5UrHQbqVeuPsp8J8ivYj8JcQLX4MZ+vPFwOXvIkou6+o7r4ZwTFImjtmm6VdAvuXhzWXKk
TeEIQY0xbLE9J21Y3mTy2WWu4RNbxVx+BEhXAeaJexh0eZA1HrmmsirKyTBl4G0GAFhZn68ybQXF
HnWyeOQo5ARPCTJGliY4J/fOfdfnQoaofsLbDmVhqk3W1w5ONNGxVyv8asdO0yCemxmKthpssvoA
4mIGCWC0w3UxjGqzhHcrt2SS+QGukAxPOWW4uj9w+TlH9KC+e7Lxd8tgdJm9+qyiEZJZhrZoKRxc
gpHd9AwbfrT67lybvKOyJKXzBTO10juRd5H+d9VzoROBePVrX5m6Qlek8hAiL9BBnBAsGrPv6hDE
x5NmwZwj7qehuh8sjVlH+abw+jI+J2rTWQPhYONvzc2TSn70xFDVWzKhawD7/hHWgkCHfoHr4YNf
H1AebGmB9SbVIxJw/etwqcfJO/TGNIiebZ6DmiP59WHX2ph/2kP+ljBm+6IXk8xFoSMx63Vec4HB
s6JfslxotKDLUYzQQgvCs/eIYd1opShIHIIPxXixvpLpJI139cFx1Eg4+ugjSDXhVpUCppiY0V3P
+7u1iOvbqI7rQ2zabAw7Qw8nNPR32xJhHaSgDhyQ1VHXWcanuInFTDMztAvsnoH8wuD04joWvOKf
7cWT2UwvMjxagz4B6RpzvRg5on8vvqW6SF/KxdiEzU7rxfi6sPcpClc/BccefUVVdOAwVFUkkEJz
W6X0iMMY1prhxRx88Ulil4RgQSE3OHc/0yX5zoB5DEPvf3+WS5VZCatrYLbU6OYmPWv9/tLxEWut
mGvZ7yxx+cvz27HDQPE+u8bz7d2Rdyrm2ZuZxIg6Ysu2+MLODhD3PHts/SfQkY8kou+g4iBTYJlL
DZN2u5tmuvCdYr5r5ky2+gCSRQjGk7P8PRCSp0UQF4fig1HTNNsn0va5dPzxr9CtGx1HltIBR1cX
+Iz2l9LrCah3gypRS4Lf4ZyiJTG/ak9y+AhSF03Pvd2DB/0ad4fjR+4PbxF87Pr/8wZpA8BM9P5t
e4nJOnKA5g1OiwEZJdBP+M33Qn8bXieOMSvj56lZm7oNoG0vKhyzXCoaoBuCk3XBBdYH+8w9Ick3
urI6RN2WDI01r/czakYKFLVjYSHGU/YCYPtFmXRTxi8bkhxzR6alFchYHCXtPNB0TQT2EmsMFc/i
aRKXB6zN4z3r52BX/g1/R6wLlOHBmA6+ON1BkEsSbwYkll+HSgFBy0YCg4SxkCjHTTkNnl/rpv5D
HcfBAOQCNGiRDADkYQ4DbEF3DvE/FlyRjiRj52jL64cjbBU0ftbp4XGQ8xmQ3DpsLaGD7P5AyuLZ
yvY3WwcvFXqqzGw5iTJmTG993WN0tHdhUzwi0NLdVAQmw8MexakGf5HcfG0TGhSD0TVzQNjlWNgM
237L/PrE+XW5b6nexHtpsX4viirX8IK97ecpF2zIvPaw/0fTDmgh/wRFvMjBDWVw7/Sse32zSpMz
shunY7ExkiM8fBTuL7y+Fm/5EdtCaKmA/6Vb+eYqS2TrFs2nMJqOIb0+HJVpFNDX600fTQtYVaJH
f1W9p+JgxxVlkVzLm5hbclbsT6xsJOWg06YXxPkfJ9AWaKqWuo3as/f4XJGDJK0mfwrAnd68C9Nz
k3pKg+Hk4bKfDrWxlry/Dftnp39IpbnEm+i/vYqeqLHMxqdgudcOrpnuJT+bjCUNZf8AnQFBnTZm
9jyZ8FnSnDaaoBrpy95ziAYPPQ7wigG6tgC7TTZ6aO7K2uJLLa6J0PMO6i9CcXboVzLLT6BqBunn
VwwjxBD+Ovo1KHQdeRfSp1+MulYINESVwRtvWt54pkoEWg4lF3OQ96hL93SVq6EgGcX4SUh2Z0FN
nPztUdD27ezki8Vx0vHDuXzFRXcQWn6JuTaj/piwOFsScN+G6EHXdNjcdYLai/HctFoUQXDtu72F
YXrd8epMKcR8deQyhA5eCIzkUYg9A4kfpenXfH4zmMf7ncgkyKd3Pi6heNMYeiKzEjSlWf88Qdo7
S9TRT90UqmZaZbXPWpUHhxehfqask1OB4MuRvgnCigbOeANYVYFB+3A3cGNtDtdQCxXdENZ3IK9N
T17Qtrn33ACf4oX95pdwHlqjR7/SeEeRu7nFJ2KAd1JY9Dd4A+ZcoMR3sZPrZLZyP9eyeyxRLK/0
99lpBp2tpvFNgDCSCyTdiQIF77YnK+1zm32Bz2TE19ehJjTg/bf9cng5+EoNyHUQVPP+Jq6KtqDK
9ZgFedBTGKLrqpgDSHVomP4uWFwWWIm8KMefirqxmMU6PDIlCCYE8RCtg7kw7n78u2azp2XulA7R
Txhk/8hidgLyBQ0YzXoFLwQ6V/Gh+6RHTbW8gGnvBggwIc14k+f1WGBkGdjGHgE/XNhPXzMzx9jh
xwZf6JPMKXKSRxPWVlxw7zGSThvHSXsf/KFU9SwSSJnqc2R1nokTPBVL9bHohrl+Uvrnj5MlCdff
I2VdSIJMh2l5fjz/JlVJtKbdtYqtUisxGcuh1svK3PItbkthdGVncwELLWD2hTU9ldg2Y5/dZ7DJ
gekMEVEQW5VvYQLzUDMpaC4N+Vet9lmCchFNohUSMfWj25hNG4QPCkd0o1d3KbsVFcgy13pUCQWq
RpyJy5qev6lvIWp+/psqPWtd9xPR8t1A8iQGWVAvW9wqXudLoAz/cTNO3bKen9r9Hv5wAxIxDiOa
IINFoftZP6/aO6rTuXAqygRbcC2r7zPxtLlD8VCdUuK39EZP4pN8zWt7lKZFisIATncVmAHQEdgA
k2s4xGvx2vtuzd9orjOO4X1yT4pWjC3zZXaa7kWN66hgFuUZU3XkcA5GLRiwIyriQUShmj7MjmP2
gcI2UHPVMFYJ+IBIr5JZtt1UhfLomq6ErxpysEK5oBn8K8hvoEBedTuSlJvup1MtshxrOVZYtaFH
Qzc/gTu4f2gnyDpkXoQlz6bG6+qBf4DmLtkIJthdj9bufXoWjLg1xqc0gE5+/vuJMy/WjDkaqEb1
bPrWQTNZsIXau5ngcDOeo8BLyejmX/px85x0oYtopU0w+i/C1mtVpI5Io49sQhXVLUJZpW8R4AYH
wX/P+OL1RMICiMfQpWxKI0JFFGpf9mydm1sD3HVQiCbP5xgticEC28bCOd49rQETU7oVpVfXnVb/
BG4dvSGgCu7ExtOEQNVtEPymjRLr5zc4U5XTnJN/BwYzakfK9oZjxMC4gZbPicWOX9MI9rZtIETg
VNZ4Y7arIw/hOfibaUAX1+pPpFF/8aS/hrCxPogRyTrnAI0ghJqWwd4Sj/Ei3jPdcf0rxuXxleBM
FT1p5gIu5LJK4LdexLKpB2gg3RnkuDbB+Y2y8FzTHrNjKH0s3vy5mUpXHh9/p/v6Tpk0kQonFow6
fGy40Nq47fJPEctuSZ6d/qB5RSu3euGsizrFn4ADAt0UAiDqqxOmm6wuO11PjRay1jGmVAmXtB+d
4afFNAjpmLfRo8dSTvX0R580b3W+d6kz2I5M1uTfGWLtDVFfzskNATZtD43BYNgzetGZJS0c2G5p
T3lETuKYYLXWbz89yQ/Yw8UZMV0uALF/aHk44xu047nLuJruquX5VyG40P5KrB80dQqxZPyNhcNj
C+0VVwdxqfDeusSL1xilaEy0XmXs0psKDhRKfPYnnLZHlxrID8gQlOz24x4/NyjXNkkt6+6oInUI
0twwGh7zqLyPNM8Dh213JwD39jIydwx526RkP7PrFPXxWJujlxlO+336WIdK/axxmFRasfrQS7AJ
ja+k6ViWkQ5SpqKVp0B1sQ9Q+eChoFRjkT7irZAM8AXdCb93I62u+3MQhAfH26Scyw0fo9iBLwnh
yGXG7lJby3o/7EcfKk8K1lTZq4Wtpi1lK+6qUajHhKmVQAoYFj0B9y189UJcUjqOYZn66qmcbGzq
Q40BWuXs/E2nEtxL7RGryHPEeHyKfnZjz7rNBcACsd4Lrdhr4hfR/K28IIell+iycVO32trdQAn2
Sg75xOCay2wbXUI90LZmyUYKxPI/yOxGPOlarl3kdR/yl5VykNe2j3WiwgEGQNw10Og33NvKFSGK
oADkTYGWaJq0msl6TqJpfSJWInkhLAxSn/tOta1e+4yyh8JiruMgP568RqNxlkhnQDHyWgkRtFPF
FaFa60T/fuLih6wpmm2ufVPmq3MMk9ql7ugjsatKcXcmTMW+UDStqH/nxlUuVTv4kNayJnldElj9
gSvYiTglBHnJGgxxinDwNVKbaUQEOa8u83LfDjndUBhrvz5RxPj2kR++izykEAxDoOpSppu1HI5e
gnQ6ddDknf3yQyzpbpUY1Yzrsy+3eJVRDOmJX1jgdXCCtcVXOhusLxFsq9ZkX7/XsExD0U1uADtN
DMVLfj+C31+VqV07LKAA0byJDjRRKzvNjE4pT1RhLEzN5Y5Z9l3cA5ptBOqjNC9U2QeXLrdyEx8Z
GQz2oPqQ8Y+9o0ZlXp1br4Y/nhMiFpaA8cE4m+jr1Glu7nhEl3isQmh8E1C4nqcEs0tSpywke4A7
jTDnhL+Ms5R62JRCTDGDHvTPVgnH4ZOw4JJfi8Kr65T2cxscXXJiUqq6gBDrhVc/yHyVzHZmN3Jv
oGP5ObuUtaisdV4JlotXgnqN8X4Y2Hi7nIoYqqI2kkObmLkcCIg/3NF/hPuoa3euhCj+oSB8rYxU
AEAYAI96zABFdIGCyfsYukcYSQ7TQY4ZTaYuxMtzjOKUSerZ0vzJMM17OvD2oYRYe16LS7ENgLQy
v6qGATnC+Lo7uLbZMMufT5cp4rYO4RwcLrQ3cm5q0MXwhz++ZNukOdjZR0YygmADpAyzKztxkZR5
vfnGIdRr//a6uf9WKYAVHCvkeblxd3JXPduKal1j6refbsYDowxBvG0TzvCwotWGNacv1MwBR6fz
3a93u92ZzOSLW9xIReweRrCoWs2hOXxvi7iDBdjKsxTAfKERpSuGtzYzmnU8Lk6fwyJoAAq6/S0x
9rXByilbl2Si9GylLSjHdpiYGq0BRXf2PSVWQ36ms5TCcgTa6QWW2MZKxyll35H+wCVfTU78bijG
3PDW6xcEnjPdTydCpNYLDPlUgq+E2XTThwKBwR9pMDinGFry8WDhl/EL9XJNqm3Sev4YLOanO6sU
tUxHkeHHK5rn1+KhXfcAETAgvRrX/UZiSLAAIj7jTzGzjKKieCWGdL8JFBeJZZa+O559Qb4LVPAq
c1H5F5WKgy4uxrDAiQl/nqJWR0lE3zxAW1KEsqJyNKXjA1RiU0VDjP+qeMTESrpreOqKSBVyaOgn
XjouSqWCPL8L0eS3l38PwC9YX63+x9SB8pCptyG0fELdEdKwpfUtPvI8Fv3tDihIj33y6tjj36Wz
4ZV1uhgoCJxW/xPxtOysVxmoWilq/wf5aeLmaGkUkQOtpIztUQUnJHoG6FiZPRUYeVE4YfxFFECW
LoAml/Vhqkp6bsimrZ3zGgF2LtrBfRd10LbGBQjddCnax2OT8RQJhsD/xQE3bO+Fyof5AEhUzjVS
QIi2Kp2TFeBbRILASRvfaC7HaIcTk+u4wOAsgWpLGQXzcrDVbsOHSAmv6eONityeTdunIM5UnuRe
O9j8qN2JQTHleKiZ+5LZZ5chv6fQ3CtwMUpIJ4DIlk2lbaW6d6XYWUN+rBQTOSez7ww6gahoWmIJ
rJOYTFQDtGUfgaCj7W3Knipv3Hqna4fSv7cXNsItgargPymRK4wDYRtBGHWvNT95VouxD53eD1mN
IyXorAES85HNbAJ7iFM0QLRIRZOEdWXQ4UC0/35EyMgQlHcaIq0c2+HZ9D3iHFHI1WBOZA0z1zxN
TRJcT12nOU8niZcKfmiirA77/jphsirfNl/hCZ26ui0wP25qmlrrioGYFo7d1125GwoFjzk8zD4W
ooM0H0WKyQDiWfSKe3OzKYwnAv0O2cNvC4HL6wax6AlHzHzFSyjgAGpRzkq5baPiuudEbsidHK3U
DS1KSnkdrsLPTGEjhKvteUyqyXld8P90eNU7Uin8m7QNYzzNkyFVN5n7LD4YYhUB3XwedUILgtLD
p3QbdO5AcYDeINa2J9u46UYEk9jO1UqTeMF+VoO6wA79n3YtsEkFhNJnTxQloHbLs1OkMbFwvLa5
q07wqSjPaaE2UThKvKFaOrAN0ZSRgRS70Ko22m3o8s6e8cpiEZkD8oe0XJR44kN8kPpzijZXSbTT
cUTfEwLy8DuzOMdn0wOGrvbf2QQtuayKXOmoYuJt8MRaEMbqptNn6LQvaS9DNnSipmGXN5oh4EjD
iQ9yTmC4f6rbXX4iSTLkqCDZrxLkU+gEuggAcN54xKpI3RQSL0D5lheq+z1/TJCwy0TPtIYtj4vC
YL5ZkGq1EOzNlwIQorpFJ7Yv3ViTkQduRmKadUWAukppBt8klTynoDKaWRSs3BJfN9p2KUgIXQ+8
UAYOFhR/C2SkxzCh39D2OnVHMSNjhT/bygqMy1kCzJbXPYw2m5h0YE0GSik9SiUycb0v3H/OdAbp
QOqHDaVNe1C4+64oARLCdOk7WkLBQhYyjXEuOVjF9iBIDCCggzBGSE7voIF+jiwUaQOVygIu0XIG
6uQh2+9p0r9QpEDrltxAd3IcSApwkV+4OtUw8HOGM0Qw3vnErgv+b5Xd75TaqBeKOmDQ7/Rx0L8W
1IoYRwflmbQWY8n1W7W08YPYC5IooohKGXfcxZyoLCiT306hM4Fw6hBnM8zXcBOIdPixb8rhDypA
/GVmL+RJ2k4tj12volLL7C3ompr+Lgy86wpjb5Ic+fe54kSH9egQlcy+9Fe58/LDU9G19dY+FCpL
nH05HpVIoYwYIFOQwvPVMFRxFr809er9ZaQcCK270ntWgqwhSBgvr66XMd44P+tHzf/eyNE0jD+k
d7girZEo2y4CvLbCeRV5/GqF1O0fc5g9Uw6WBjlBgb0fUnkHAu1gUyzEsKfKaWCYxISboUOpZH8T
/iFgv+eu2tXa38lZA/vcfzPP8om0bMwE2l4erd246DSvX77v0wC9REB7vez2Zs+aP3LbxBWNkZ+U
2jjO+lS4y3DXzQz0klh/337GDmYzBH2HcEnAvGrfcmIC6JfsxJFMMBzP9s5ot4VcboKF1Tyd63U0
W3hVyMDcoEQk0HGbYlSwV9yrFC6lLph29MJ/1CqBTQa6fYGvempNHpoDh39A+XVD9bxHzRhYja9d
cEL7zCtjA4RazOQ3w/RjyoMibVzG58dkpq+yoYq07Gg2o4ppWICfObn1opNVDQEP9EJz/3vSNefQ
qSDf8KMu4eV3WaCvV+SnYy40vGBpCnDZZEhykldlAmyv7ZB8UvWT0S+hLSJk0TY8JXScyviggl33
reN4F0fmm2pAbMDE1ZPnKxrLGDT6+Fc532KBu6mEuHJ+ICPuk3Nn0UFMjYTWUQm2TuEE8lGsv+Iw
mFsNdjQWzPWKJODdQXboiqXpV4QUt+kWWExe9GotO/OiLPo68D5E2XsS1lL87HX3fxzqTJ7tPi0f
kJXX3esvrktIL5WHQWLWQYT3NdwN3EV+OUNjdE25hUuPW+ByClcTJyTuj9lNKLuWZlVcuqzBtI+n
DR+hU8eS7k7F/6PGTDOQQo/nImN+5LgVHVyy1aPTkt0zjEO2h6JKBfy++Wv4a2tsD3Yj186ia5q9
6UVooMGzl9ln0fa5o46vvHYC1dztz4Qtp2fC+FK9lpnOuSxxgkABDJzgCEMqWWlIpYz7UxDYTD9u
iuaN1D6j4nJ80MEjGapeLOelvTp05cl1D78YrPIwWrrLn8cCIoIDzPxzKsbtrJe9DacCqpmV9v2p
LS7lfUKceYVotV0b5tTqLaxEO91lYF8irbaJIf0fIHTQ6NODV6QfOrRNM8GXZnBh3K3/+U58f5+i
fcDpMpIFuIVxXLsyGbGpaCpU0KsrpC7HwvR1GwR4N9WmUU3pZoZEBS3czMjRb2SNhYkb6GKJmF+8
f5+RrhmCGTTXDgh4c2f3oyJZ3psDr9Jexr0ya31l8bGepgbI3BA0x5zHnH0/yW8iYIHg3+uHu3Pp
VPh3i4jF0itXfBi5aTi4ph19Be+wZQdLgSbxw/ow6lC5qxjIzQRf30+4U6HdBSedHmE34ilbhPMl
PlrVBm0JrNITlD+8D3eFrkNyxk/icloLjaEx9c49cD/49oeQyVmabm9abmaXfhUJrIM8ITHHv5n7
ljgn97S2nE9rmwZrln17o/s2ozg0mSOtFcGMJ3uCgdg3AvxOTKpT2EHwzCeY/y4uTIvk1RP4/bPb
/PdrLZ8UE+hpdDSEHy8BjgVK9jP9zCnopovh0K3l+RUlwxQsrwHtWA+LV4S5HA/j+FMAJ0LTC5ji
TJX2nFWyFW9BEymZQbXgz4fg/8pjEmnRXhVHusSBdSQcZzz0jkoS9xwL1DA8qGI4Lxu45TpSPM3Q
ntjjlkaCEP5DG8JDbU0/dBrqlBz0Tan1qQtgiw/7TdARQ4ymvWKlSP5YlfplrgcM6Bj1Ud/yRhl9
mCyXzOBvEjD2jKBuAVxtqBlAeGa1xlkBHKwfivg9nQ7AogBDk+upSKmICGu+0PfUaNSRjQ8cy1jC
DCSrFM2rR/oM1YScZ4poE0Dg6KifiQTUbwt1+Mnt5yKG3a+tBuQhFB9Q13e2sf4haemN+MI3EPfv
WUeRV4Hfee2/zLbPJyk5E86cfyJmgVFRXKoOGVYELuYX6Elt5jDQKeguCWBK7tdtP4GiBAEdasMU
uc6R70AtiU6PKYEVbXZAh2bC2l9tMOJb8W8jG3cuU94FlH8zit1EGqyumkidtEc6UwUzONXEL6Di
592tMfuin+d5DC2F74Eb3xEGaM+keBvjJnmcJqSPNhH5L4vVbpPjB6FdvYNwNzmwYwvrRhojm5NS
ElYlyGni8oOaVYy7waX6e6OfyT3a52A2EZw4BJ7tpclvCEY6oz85Mqcy4Vx6FQ79FBZVnyMXoCJ1
7WOmfMYIphyOKTBImXVmMT7/8JOyEScl9MCNx1GGU1tfCZdfOuFqY3UiiVrU3ipwTDiCLK9HD78V
lp519oxM0Oq3weQuMvzKQTLu7wvrzMVjMxsqImwCcLScmj5hiWkPHpu2o+wJPyvXLwA1z06IYtV8
41W1q5UYavnIvm+yo4wICWPeNMpZznhyAZexNOy0gS8TL9ZfF2UK/ovh0HeACrktQ5stkIzA2Vfq
PkjY/ftYjNX+Ee1slLH4EkwNQyJXIDB+E7eEeQycw8+/F7pJ9P/zXseOh76aIQOAIR1SUIKHm09r
zWtf6TVAXRANeWZUvKPwYjjGNbtk+CjAv2j7qnuP/MHvhqqnigIRaAvQzz9WkjmNMcK90UCy7hFI
rSWqhHf1Rh63Ey51Rfo/hdkJL+UTlR5s13ZlBgdyUbpFd8dNsp0kPBwrW3E3NAsCyL4OMaNMFEsX
gZbuTfQi56z7yxSEGSaqteO3vWOvP0EkEnTmhNjC1QsWLTCMDuGlQUdB9Mt8QxfQb0Nz7eHEfAN0
AavLG8cDspwnmdAGdKsHyWKmyMkZ3Ml0k0Pe5EOuEWpLxmUJ8/aOa8xf1n//rhRdSloHHOcO/Io+
P5s0HQzPZM3n9MNt/c8Vyzp0amkpjMEMLS92nYtj1FtLDAzlikKUmIfv8ztts+QM+M4lt2um0ZLJ
4rTlhJlFaEclbZTXZ7t6gc33roYmGxj3l1kaRdSbjwHaL6CeOSLB7vPVRIuCBNtmSGUZikOjEV42
oqVthXA18SUEVGkUtb9VBZUH6SYDSJ1LeA8Y89JHrVT/+TByYtvwPxtUmg+7/ssvJeZ96DosB+Rl
YwL/Mo0kes/NMff9SIZ6jNUJl74bmkhLCAK7bHTXMarI1EKYfypu3pPR2hpiKruRHBPhN5tZ/td2
FIg8E2uiKxbImP7wxZL68pQx7Hx0CxOpo25GDwhZSRGvSqHSYU/XIlYwxqHdGoF9OD3IMa4nbRvK
9z4t1BjyZTZ6vi/RygfnEpx7pR+MeG1Y5yjj4LhYw3EHhUIEkF28vUD3zI1Bx8AzkkuhKSG+X2R0
xWFbVi/oJc9nT4vAkmNm95DwaAX6/9T9yM4LHWGC2X17/EH7XPizbIvLhW7qW6aBJtNMvLr9NKhn
6S6b2/ubhqGsYqFVceakvrK+CentNJKsTvRIkqm6HhLtG+pffshvww05Uor0ohhdSNr6j/VzKA0m
tEtGZ/FDdCGmiJ5PfV/EqeMfHe+IF0UeuAYvOejPkozndgmjM6DKbq2EIuO831/1n2J2ccHWcheZ
AbHHNnkLne3O+YPCeTjRa8sIV0ZwQqJaiJzWw6BlPEdkB7PDt8I4wlZ6MpgM4nHDU2xZxzxlQQFa
9XCH+0HGLkK+WRJxQf3sQUlxYJgkk7zDcNFwsyPgmRldqzD0mDOMM+hJ0G1qTPap/QGvvScp0u4G
yXnADbYKjBoQXyM6U8A0P+K8v87Rruqj2qODwEOnU/OZoJDWvaFM9oIBdNSm2SxVADWMr8WcfxYu
aUipEatTrqlzLkfZTNITWuoireSdt3QVlgPcjPdODtpTuVoVwB4YxfGH7N0mqQcRtk7jQGSHjwhX
23vb2JEAmTU3X5g+tRr5YhvX4jZ1KXZxnyayOnlUwUF5tb17VbG9hSYXU2HAJrkKIvaG6E1LQWym
90OpmJG5Kje3zhoEX2Ld/ClvT0Mxxe+hGabJnBJjMQEf6Rq2a2I1b/K7ciXmOCMIAMripAljLoZb
LskYgHABPHa8R8ysd4Vcn8rnNYddUI4yh1b6xNoHlqFiPrAx6W+wn32Iy825MKO2oKSoUUvi8jxw
BKBSB992EoFqS2CEwOStJNh0Eo9U1myjapVOHuhFKjsm/ICaxW88eVwK76IqWrgIvjSIhlEN07AS
eP12QSdLnwzelmrqo4Kq/lZD0r5V4+Ku90rzxM0kbZcbd9g7CDafIpL6RTbEZ+1ynv8gvG9GfgvZ
IyW9oeFgKGCcHUCYJXFeHnTmTsNspibN0IX/FnsF9RzRMnHVOBuVeaNjis46VZ1dOZAvMXY3aKt2
egaoDEUSBdZ4E1gf16sEk7rK429fSO2mVWOlgExhywdgcnyhBBuwviAlt8fOv68V+j7nZQ4zwPyT
1HqXWV8qyJ/qU+tEFUb/qHFdZwi03nOKWM/VXlD5fEX/V122AAuK/gbTAK8nKaTsGRziQAqMoQzJ
M96Axqvr8QzBMmNPlQPRHo0ZgwTiZiM4dh70dpoMX4YeI8YI2BFVw+ohiRjbAO9ke3SRt1yqNldf
vI3Kv9JmVvKKck+AQf1+Zm6EfwCkLuia8zQbPDrh1yOBpfQwGnF2vNYWaBtMoR7b7eddeZmmQ8uZ
Bkq6v70SLMif5Isp4omPLgoa+ewcPO5rckfCejymKkCUv0woOhY4o9XrZ8ElZlho7JfW4CKh9PwF
x6iP6xywF1e1FjSSL99DwVTnh3I+Yk+CFuLf8qG85bDEacwf5Y5uamtCVskpcKJFmcZf6Cw54R1m
uQAAfPqgV0lS+CypHCKS4TYqR0pm5B5ji6o8lKf98BhpwhUr9xhrORDWgiMcgs5GrqmJaSV+l4f7
ua2g+Bqow5scyqW8q+UNRCcNXbnFknNTWoDPMWsdpubwlnE68enIP4RnKF2f9a/PQOAwigmaUvh+
2gJjUIt5Pgg6bKSrqDdPI253D4s29mMaRLLndVBdbBViaEzZhOOol1DypSeSShte+SdyVwK1DUZ/
mk4F9YzrAdqaf5+8r3swZucW6lwNYJB79YhVdIxHi9RKI6xv453RT3bceDeGSQVEtLZfg773lzbz
pnK6qX7DFLedIRPBvajOmLcZjo7qe/jNoZWtE+Q94gMJxABqniNIGlqJXX/vn14gxQ3uB4T7KMZ9
HnxoHKK2snYytkOjhSQh7qANq2kInFhwHbk6CXM47qoUswhlBzsoJlNMHEoKEGQToPyJPd2s4l33
O+qerQu82sG/0RuHvRAZURgAegIQWf8yt61Au5aFiuKpHeLw68grs5V0Um6lO61et7bDpfo05WD+
+mcrkmVOfENQpQqqOicztBUIgoiw7hbPdbQnHGqFWnDIB1B3P+HdpaqzADZwiRaTTMWwOzd++1oH
ZfpUJT9iJGamCjwx6ZL2wfUE+3RVGMgvk3yalSYrp31vEv6MVv4XFhTYRYfAx41z/mAbAUN8bdqK
No1TqPzvEyfQ7nkcmfc1N1bvtcCWQQICJ/r1JCNZg7Htysmws1i0WMiDKrCc5vKKKg0f4XrNKVx0
p2i7FvJswN63IdkrxMSNVYXVzb/KzTEGXphWA37a7co41X1osukt4snW5Kw8BZBxvqFi8O1wScZ2
+uveVo/daLNYyg9vHu91KjsWZs6nykVq4sAKDmNWqkyCPmvBcUHv7i2mix3yc0q5r5otPCg2n/lg
ijlKEPAsxiv7/HkXnrEH90wK+FvVuoVojOm/IclSGT8y96hp69q1iqMQG8S3tmo3AYoj/mWdNYj7
YDY2rcwhkDznKkp+/X7RP3552qzVb0FjTEqj/dOavoYAjglEWJX1MY1EDVpdprDgBuYsa8f7FsQv
J7EEJN1MzK457cHEipuMYd5hicYdFjr1h8KsRytt+w0KnYA7bvfYdHC5pVWgW6Pt+gf3AwxkCG6C
fLEBE/0rTtY0sEXrKi5SQgVkC/CveK7n/DvRw6KV3/YSyToV5NV+yyr3G4nl/gReM1mEQy7lE34n
JvEbnk3CPq+wg7hUUolhWONQEMraMd3JRo6brCfYe4cY8w69gsDms0oLCDJsihYaT/D/IVAKrZPf
xk9R/d3cXsr1DVS5w9WvB72FlnhwhItrCOjC+PYPl/h+EOFfwWpAjl5DgfLxGAzKFx4wrg1OobE0
aHR2A+y0F+6PQHtnPBVL1fvW4VhWc4RwU9HoquVz2BkxM4AeIHhxovGEVlT1LPRwqcBlt2T6ApW/
eS8fC1Mj0s6ANOeaopXFbFF/Q5+a2sJP7pDL7oQDZDCNrskQaF3BJVQ0+fGHP+tAWh/an92u0NZ2
XaIZZnuVBA6EqcwvIzgouU21a5HLeYCRqDd9LziaS3gOTNOU9S8p5iYgbDfIyhF27YJd5O1ZQyIS
znsNlZhuQ0AQq/xG05LM837Bafo9wXd7w9pWKUQIcJFIiybIPr9UmOJA0sOrrMWhd9Oxg7y1qbhK
9QnF32Oo9O4LSOlsWtjIVUoeNFbcMFJgl4anU9EX+b2BKUXHurTym+MGiT0ti/1Rgg8FcSlJeP3p
A4/bJ/rPfliE42ol/+Llvw0iilYXSgdybTkpx7lkZ+T9DN2NNqXr36EKvoScnvkFjgje8MWcmnqh
GzA0NH4WP3NxxCjpnHLsNbSKAjlek/CKV8T3CKY/3OXx+BjolEZ+qK6VVIXDABUtmuDiB3Mfxc3f
p/aaz8PI/08/hEXBkPyrltDCKOqJB5NKhrDCGTx/knaDCFpKGXsEqdTzGPaIhO8O3kCKqpfBHFit
X95ghJd52GvJ6mNLo7tLyA+RVnw4rnRO88fx48qAwa+Nlmnky98Zq25yVqb4f7SzE6xcUQ5h9gVk
sEx/kmprZZENg7LQCoGwXW4Z3UGb/OO2QwTzSPQR7Rqlj7I9/pxkyxtSWHhVIN+8OaCsbnu+G3lu
4mlY4HWL3wBnuOequbh70/YX9YrhIjSUxXbaNnaaLCw5V3K7W+Bp7S+YaTWfOJoJEyKUygwPzPMn
DaXt5fpfXR9kVjlpxKnObHSxFj15Ath3IUsK0TlXygtPIq92Bd6v4eOvyGWSHjWLlOe1VR8ICYed
nDG0v4tom7urMHzIfznMxzshWoZcsnyVaV7vejvIX3cbycvyNgOJQuMKbi7jv8UhEtD+QvaRpmKw
u7g9a+w9ydXFoLy2/EYXHgRfWafAf/iE5lhgDCGvEKgDtLqOkIEjyyvcfK6nxta7a//IYRQPSord
zXARkAz+vU83y99tKQrn4n2VZwJuJ/LkAHl4BBQcFEbcdgd6JRWxbHzmzZymWuNxlRoPxt20FVqz
mNyTemSk2PzYWX8qk9ks+7W4H1fMdlGpr+92wzlgWpTfddNOW4lNBzbyk4Iv+ZWITq9ad81uHqms
Iph1eTu0RRXyY2CzJUG10kEWPybp0G5fhauUpR9SSRCOHoi3ytPLG5fdyoraK5+8OKcZX6IbUNYU
qbT1sl74Cf2tBt+MQhmtLmGFBxH7funQQyFPHFR4l+I9pLoJbH9Kj8gB3Wz3qicbBCXidXQBroGA
ieuff0ZHXY4+l1iOW+oA60OQ04/pXOvke5i6fOJBJSpaeGTe+0UwvbdqYZHL7uGJl0wkrn5scL/p
coXmRosctDuIfC2G+xJXn3WfXJaCAXorSAorfzj06F74vnn5A/uZsRsrksz3H8lpZHhPEHwFh+Ph
QTPbJxf9uNc4lgRtoT6lJ08nnt7Vwnqh3tsjfhok6pMWgwGlOvIghlkco8Bnu5ETZYHT8UXENIdP
XXrGTMLId/lnncA519qHIo8oU7wykjGo3HvUbC+TOMnQARI3fB2oPTFAcY9PdDj1iXgB4G4Nv2hV
lXHJ+p6ZEVjVDGnF31jIrsoWP/XjviE4Kb6fTak+IOLJ6XGWptvMYWbaDYYJjgOtEeZW23P0h619
MXrHb5G4l8SuJ/eE/Ihj0B3wmkSUqMXASJxQSBiFoDiaMrxSSnvuQxIjD+9114IkjAGDuJQNVOpe
HUjtzrgxnBsfSDP/M1E/gacKK1UhwgDBRVa1J0i6N3taxwpDXTjqcdOiD8PeX/74RXiOsm9OoXTQ
F1ANYH0nrOvxbF2sZR1gsMqvnOTT8KZTLCxLbfMA5/pqIZ40uOWACRIttpiV1F0dWwBK+3lcDZU4
rwnWPiIqfWoKP51Q0ybNqB0jTVAKVWSavM14FqtMua0LsDHk4U7AHoOpE1hr04LQMkENQpa2EZZZ
CzFwx+peZ5kD+zrcKh413Ffprw5otgqXNFJZXyAK1eY1oInBRVQhC3MCL2REPi/c/DyaKUnI68El
phVB4DrvR5ARD/qvQfn76eduDeTqdK2/SlLVHu6H0uqBl1M15JvQxrS4sb0z0BHdXYqOlveKV4gD
L8tHd1L31Dtnrz87XyUYCfDH327uPl6gZp0WSPdd3NXNR4T8dAgJIzus/Qg3pxsLHSpdMcpF/ltC
zD4qX8eg8Yy3F5pdlWfoiwtH9G45CXtY3+ayLjFwsb0BbyRfaT0vHE19JOwuZdAjT/3TkwM3xUWp
vLVwtZ8T31p27QRODRNem9ocEf9r4Aq6lsxEv4ZgrV+PHX1XcR9Dxg3IdOen/UR7gTk91vG0r7i4
foMmcznt7zxRPIY4CV5Nh6uGs+2K95ASqeGc6wCgre+ePQodQfc2E6Z+RpmIJgAUwLuPU+3nCOy5
KfO6txx18hXJgKEs4NgsYP8LOEFUUzEbGadGr4bQFyc3j66wCHVnccG79GoGaSYgu2WQqsk/ErWZ
0tJxn43g33Z6BprGeQ4bfh1cgLvq5civBCNeCCKj2vH/1cVPwclTxXH1A3j41H4fEP/HzYDgqojP
k4tGX6AyXIt3X0ZyTMyADzlIt3vz7Mm2HTQCiQpuZTBcm59t3Iv0k5wtk7gahNzZeollIQsCKGYb
gY8/vmuboNdkAJrI2DJ1chKG41URd6+lb/agPkxqIjzVprUDcYjslMqT4h/WLF0EIMKDhRRqLrUo
g4DHUlvbR+16DN0NwOXK1D3k1slCbFRgvFx+m7/WgktaNuJue6RViC04Uge9LsB4vzwTgktrHyLe
KygoW1epfcQyJKALgrBe6nU3SOpEowe+9bHovWGL2pJzLHfonwBCOz4s+UJ+SfusOyayDhU0UhjU
3UBPJBGEaFmvTMks3ijwNr1rBjRcQGpTHW4oL59I0yLbKmk6bn9JaFQvhuA9b8kqXXVfxWPc+uf/
AUopgfXyQFBtbrImJAjpEEZCqf+XBjSDCYjCct6jpZulrtkunLRiEl85VEsR4ZNYdcPElQtjtHSY
ZDJtQMEcPe2SOA5izBD3znNP0JkCGnM++6yhggtDTIRD9KLccveQAQvRJ6ZvGGe9eCTk1oype45b
uVupN96CemsrlPLRyRUhetyfi2scoat3BAYKIAJiCPIY4aRcBXpYnInwscwQNMcaL3FpUvmeQBa2
9qI5aAhiC8lJGcy0HRG1WhEH0uzo3tsy32DiXpJ3CZ1D+n9TJOwLKKzuOhS0InkInhMdDTP+9y2M
WgJk7tGkuiXtLL2fGbKSdsKjjeVGkN3BYIPW41oCjHrjGbdqBAbGfRGPPPUsLe4EsmHUgAa9zoS1
xMOp+RsO2YF54vN7bSyqDZX0P44LvPl7Dmpxnf73ciqftXkJsXLD2fyOD0xOgQK665c8oN+9pcE3
6RN17sr9FJqlflAAPwytHkIWYj5VzGpOqSRPbSOVM9t078oakUTawy/YOyNPV+95WfVdQKpDybXr
oPfY/byREuStLDs483WXgEPlFQ+COPxY/a3ZuiIUi2OkKskJYq7Jh1XcpJKA2QDAF/KOkz5Sh2MM
mFSDHxEGMs8DLsmy01KdOwxpB6IPmlCORbYVRz4LU8oiLtF1nulRgjC1wHSsxQbFVgVzzNttvuhp
U+DO95/ArSJm1Fn9LhqWLqpr9CJ9vZ2n4mh0v3KTxzw9/EhGwYQcv4r2dUNSs6cm0qnDJHr01Xxu
KCUQoJwiWBpJZ6ra1yzjZFGWDMZ1O+4aFVPakWKnO8q5RJAQg2AXRj9O7mHtoivi53Eb50/9Hed5
MUPgnHoRjCqW25man4dMMGE1A+4A7ZOAS5k6UKgZdWUZCVJLLBeXNFkLqBviKCrPCyHO8bnTHFBF
WXhig9slhf0REfRw9bdvHzHUyga3IWcDu7+/stQPXqz/PcfZOxlVCfh02H3zhRIW9Fllp01XRLE/
4KYtB+852pmeVH2RMnZVT7qWGwNcLR3OqRJyWLiUSNYGSa0cD8QSntlYmKHVaW8xxfWtp9/VEgHi
qey8seSOlxSWWjC0g2eo9d5pZAGbjKYGEXjim8FkgM2Mcg/P9uEfIgx0alsL/4HMSqFHV/HX7VPY
z78Bky13Bi7OpshRbk1shLdlu+szJcDozcCDVyYxmxVN0wdGz+kZ6iyzhSGFITTqUIB/Tbc9rgb7
2inx4m7AlVbpYy8zmNVCeJozVubSix8SQSXYb/GzZCVX9zTcIF6y32UhPAepvD67+1fCFHrw/OEL
BnTsA1/EE0PW0HnY1zxHSBIPwB7oAOas82nVKfVRMnuRQCmQd39ZntALAAUvHyRi+0BeZteDf6yp
alZyhvI9914Y7pVbyKUT6t1zEY1KyAhnAH/4KaCKoG+d/Hw7TnuRxln7IoT4Lp79E4W7tveRJVE3
NIJgX4+PwzNfThcsWW81bpOkuQmiYzE5hrIYJdzvZEll+RrYrT44yfXMVNDdRlVszfZfsKg/aaOI
1bYS2rPROcV1Vf0E7lmwP+dtrGq8UrYUpROhO8ElVeA3lrdAFfA5TdjZ4esGiKjh1fhnaiM/VEYR
nSeqdGhpYv4GCZVDUtvozjIqeWmBbvwaa2iDMDnctNglLGi2gswgKgpmhziuJiL17ikQTKkutZ+n
wRh+4fE7qX4TU2hDuPxcTSOLBUXzXSK5omQUXUdGkNn+SknX1SfP+lpmAFDgDZ5PpKhhvpiyu6XF
F2R7sCX2NPxT3cd04p36wCVa63gkZTp1q6DRDjfyRe8lQlUUZQ5Xxj6nxjVKNNv8b1jXGtqg/B6p
EGreogvCa0/PtVznceeXZDItuBS3OE2jPqnd6zzK/WRqhUODXdrjKXiWx/0NvW9YKKozd4yjmny+
T3FabnsEQiJbubNj0FhERyLhH3gQBsAjxZ+F6+nVNcwJ4pttT4YC1YKDOqdMFnLUnbCou1Fm4fwe
C82NxRjo+BgeGX2ueRwz6y51Ie93aF4Xc8cGBWtI3R6JnRF827ZYsS3cZL0EygZQdvhbp/wUtXiq
t8xwfi91xPmstACTApdv2FTis4qur61pmxC3l0GHJ46oQGGzZHHorchWPW++VN6PANTGX75iO6Xd
G0kG39P90Vx0rnaJf76b1t/MSOjOVykEUymlmb1G8EyiR5exkH4AAV/+mgxUnJowFqRJxFSeNLZS
jaqhkJfnlRICzvaY0HxyrKWEk3rIUC3KCMocjsRgaF1ArV1Fb0O9t6rySNE80cBQCIizb7su4mQf
QJN2tZzYLy2cbxQ+A2iACiU1FMbf/fH7ZAqBHcXYv9nDMtZwYXv2EES+tsqKzPqoRVm4gFHbhl9k
kGDMY504XpsBekE7PveFYbkEVdLg/42blWaOLz9xrdZa9AydJq9/AYQdHf/OHGvz+DbbX/mLbWWJ
dEiml4IAqf0RzmZ0brrC3ABg4XsaKgEQ11DUGeZsQOBBM8xBqFIyudd0PjB4T9n5gO5icS/O3LDY
MAhmSIpC1tEAGktPWsTawTdYKxHltAe8aoz4+m+LPOuAAv7J2mnofV+EwoyOpCjn6Hn8/1NsSfF2
WcxVnjf3bQ8iq1WEvqprZSLoSoGPByin7WFUs60mSycfPB2lJk33dXV4lGHBja981yptIUbV9D1F
wZPK1GGRp6ia72DQFh9uVdCFkd6SelLhYL30LagIatRFdSMw39AZAPf/QpzrPmUmf/RI9TSkBw5j
g6qnGZaH/iH1qlqIV7IN9TgK8Olc9zWXLtUlp8BH9EHL+7t2bCMKBQyOkgJzVfJgjx3M7uYT4Kml
/bj4jj0LoCMKobbQtBbNwAHVPvjSouBQN+FzNEFF/B6KtjTpCLaPYtC9X1BSvpRB6WLfFq60lXWf
HKxYlC+9OLc3Why87dPrCbgNitYsDoCuh9JauQ3drPbbl9hxdq6NkxfPncr0BwyIppWkYnMn85jY
nYkycfD69NdZin4nnkvCfq/2ULKNofnC0CEi/b9/GYGSbGxfkehNFnVk6jSNn4TBkpuQu3GLe0Zo
6n3XMkZ9C1JB8D15Chg/GV+ndX/RR53vQNGqUubmdFTWiChHKzwKEAk7RhVUReDMZpWoQeKc0FTL
IIpUwkeBbyQWdti1RKAH+4XPavO9AoSFSMplrh1iE/UF2ZmwtnND5xA+OSKoRZ9HKqNLJDNWgTzN
ZmK6UYc1O3MFzWhou8TsmPB7ljWKZogA/99WkkNVHq2OWeGWFIkzVy/PbLrAjU+efb3yjzacS99g
iFOirEAGNxs+hx7aY+nT2EZux4+DwPDk/y5J5XQhLi6vKOQgRhHGEVepMO6qn5nWmPLFvT2Ne9Yh
yHxh3MtaFbuXQIEFdLzjovzrmwC5V2a68iitrFyXMgiu9VNhs7H+myDe2pKYHoTefBqs2R7NNVvj
zMm4W8fwy6mqUQ6xRGdu7ptZ8yAwySjuS5uD5LwWYKoGsJ4MmjaxLn01UzLctHWvQEwuHWWM8mVV
HLDN476B27GDf1cCnjpoBiGNoECOMkSAZIepUwYdtgb38dIj7QksQKDRWLsXo5KiZ+USrYPJrgDY
oHMJ7Y9XVcrFTsrC/RxB227ZmxVCLJqtMXCNkP4n5xyIH1S5E+NqcBTDAlMgOnIWrwAJkoRfTcuf
IqAp2CIlRMT3ryYFMdWJFjndFtbjasNKNVSPC0tmk14xU5xsDohehDb3RJjfWzfbQPGtTw5ezpql
Pa2aO1Hb/Fy8Nyvqd2H6zQQ+xZ9ZLVdXNRmh5N7xv8GY8Ey2zXAW2vQNWzKZDJnkYL6PeGcbL66A
vxAbIIr31c8gJ+l/JE4oN9+eERFJfl5YI1hbW0U1yTMVAL/f2+JLF3WhdgiZVJI/++JQN5OsQF2k
Os+EkVcwoG9QbMwSMJ40GnVTg9yyqRLrgkGTwz47aRLZ1m3LCTy0Sgsr7uzdLKqM70qwWaaLL/kJ
Mb9YiGDRvG0DWJ6NJQBiCHHwQVMwBD+xcMGA37RwHyKg0bPSqL1IJZhvzfsN78WQshqyi62sCKHq
y6ppEOsX12mTUPPme1oVkQnYebYxGxYkm/Lcg7Tu+leeC9+UPqxPvZ6lFEUetT6yioZ/pciL6/Fi
FTbJDELISVSfDi91N9QgX+DVg3jomLx8EG4Uhsv2Z1W7UP61x1gOQ/kiNwX7GIVamkW7HKeD2jZO
+VfKkKXtGWBnBdYmgQUjR2zDdXnNgkaAK5jb8bErAvgBcyMMLij2Qxiiod5y+AnY1fjb607X2xgu
Wb6UWskLpmKPGBQS9BvFyA6FD3k9iYLXVeap3Jq8UcawzCFvi1ZE3Xyrity0yVoZeNCtJS+xpfwi
3Ep75u0t0QYTHb9IqkFI3N7989oI1kXzFjHwTgzC68SLi/oK37jaAnLgrVbf+yFlUoeusXUm5f9y
i04DHSl+UuwLA+luV6+3FfLVEgAwXg1tYQ2kpuGnh/T4vMN+x2oezzFewTRXc5nI2H7O2bJ75xRx
8TuxEx0TsIgLMLA8ZSi6NOY7nSquUkK1xSok3KQPznVQ4mEulnhSe1IZdhJjBBiFM5Xf4ErNy8EN
fwOQms4F3J37xf6TAWdLAiDUpP+K4aXyeJ7m0HBJJ85fi5vtCaNFvIBl6LekQiuhnb88y+dQxtlM
2svkQIZg/gLNaicCvdxobEGWaYqICNE1Ctty9nZg/bQhwbDrregIkrqZh3qt4gHSrHa6cZNc1Squ
VbqRM45B3wb36fkUFM71boZluXkB5mxM35phN0mfVVitJP9AsXEmhJ1SXocwU/zKcMcNgCNHQSeP
VSbG42j/qjnRodv6m0nKVAvh0PKsBENr8Y6FnMNmz1zdkvJbozJ+/enLYu0xMORJ4j3cyYHagvjK
rRY1yAtjXoZbq+n04aEByDMsXJeJS3p7oqvr5jPfDEYNJH6h4Gs/SvD8ukH/JOT6GVYXTmAgEY4N
CyrCs1NvzFbz1letzmZeU+JO8ZhKZJwAqC6UUmUOB64l5rpwlXH2PhZE+p4sidP5LfzCDgyIwBGt
yZ/N8ZTRuULU4Blh1FLAUJoOVPus7VHsGUuIw7XWISSJte/2xFJ75lNbooZ20TatyXoXQejVUINu
LOKinYqXizsj+4tT/5LFySbh8JWMa3STznugSqvLJfGga87qND/81X8ZEVUClpi5oqIMM//08toA
5HdIaJ+BRcA5Wul9sUUD9yi/zhhcnoFw7NvXx8z9EklSx7Gf29CdbBzzftK1kntTUJ7WXWQeuazh
kxJZ0R3x5MG1pn4X2pEIkWtLElx+zBu/h0nDCAmQfccj2bluD6EblvWf4TdYw2dLwOBCT/17l67G
bPxMjZ4pLyay0XghoJ2Zgm6JN90Zr6yNJT9aPKXjCB7pZEFnV/fGFfbf8kPKofUzJNGkmy+0ZgfV
A9FzpHEmdMMjnLc1pXjZHBbYXPBGVJqcMpsNn2g/kF6y2QhZT37ijqFhDlE8qBFU8RhHXyN0Y0wn
NH3Sin+OQjIqNK+yz25NLzhVsYCz6P5sHxqMkH2n2vj1D0qaaKS4DGbCeWjhTSnbpsg5niG9j3PG
tDyr/sAmwTuxJhsO2lBz0iiOjOkBylz39QBsALuwnh7jrrH36z2GEuicZjubYPYbQKySLG30gf0E
+emIJA8jftcYcUI5wIfoXgi98o9+Em41vFz+SyjsQ/iUPo4BzsBZhQ+A41//WxleVlSnb2xUw32t
tbUPHBOlRNLP1nltbGPJ6yuoGdzY5waChLy9M5idSVnYHuBjmzWTm0333pb2viCachkNDUne8BBV
8x1HbIuZkOUwlXukAwLJTA5A4bs3h2EKgMKMnVJLkVtXLHiEgYpYzECmNWeQsx2Bm5c7XzVB6rU7
pfvtZAE6AXW1WffypwnFAIgmBsVOuw0PaZVp5ounbXmcEFumKi/mWEHMWm1f107ZII18qgvIE8i7
hqm2dtmQTkWSFU4pa3UlDuCxxOKFubJVG98Fs5Ck0FRkikwYVIbGT0KlX3RL8UMELwNmxxfIwTpM
MJU5ZNjV78miT0tSJOHlMeqPWdnJjPTG6BVNgq9dNi33TuO3EwP8rIOxtSPqV4nSDtQ88cbv/dJj
7tbk1m6ELpsIIz2oh8ovdf4rRerLJMNNa2Ywspg2HgXKshooTdybC+KOP4Z8+xTBYKxzLlZAAflA
I81b0MuQltr21pj7A5MwxTU8eTCm5aOOXOVn6/FGioDQPEA9EZcYGBtR7tZ3THXRaTiH4FGVQYFO
PIm8fbAlGZYCtvXXtK8zu8X2II/fSFOLBxmGaT5SFAxlhuy6rKjXJR9rc0vaMUwbEDkDWHgTl4nX
PTnM6dWgQjK/XQnZPloOnCc1e/c9nuRdvAQseMolY5TYQ54aboW0KONwODOOYFvsnrjqvBhTXrve
4WGOnwWuWqMA2oanniGznsWs96i6q7uUoZ2quw5ZoX+Y2b61tsJrO0Tg48QW3pFWkMAYfvD8Fli3
Lb44Z1UAaC9PEMXEMW5oPzrCRihf3Cw3fKd+RD0Y6AFQTTJJhsk/x6tTdndqXs/+2DtFUWt/k6m4
lmbzAwhkIXB+yQTzxSvSWFOFDxCZIuJgFtZggXKWnIDzzS+cIbGZBWtATxwa8VXi3gCjjFsJbXpH
zcYEzrv2mncZRYFsTSj/jyGOKW8g63z4jM6uRj9ILr+pHSFs2KfIM5Cgp8NTva/ISeVwamjI3tET
5JJSksFfV8SHn09IrO/pMwRN3bdAr64RxBRVKe245FmRncBaEs2WKtTmKozk8EnCcrQi2KZbHBGD
0g2i6z3Mg+bK7mESFR+nilBXG+I84kRFghPs5VtAbWIk8HBdUPqemWticmyeflXOeqduM618Ci9x
8iMUiIV/VP+s3ktExLvqK2ErMFlSgVjEgW1IOSw8DvMdfXP5Z3WQrheJiK3OV/dfTLh3drQyaJaH
nDn0yxqYWsaKeACh4eloPA0bKX8cRjORDUD9B5I8JIfWnqUokvlv72u2SWB8IKcG08Snj1n2yyoP
T1vMrIclgr+OU6TqZWq3xuwAeqOu/8m0Md+hKxgUEI+lDAm/GYLMCvUuQ+DbIlS72Dy7jmxCP4Ox
xKntrDNVoivgxjamz82YkYgBe1IiWmQidJtd40zjgzlWDeHo7LvmaswFGqkB6K/XemF9rK58K6Hf
4Ppr0oQm4VkAN+tkiGVOhGS7uRXit3EftIRKcu+uNOEoJ9nqKkYM+bxGBYMqQoIdCt9593A85EMU
Ng5V56CkLTwgkhTRUTUHziqUFajPHY61uFvGLioQ/Yih88KbGZtxiMCs47FtSVW6ObBBwfdQFcgx
i0FOvgKIi1KoNnQNhlb+ARQmmYJFGMx/gkC+HPkO7dtn9hoLozS82nhsQ4ru5nZOnU3vcm5Ht2QH
9CXuuZ+tD5pTBSxAsMihlXz7pbScX60I90otHMdySAw806ZoHb8lVPCETK4XaLZ3v/wFdNJkjhtE
QjISSoHj/e6S0gjVdzPreYvrQZyrbqWyGvHv1657DIUohWrL4kwt2PAi9mlfW9WNQ3g7NNVHyDMk
vMKng8gZLd2LVWostpcQQX5KaFT3/8tzAmYF2dO3Ai21DopP1TM4CbCiH8UUT7Tmr4+Y8fejrftV
GT7fMFDuMB7VCUK8KJh2qLZwSk3uZL1iiPyjdUhqvqrzPwWBhMAgHp0Uoo4y4Mz+yBPuGr6KJ+kz
sEnmlp+8upv08XF7y2YX7sdJR/+cxW4qGGabmyNAX6/89fzrVQWiUFP95gjpv+WguQ6DAFU8FS3Z
jHlQyee0idxTPoyt8o1n4Ckm3mfX4Iu0mYIiDCsS4XwRDQ5nEA0/bN7q/fgdU0HWWbTXrtdXMFXl
gQOHvUaLOI1Rxa72PKXJ51HlgGLgwC9Mez4aKAiXi1o3jDIyVJxnWyc4okGipw6GyDc8L5VBGKWf
5NjDat+hMWyoHIQS6kD4OybVo+j3bsvXtgn8ja5IQyUOETnOFhK0gFif9nSC2Rja267zQJxCj3hq
RduxA45hrQ0ucnNmg+/PNpkg4WiDATd5X+RvYpZKXvgslqxJ7UGEpYqZU9krt9381YSQo7fBPsdg
UDx48KPZrSPyp6HmpdrygZdB03CIMNdB4d7TmW2BPrH3irVUguBdhnj6jMeIWINyhuUgJ0Qwd58N
K7R4220fZMbu+qKQcw5cE4co9WGNRWM/zKObqkyUxMIf0KKp59uN8SIPqBydCehi8rWSh/fZWGAp
k6koRRgJQhRshBr6elDxcONDtGp9j5SdiACriG4+vzGthV5RZGj9Pzu5jN/eO85uSd7QSOi5DoNv
oxaiAz8DT0M1VlN2vITf+kW26gX3GA0MOKsPpIcWVKRhJJJfuiV7upvRyhR8HV5Nobcw+tkQW3PI
lj28/3C5D2w9lG1yPb+RZy55A2tY52VMo2UWszdr6mQtfE5IjNWyGSDylgM4WmWyswFQaz1FHmZ3
NNCt8Vi5jCHp9UfcZpAo/yLqlva6b3UOBgrO8uDZFZdv1ANPHWZzaMWz/TTKSkz/jzyBe064B0rA
+te7jF5gi0QIencPE2hk4sSZnyVpcCcYikw07DJrar2KvG8tjTuR1j1BhQpjC27uG3gqRN/uZlnA
1DpAgCfNmkIqcQa3MClMH/QXhTpQPxxNKrp6N7/kBkDwu8LdyP/AFf+TsWnxnthw1086ga8wNKNf
6QZFe+FYff51hrEusnmlyAzweroRFCFl0Q8RmjUKYOBALyvfogexj6ck3z8uuqONtzMhiGLUJyFt
ngCu+hfb3bqBB0oE9thwfslNmbSgcaND1Bx+Rj2gkkHRVow+4vewBVH3hlkjXt7VlOAAtHx5eNg7
RoTvpZKbxu59rrHuI/r+dJtx0QCb+1klO6JFwHL7TgeV2USX6X9sK0pVZtFot227DNtckB9zPskA
1gHpG0+HT12yxITiRbaHBvAuh3Y3IQoy7SbL9L71PXiCX+V2898PzlLwiAntl2iuAgFqVZ7NkWzX
JKLbRfO1FOYwvaHkvF5OX4T2RdN4TU9d8A0i0j59g3uLl5Nvq50ulOd+d1U0zAl5reTiHDQXJqTe
qQhnGWVvxbYKDUYCRCMEBu/WelHzuOTZHTfb2gNhKLi2zM9AdAPnvk2DRNpEa7sAYfJerBwrDX8B
hfXRe6F39azGkNsB/Idy19/ltTZVAtbUWGDyktk1rOI/mzyF+x/qu5cX0hVLutt2+W2jb8OMH1zT
L+vXJN9KfNDqviDRupd1iA8VCUkHob5z0D4RYFFEb1vX7hnN3Mo+xkUKEfssUI11X/E4VOZA5AzD
iC0b3TDdG0vIlyD3aPXwsDW+d+S+VQJZXWg7iKSL2FMh0DV7lVLECbE0Mm/DBqjdmAgzp1TQfFE9
Z9lsR/JX40CAkWNmhPlhAOWYHcQhOMa0pkBeEBeRFpb5DeRyZyWE/Lj1haFscf7NCZ5yJ3CAkq4+
byUbTnlpWjLI0tugNKWnQ5JJQwmfGz6c+JinxXSj+VIqCllSF9enM6IyOgvgFucvhDw3hEGBKUiO
Zo//6GTMETLax4r1a+efa8iSospLfxgZnVQ6Yt+KOEsE9ZW33tjZVisJ4kOC4vUXz3vHgA5DRaCk
NECbIv9Luqwo+CVSHMQWZAGKe/f2lwwxq5SRBwbKHKbOgyqOb9dXSktTQSWYrJZwYe33vnJJF6hk
q6wMLciwfpq1F3hVXhKIRK7kgD6JsM18pDT+w9c4GxEvx2jdgKlZVdpFvuQ7DAtprcqFd3BnfGyw
aBMgWUxnCpic2lOlVE6Yz6YouYO5NGKyS8TwQyzFYOK+bLUEb97x/xX0FocpOeC79AjiSUIFY8cX
QlxaASGW/ne5yI/dvBcoSBbFn4xm5Y9Iitjlu0CUKZeS5LP3H4qdLYIIwT1vyHtONHvYJ0a8B6xe
+Z3a0xHkQ7rnGCXwNCO8p3wTUBzitaUl8T1E5ePS6C2XlpHjK4ryOrHb/8+jvLFBV39UrowArfye
Da3ubkgHaEbONPU7MV6wmjpgXDjGn9Pq5JpOCiBHPy5kYB5lrbObf8BDsvziKw92M+EEx0KsDeab
rtAIqhC6ct5zvl6lt5xrYoEP1BHqpTUJk5zSb+6mxAbMD1J7BSzy9FokwbJoJ1L0QxVa9pv3YUoo
HnDxQLCfx47ZdBx/O0J2LnjJF2k6rkaDHjOH7+3zSpwIMWAWQLHKrcXidmadBViIkySruuwtJI9g
NEqBK+oVaZeufvijlt17YZ4Cbx9MvUALf3YIjB1YRgqSGsMHAn2DbG3CFAU2JQHkruhg05rPWiS6
HNRF4SmN5PGlg1OOn9Bvm0ZGn4JmSbK/ObUFkS7ZCjKaRpSjDqHvQBVx2gcFCWSahlCtmTOxTIOr
VzPifgOCR8CYKikdNGHnbsPq5SUGktHC3jNyaRz5PYjdvjeopQjpgxPO1oFArs1zoJfAYRN2skfR
X9wOpvRyCHFFDOKsEbkj99kkRjCuWXS0JdYS06qhnDGxebn+/WmaPbqehu1UkND0Ro68l39oXDYD
H8H7V55FH3EAo8/zxoqM4jU8z/yUQRT5vfPvVMNHmWzC4HyiQ1HxG17Gww66OMcuNwlNDoj9506q
8Oiev/tSL5B1U7vTP4OogK+ucuZjXWdVzUWicDTse953cEl4i434Je/SkItTW6XOUKA5ZIcvFbTM
FOcbGheaX2SN+xbhrN+Wol4FUWzyNivfnJDIJWtRdYWDElRW9TPsCSDRVu16P/YXcA1192p2ACZk
VmPIPCSvxjCwqxCRF4pnqC7qtorzvC8k/XhGkVcqABMXwYH4sJv5CQu3xh+DMr6X7566Gnp5TWk1
JPW+0sXaXauCY1h9RgqCXmBJTsEzc1rPf5FEwzSIGPtCrMHCh/JS2AaUlEqDZxmMsCBUeIgbP8ut
ObS7q/lvFYUIjGvToLYVq3HrqXw2UlJgG/pCOQwRmWxw5qvjAPwOXZe0OgOLux0h20JZzqpKWwaM
pcCJhOrTgY245G0xekaLGQLBMnheZASdSlhbfQKPB1GYPjGeDblxWdbRHDRoRZHGFo1sFbqGS+P4
V5K/uLFMocWJ+y24pxsmkfrHa2FiM2P3LuP+qhvFVipXDw35/J3hLr/HEX4H3/QLhAZPExiYDEth
sFVRac8GwXRE+nr09EMzYSad8PfxKLfqRvMAUJWyduaNxNl97XpebbSfRJI+XzobuLc59Ahih8ye
W5ovc9ozilBewunA2Q1qurMM+rHMKQvf6eAAsrgTl1rSzHltONHlrkSNbMMAczBtytVvtD4G0v2x
jw9id4Qc4kzs/06TjV4p8crcBmqW81ID/+3Bc7xc1pam+l56kFxEOvVvxespyi6k4M4cVmGQJPfz
CAKQoLyZ9Hw0NW0Fi53R+5o5jeotHD85/htYlNB4tcYEsHaiqASQFo6qzd0oM78yhDogQHIj2vb0
628CvMjMw5UPY50ZcHqbobXlOoEcxsGPXa5dRvIcdK/XLuqmLv7jcZpGo1BHqccc3I1iLbhKdwSv
pF2IIeW8wXSB4dfNsap/ZFeHQ41nKpmWskyPaaPltEo9rxvKJ7M52VMdtSmiJxD7e8ff5baHu4Td
8YOSq8oz+sDht8V/SVKiY/ZroTL/SFCzGSHv+H5fbF051aJnFkQlC1SpzUQhhmKHhM/fYvCYd5ox
Y7Lb0VjhzRG+5qgugR0IGkmnr1jJC11sHkQZZIF0aRTSynRCh+Ep9cEwTkfYrU1NmmdiKzi/tIV2
RNpzT9+j7fmNGdwuoD5slC4iXNlam8Ap0Y5W/+0mjdYOXNDH9wp632GDVcsqG2DCFxBDBsJtpli7
QB4F++DB4zCVwHgW5BYOLdvOsZ6IFohMnGRfXPesKQx4T3P9P7XMdjr4B+JlqMFbJ4LnufIQTYzr
fXKrCBRbN3kbGDc89Q5IkMHkqUR3xmfUGiLVLeyinVVpOKaCmCZeBaMKBnluHAyPsuh0ghitToCE
6LCu21yaAmn1ap20ntxjmXO+at01ihgcp/gDmrBfb6gx7ZQj9W7URSoRAiokVYaaU7lFvWSpcM9d
Hyts3T2yjpvv3RlDstvCHWm0a2cFjTByXkcHqqhxia7ajyAb/7hJj5IiuUA/bdblDVwLmdWEFX46
vy8Ol3Rjqh3+OPTQsxyUorGpysfFZoAyVAJzlE3cTgqU4u2+5y2eT5pF+hPjb5Oufbd427bkR7Ut
24BPoFNfrWUMXJnR7RSIRYyFxy31W6znmk1IxG70FblZdrvtWCvg3o9CFIVUTbQ6gVkEXQop49tn
02fKPCqk0jklF4w7e7KkN0TFd/MlXBDqCiRGYt6o1yLa+CugW7GxUr7VQ4oPMTMlCFloKMaNaP/F
MKThJ8MTT7wQGdFOl0GWl2/ayMjzg21D4udru6cukkx7sO2uQlMPW0R8AMgPepTn59N2dful26k+
yXVklpq3QsPdBGEs7fnj1tw9bB5Gz9TqmKYPZ7sGS9AiPZyMpLTU2isgMQRpJNteYlxPODNzmqFo
XQwkR3ZPwJp/3cEFSzgNmWeVNy1g31J7ZmpT99iKVHADtIfK4nBh06dgkGEkFqI/9tVGL0qXKJxS
uMOK/oOPacXurqscNTg0QOvY3Bcc7twlSgsAM0MLELQCYz+dvjVX4hdZEp90JPSSZaJeQzrOpYEi
50lC88NTTYoG26pCgPjalU4/NCZRDEJwyjz4wAny1pkwHmOWkHXucG0+Kb9skXi/RO+2+TjKnFC3
p5B0WP7pEmPUGYzS7RSQigYlL/L/f/KM3kOcm90myHE1bdGHwnbhi3D2tnHOwKQYZ4nh0h1rhceR
sdSQC/9YB2GjAwKGmvtUK8oG4ww1aqwdamcZqyo3UYUFNav+i+ap/p/L0w70i5N5o4iKjEYFNQOi
Byu2GxL0IhF3v9kQUaUpTCu6mCT2g+aFTSHCU4MW+6TGiHV67pbCBhPm+nV3mvGyD6Rq5HsJgr/5
/Rpo6a6ptgQp2Fe9W1NDDOYSdQZ8aOg0WrXeC0CXHufd/u1dOW/sC2FasgMB3fZkg4yMn65BFIXf
wzpQCqLjyG9shFKRFsV2OGgHGQa3bQEdBb8=
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
