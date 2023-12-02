// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Fri Dec  1 01:16:34 2023
// Host        : TFG5276XG running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Xilinx/DigitalSystem/Bubble_Shooter/Bubble_Shooter.gen/sources_1/ip/sin_unsigned_8x81/sin_unsigned_8x81_sim_netlist.v
// Design      : sin_unsigned_8x81
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "sin_unsigned_8x81,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module sin_unsigned_8x81
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
  (* C_INIT_FILE = "sin_unsigned_8x81.mem" *) 
  (* C_INIT_FILE_NAME = "sin_unsigned_8x81.mif" *) 
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
  sin_unsigned_8x81_blk_mem_gen_v8_4_5 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 20576)
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
