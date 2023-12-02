// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Fri Dec  1 01:17:35 2023
// Host        : TFG5276XG running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Xilinx/DigitalSystem/Bubble_Shooter/Bubble_Shooter.gen/sources_1/ip/cos_signed_8x81/cos_signed_8x81_sim_netlist.v
// Design      : cos_signed_8x81
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "cos_signed_8x81,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module cos_signed_8x81
   (clka,
    wea,
    addra,
    dina,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [6:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [7:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [7:0]douta;

  wire [6:0]addra;
  wire clka;
  wire [7:0]dina;
  wire [7:0]douta;
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
  wire [7:0]NLW_U0_doutb_UNCONNECTED;
  wire [6:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [6:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [7:0]NLW_U0_s_axi_rdata_UNCONNECTED;
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.54005 mW" *) 
  (* C_FAMILY = "zynq" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "0" *) 
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
  (* C_INIT_FILE = "cos_signed_8x81.mem" *) 
  (* C_INIT_FILE_NAME = "cos_signed_8x81.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "0" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "81" *) 
  (* C_READ_DEPTH_B = "81" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "8" *) 
  (* C_READ_WIDTH_B = "8" *) 
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
  (* C_WRITE_DEPTH_A = "81" *) 
  (* C_WRITE_DEPTH_B = "81" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "8" *) 
  (* C_WRITE_WIDTH_B = "8" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  cos_signed_8x81_blk_mem_gen_v8_4_5 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[7:0]),
        .eccpipece(1'b0),
        .ena(1'b0),
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
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[7:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
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
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2022.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
VHPlDkoDlWlBfBMvPBmGYmaek3s9hXXhjF28kllYPnaNm3TSnzzpXHWHc8Ye9/2L2yiQfJ1hTWou
Ia/zeQ8h9/dtr6QB5YkyW4wlb/LbMgXb+DGIXPSllNl0IMsRQIcQDbcQm1bO/nlhb+2pjxiuaQrl
DbvxoDwPs7z3LunRxsg=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
lmIhoX8hXuc7tNV1sXY1K2/gXL7Y7Hq73qQF7+x03UWWTRd3uhGmVQtOMVbhIW+66UkWUHiD26zL
fzqGor8bgSNGpSFyS11k4TwLQT4OfAMGO8C9Qmmh4+VENBnpS9TW+wHzCv8oUwht7xYtYRZvOvYK
F3fMppz2sBkUd1lciw98ZE/UmNkhqBuMfIYF43j45DEJ55PBhOZNg91Ls4v3qBHyBAaYPFFoMry3
d5Fw1PZyFQSEOSSpwgyds2aN0g6oIwl7zm0LJrM9VDAOxBUE50hk+oHr4jj8J8UhHQJnlEHm1Idm
rvxKygNKRvfSpa90NYxZJFYgqnrMYg+19+9aZA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
VkyCjO2onoeZWEoYQ/4ue7X5mkHyTYVW9xjdoTsGS4GdP/Q64VaCZL/jr6R8DVDXPMnH7tRMrDpo
jpYBnyzSgOkfgqM+96ioC2fDyAaG4gYgGLmrBR6qK3/mxXwAZZX+GJ9R/eWXkc9h8xN+gsSSX6/M
jIQCgeT6q7PB4dWT6KY=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Iub91V+TnhVlZCSLu6iKmFjix71y6/l83OPTs8uewWvkE7WcqYxEKi9fonXEkzAtWzuKwEUqnOlN
VBsNJqPUdKcd22q523mrdt89mpdosWD+hvZdO7ELhJniY5u9h49FFkubpN2JiUTcIcKEYxVNlds4
wyvaYUqbPVH5v2ooJwDdimS4GVn9HerCOgPwfshvQDNlMTxLcYju4v8BHMc5Rub9Q/ihvpQU74v2
ouZ9XIwA+C6pBLwvaqS8jE7HXOokgqJilaX/W/t+KEgiFry/txRTMU9WMD7tCN7lcfjCydmS3Lq+
3u6Hsr0S8BwNjcaDpZDnBTygUJd4JSqREnk33w==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
U46EWFmKmpZGaWfyL+dokyQtJtaOYsa7HCW/+fdtw9/yHKTWFpmqKBZngBj5rPkNhtTDDCJkqsYj
tUXg1j4tgIBaCQn9B0q/aG+B3gPLrudp9hLL25mVbsfiTzdekiV2hJMmhuMoavKKPJHC6zyW7kZi
80er82OQy8h+Df/fe6TRjH9xEt3/b80tRKUMbxkLfnnkAyyf1KfOhB6/uyI4mwXuQR+DsAbzybKR
YtXpOiW72tGrXTFlzcwbHamWZefqsilVpBw6V5dh33vYKGx50xwWpj76maAkpQrOpB7zufeldJe4
W1UOEN84AZdRTLkVSxamWo/wp8nP9fiGS/ItRw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_07", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
qczgIJYpE/SzErzK7eWJBGcDFEzDLm8cKbwJbPXuM6YnJxx44W+E60R3war7K2QGFAkOoCDUtDC7
SghJGF32btaDLzeKm0tQ669sBtQmMIaBrlt7I9QBkNM8zN9GL92qxNC9o3UVWMOYy5BmH8nUPgcE
O6lRubeltlrTuDe7UJQ2nEPHcXjpUJJ8dxktyW+LovBy1OxW8g4GRAsmEJsoOEg0HuDdWcc4IshJ
PvwPJ7LblELAKsdkSt65y9VaklaEm7MlH4ImlgIa74TgRmutLUbWxM1QYhGE5rAzFhGU5i3RJOdx
L3N7GGGvLMW2z9NSHbIFX+/eNII9fNJ9nZbgLA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ti1NUgDv8YPk90APMwfu/mRr38QYwAxZfv0T6zQ89YS55t2EquEGVqrEafYX6rTydLOw8le1Oucv
f2oERpSSSTih/ScZneSZmuPE/Zh2BU1Ajv0j+/+0uEWXU+5lLPbDJjnapTmJXih1MYPf0SHpZZmE
BKj2IEBI9MPZlh6bxpa5BWJnyPdAvHf+UNaMXU9+pmbtrzUVebql4mFJu45Z3+ehmFY4FBW3zXMF
44C4TlHACLwL3vHVMCVfeKhgdVDbpE+/IFhTStz7mZ9h9RKGanQcs6YDVM1R+2RKA1QT1fX4FiQc
1V+FGmrm1ujxmFGXwpfNKByVlfCY0oWhRJCYYQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
HuEXFK0NXt09xU2yxxjng1OLsT+ZEM4EhqBgpr9D2ljw2vDaMBrqEsRQTc2B9soDq3ewDduHJXBd
OGYxkPnoN6LhjULtB2nTgjcH6NxA4puZ1ZNcndDndVBo8rTW5W1OqHq6InAG0CqPpTIkuqz3ECPl
EysI++MCDfH6tIzlekxJFIJ1McJsTq5rFuLzMMcrmkBxgcayDpOcCFuzZzCczxmt/cCCIKmDybwT
OQXmOcLJoYLP4sFu6R9c6xO8i6p++crv2N3eIxZHKbek9xBBZqQM9EYuEtsbkqAs9XZpa16i5njR
BDFxTKcP6r7JgFALJE89AZhBbate5JXWp0v4ECZD18aEL17CipwcWPutNMdG1apzSPP5y59n7rMG
yxBPz1gKHc3Emkl4WcO0hjICxqmO6dMXoY8JvBSf6ry2l0sH9Ihr3Bq5WWmlhPHnoaNr5jl//vNe
KfToWtn97eoVSt1LnmXXnSpdigbHr0UIg8AdkpdkuNRaWdVicDdgSo49

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
mokwst2bn6UxD6V9UdIgCIG1QQ/d0FiJqYGOTI2eHPV6YElaLjnJ8DnQmZnGS95o3x93FDOoa58C
RwYsX1fVoVtXkj1LuZq0k7q9vEe4T8xMjpkeYtIHY9k0Xhy1Lq/xRlfzGAf9fvf9e+f4r7aR/Sb/
uCZxxugG5niTwLENY1n3NthYL0jvo8Fmdw4Qg0nTCGWlVCws+09K0g9/lx6I9EcuHHemcHO3fOZG
lMc4NaPNozKwnyDMoWUkwiVxyFEPFaQLNYqzjvR+CqrWfhFLo96JWhL+eaDoNuZoBVYQtNH5ZwBL
BoO27Pw10lgcReGlZBz3BLO7T4ddynCx0+eSnw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
PiP7AjOQqqouyQMoBQqgWIDhUSViq94rIvGiIJ/UKMDspM/yXw1caE8AhWHTjYckC4yLpPAz5P6s
1Z6flzDPrzVwg4e59X2cc4IMCHhedna0rDO804njcc6amRDTeLsMLTkWfvomB4xwszm2AgT+PRnB
WHd09ZUDVFjiBXT+Oa9AicgGJHrX3w823yBPuAa704kje/SzgtiDpcTU1eLmLhLW7LpEd9KIHd9s
ER7Uk9Orws0Kq9PMTqMX4hMn5K5mFakOeOURiEbUjdv5RiIJ2g/PlQXSItM8fHsBTQa6fOaJwQTI
vHwK3a8ZBHpfT1YH+n7wNiNUZwD4SFXm1QVx4g==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ul5ZfTHJwMctaNhYRortUZizYMPYRef7uYqPSuMkxsArnxI/cjGh+KRMwzV86hyp/6TXSJIjm5ec
2wX2UONdPN+DOJ84jYC4JbgJQrPnTj7ioD8uLX/WlyPcQzyF5keqFgj5eR5s13FskVWCuAWf5m9w
mhFEKFjVXDAr7gVgAJh/hL8P6Psrnf+LGfiM8JhnDepsHEYykGlpD3fzru2BGgqHWqPqFMcnyVGl
vysaIXiJz/eYKvO8RGcgd3DJAM/wPm9A0m/DWcmSnczOgTjoqkHcBg2H5uJMLvufzmjImi6LYEqq
v04ESDEN31cSUzqUYcayvMFOnI/WNsWbFIa5+Q==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 20544)
`pragma protect data_block
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
m3MX50ByaJIiINH90hiLBees6vCgzrNg
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
