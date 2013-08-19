#!/bin/bash

#PER DPLL registers
PER_PLL_REGS=(
  'PER_PLL_M 0x4A00814C 18-8'
  'PER_PLL_N 0x4A00814C 6-0'
  'PER_PLL_M2 0x4A008150 4-0'
  'PER_PLL_H11 0x4A008158 5-0'
  'PER_PLL_H12 0x4A00815C 5-0'
  'PER_PLL_H13 0x4A008160 5-0'
  'PER_PLL_H14 0x4A008164 5-0'
)

#Core DPLL registers
CORE_PLL_REGS=(
  'CORE_PLL_M 0x4A00512C 18-8'
  'CORE_PLL_N 0x4A00512C 6-0'
  'CORE_PLL_M2 0x4A005130 4-0'
  'CORE_PLL_H12 0x4A00513C 5-0'
  'CORE_PLL_H13 0x4A005140 5-0'
  'CORE_PLL_H14 0x4A005144 5-0'
  'CORE_PLL_H22 0x4A005154 5-0'
  'CORE_PLL_H23 0x4A005158 5-0'
  'CORE_PLL_H24 0x4A00515C 5-0'
)

#ABE DPLL registers
ABE_PLL_REGS=(
  'ABE_PLL_M 0x4A0051EC 18-8'
  'ABE_PLL_N 0x4A0051EC 6-0'
  'ABE_PLL_M2 0x4A0051F0 4-0'
  'ABE_PLL_REGM4XEN 0x4A0051E0 11'
  'ABE_PLL_M3 0x4A0051F4 4-0'
)

#MPU DPLL registers
MPU_PLL_REGS=(
  'MPU_PLL_M 0x4A00516C 18-8'
  'MPU_PLL_N 0x4A00516C 6-0'
  'MPU_PLL_M2 0x4A005170 4-0'
)

#IVA DPLL registers
IVA_PLL_REGS=(
  'IVA_PLL_M 0x4A0051AC 18-8'
  'IVA_PLL_N 0x4A0051AC 6-0'
  'IVA_PLL_M2 0x4A0051B0 4-0'
)

#USB DPLL registers
USB_PLL_REGS=(
  'USB_PLL_M 0x4A00818C 19-8'
  'USB_PLL_N 0x4A00818C 7-0'
  'USB_PLL_M2 0x4A008190 6-0'
)

#EVE DPLL registers
EVE_PLL_REGS=(
  'EVE_PLL_M 0x4A005290 18-8'
  'EVE_PLL_N 0x4A005290 6-0'
  'EVE_PLL_M2 0x4A005294 4-0'
)

#DSP DPLL registers
DSP_PLL_REGS=(
  'DSP_PLL_M 0x4A005240 18-8'
  'DSP_PLL_N 0x4A005240 6-0'
  'DSP_PLL_M2 0x4A005244 4-0'
  'DSP_PLL_M3 0x4A005248 4-0'
)

#GMAC DPLL registers
GMAC_PLL_REGS=(
  'GMAC_PLL_M 0x4A0052B4 18-8'
  'GMAC_PLL_N 0x4A0052B4 6-0'
  'GMAC_PLL_M2 0x4A0052B8 4-0'
  'GMAC_PLL_M3 0x4A0052BC 4-0'
  'GMAC_PLL_H11 0x4A0052C0 5-0'
  'GMAC_PLL_H12 0x4A0052C4 5-0'
  'GMAC_PLL_H13 0x4A0052C8 5-0'
)

#GPU DPLL registers
GPU_PLL_REGS=(
  'GPU_PLL_M 0x4A0052E4 18-8'
  'GPU_PLL_N 0x4A0052E4 6-0'
  'GPU_PLL_M2 0x4A0052E8 4-0'
)

#DDR DPLL registers
DDR_PLL_REGS=(
  'DDR_PLL_M 0x4A00521C 18-8'
  'DDR_PLL_N 0x4A00521C 6-0'
  'DDR_PLL_M2 0x4A005220 4-0'
  'DDR_PLL_H11 0x4A005228 5-0'
)

#PCIE Ref PLL registers
PCIE_REF_REGS=(
  'PCIE_REF_PLL_M 0x4A00820C 19-8'
  'PCIE_REF_PLL_N 0x4A00820C 7-0'
  'PCIE_REF_PLL_M2 0x4A008210 6-0'
)

#PCIE APLL registers
PCIE_APLL_REGS=(
  'PCIE_APLL_M2 0x4A008224 6-0'
)
PCIE_APLL_DIV=0 #Hardcoded, until TRM is updated

#USB OTG SS DPLL registers
USB_OTG_SS_REGS=(
  'USB_OTG_SS_PLL_M 0x4A084C0C 20-9'
  'USB_OTG_SS_PLL_N 0x4A084C0C 8-1'
)

#SATA DPLL registers
SATA_REGS=(
  'SATA_PLL_M 0x4A09680C 20-9'
  'SATA_PLL_N 0x4A09680C 8-1'
)

#DEBUGSS DPLL registers
#TRM does not provide DPLL_DEBUGSS register info so hardcoding
#DEBUGSS_REGS=(
#  'DEBUGSS_PLL_M '
#  'DEBUGSS_PLL_N=1'
#  'DEBUGSS_PLL_M6_HSDIV=2'
#)
DEBUGSS_PLL_M=95
DEBUGSS_PLL_N=1
DEBUGSS_PLL_M6_HSDIV=2

#PRM registers
PRM_REGS=(
  'PRM_ABE_PLL_CLK_MUX 0x4AE0610C 0'
  'PRM_WKUPAON_ICLK_MUX 0x4AE06108 0'
  'PRM_ABE_DPLL_BYPASS_CLK_MUX 0x4AE06114 0'
  'PRM_DCAN1_SYS_CLK_MUX 0x4AE07888 24'
  'PRM_ABE_DPLL_SYS_CLK_MUX 0x4AE06118 0'
  'PRM_VIDEO1_DPLL_CLK_MUX 0x4AE06168 0'
  'PRM_VIDEO2_DPLL_CLK_MUX 0x4AE0616C 0'
  'PRM_HDMI_DPLL_CLK_MUX 0x4AE06164 0'
  'PRM_ABE_SYS_CLK_DIV 0x4AE06120 0'
  'PRM_TIMER_SYS_CLK_DIV 0x4AE06144 0'
  'PRM_MPU_DPLL_CLK_ABE_DIV 0x4A005320 26'
  'PRM_MPU_DPLL_CLK_EMIF_DIV 0x4A005320 25-24'
  'PRM_L3INSTR_TS_GCLK_AND_DLL_AGING_CLK_DIV 0x4A008E50 25-24'
)

#CM_CORE_AON part a registers
CM_CORE_AON_PARTA_REGS=(
  'CM_CORE_AON_L3_ICLK_DIV 0x4A005100 4'
  'CM_CORE_AON_L4_ROOT_CLK_DIV 0x4A005100 8'
  'CM_CORE_AON_MPU_DPLL_HS_CLK_DIV 0x4A00519C 1-0'
  'CM_CORE_AON_IVA_DPLL_HS_CLK_DIV 0x4A0051DC 1-0'
  'CM_CORE_AON_EVE_DPLL_HS_CLK_DIV 0x4A0052A4 1-0'
  'CM_CORE_AON_DSP_DPLL_HS_CLK_DIV 0x4A005254 1-0'
  'CM_CORE_AON_ABE_LP_CLK_DIV 0x4AE061D8 0'  #TRM table 3-39 refers to bits 1:0,only bit 0 is used according to register
  'CM_CORE_AON_ABE_24M_FCLK_DIV 0x4AE0611C 0' #TRM table 3-39 refers to bits 1:0, only bit 0 is used according to register 
)

#CM_CORE_AON part b registers
CM_CORE_AON_PARTB_REGS=(
  'CM_CORE_AON_MMC1_GFCLK_MUX 0x4A009328 24'
  'CM_CORE_AON_MMC1_GFCLK_DIV 0x4A009328 26-25'
  'CM_CORE_AON_MMC2_GFCLK_MUX 0x4A009330 24'
  'CM_CORE_AON_MMC2_GFCLK_DIV 0x4A009330 26-25'
  'CM_CORE_AON_MMC3_FCLK_MUX 0x4A009820 24'
  'CM_CORE_AON_MMC3_FCLK_DIV 0x4A009820 26-25'
  'CM_CORE_AON_MMC4_FCLK_MUX 0x4A009828 24'
  'CM_CORE_AON_MMC4_FCLK_DIV 0x4A009828 26-25'
  'CM_CORE_AON_GPU_HYD_GCLK_MUX 0x4A009220 27-26'
  'CM_CORE_AON_GPU_CORE_GCLK_MUX 0x4A009220 25-24'
  'CM_CORE_AON_QSPI_GFCLK_MUX 0x4A009838 24'
  'CM_CORE_AON_QSPI_GFCLK_DIV 0x4A009838 26-25'
  'CM_CORE_AON_VIP1_GCLK_MUX 0x4A009020 24'
  'CM_CORE_AON_VIP2_GCLK_MUX 0x4A009028 24'
  'CM_CORE_AON_VIP3_GCLK_MUX 0x4A009030 24'
  'CM_CORE_AON_ABE_CLK_DIV 0x4AE06170 2-0'
  'CM_CORE_AON_AESS_FCLK_DIV 0x4AE06178 0'
  'CM_CORE_AON_ABE_GICLK_DIV 0x4AE06174 0'
  'CM_CORE_AON_IPU1_GFCLK_MUX 0x4A005520 24'
  'CM_CORE_AON_RGMII_50M_CLK_MUX 0x4A0093D0 24'
  'CM_CORE_AON_ATL_GFCLK_MUX 0x4A008C00 27-26'
  'CM_CORE_AON_ATL_SOURCE1_MUX 0x4A008C00 25-24'
  'CM_CORE_AON_GMAC_RFT_CLK_MUX 0x4A0093D0 27-25'
  'CM_CORE_AON_EVE_CLK_MUX 0x4AE06180 0'
  'CM_CORE_AON_EVE_DCLK_DIV 0x4AE061E0 2-0'
)

#VIDEO1 PLL registers
VIDEO1_PLL_REGS=(
  'VIDEO1_PLL_M 0x4A0A400C 20-9' # or l3 0x5800430C
  'VIDEO1_PLL_N 0x4A0A400C 8-1' # or l3 0x5800430C
  'VIDEO1_M4_HSDIV 0x4A0A400C 25-21' # or l3 0x5800430C
  'VIDEO1_M6_HSDIV 0x4A0A4014 4-0' # or l3 0x58004314
)
VIDEO1_M5_HSDIV=38 #Hardcoded, TRM is missing M5 div register info

#VIDEO2 PLL registers
VIDEO2_PLL_REGS=(
  'VIDEO2_PLL_M 0x4A0A500C 20-9' # or l3 0x5800530C 
  'VIDEO2_PLL_N 0x4A0A500C 8-1' # or l3 0x5800530C 
  'VIDEO2_M4_HSDIV 0x4A0A500C 25-21' # or l3 0x5800530C 
  'VIDEO2_M6_HSDIV 0x4A0A5014 4-0' # or l3 0x58005314
)
VIDEO2_M5_HSDIV=10 #Hardcoded in tree, TRM is missing M5 div register info

#HDMI PLL registers
HDMI_PLL_REGS=(
  'HDMI_PLL_M 0x4A0A600C 20-9' # or l3 0x5804020C 
  'HDMI_PLL_N 0x4A0A600C 8-1' # or l3 0x5804020C
  'HDMI_PLL_M2 0x4A0A6020 24-18' # or l3 0x58040220  
  'HDMI_PLL_SD 0x4A0A6014 17-10' # or l3 0x58040214
)

#CM_CORE_AON_CLKOUTMUX Mux registers
CLKOUTMUX_REGS=(
  'CLKOUTMUX0_CLK_MUX 0x4AE06158 4-0'
  'CLKOUTMUX1_CLK_MUX 0x4AE0615C 4-0'
  'CLKOUTMUX2_CLK_MUX 0x4AE06160 4-0'
  'CLKOUTMUX_SYS_CLK1_DCLK_DIV 0x4AE061C8 2-0'
  'CLKOUTMUX_SYS_CLK2_DCLK_DIV 0x4AE061CC 2-0'
  'CLKOUTMUX_PER_ABE_X1_DCLK_DIV 0x4AE061BC 2-0'
  'CLKOUTMUX_MPU_DCLK_DIV 0x4AE061B0 2-0'
  'CLKOUTMUX_DSP_DCLK_DIV 0x4AE0618C 2-0'
  'CLKOUTMUX_IVA_DCLK_DIV 0x4AE061A8 2-0'
  'CLKOUTMUX_GPU_DCLK_DIV 0x4AE061A0 2-0'
  'CLKOUTMUX_CORE_DPLL_OUT_DCLK_DIV 0x4AE06188 2-0'
  'CLKOUTMUX_EMIF_PHY_DCLK_DIV 0x4AE06190 2-0'
  'CLKOUTMUX_GMAC_250M_DCLK_DIV 0x4AE0619C 2-0'
  'CLKOUTMUX_VIDEO2_DCLK_DIV 0x4AE061D4 2-0'
  'CLKOUTMUX_VIDEO1_DCLK_DIV 0x4AE061D0 2-0'
  'CLKOUTMUX_HDMI_DCLK_DIV 0x4AE061A4 2-0'
  'CLKOUTMUX_FUNC_96M_AON_DCLK_DIV 0x4AE06198 2-0'
  'CLKOUTMUX_L3INIT_480M_DCLK_DIV 0x4AE061AC 2-0'
  'CLKOUTMUX_USB_OTG_DCLK_DIV 0x4AE06184 2-0'
  'CLKOUTMUX_SATA_DCLK_DIV 0x4AE061C0 2-0'
  'CLKOUTMUX_PCIE2_DCLK_DIV 0x4AE061B8 2-0'
  'CLKOUTMUX_PCIE1_DCLK_DIV 0x4AE061B4 2-0'
  'CLKOUTMUX_EMU_DCLK_DIV 0x4AE06194 2-0'
)

#TIMERs registers
TIMERS_REGS=(
  'TIMER_VIDEO1_CLK_DIV 0x4AE0614C 2-0'
  'TIMER_VIDEO2_CLK_DIV 0x4AE06154 2-0'
  'TIMER_HDMI_CLK_DIV 0x4AE06128 2-0'
  'TIMER1_GFCLK_MUX 0x4AE07840 27-24'
  'TIMER2_GFCLK_MUX 0x4A009738 27-24'
  'TIMER3_GFCLK_MUX 0x4A009740 27-24'
  'TIMER4_GFCLK_MUX 0x4A009748 27-24'
  'TIMER5_GFCLK_MUX 0x4A005558 27-24'
  'TIMER6_GFCLK_MUX 0x4A005560 27-24'
  'TIMER7_GFCLK_MUX 0x4A005568 27-24'
  'TIMER8_GFCLK_MUX 0x4A005570 27-24'
  'TIMER9_GFCLK_MUX 0x4A009750 27-24'
  'TIMER10_GFCLK_MUX 0x4A009728 27-24'
  'TIMER11_GFCLK_MUX 0x4A009730 27-24'
  'TIMER13_GFCLK_MUX 0x4A0097C8 27-24'
  'TIMER14_GFCLK_MUX 0x4A0097D0 27-24'
  'TIMER15_GFCLK_MUX 0x4A0097D8 27-24'
  'TIMER16_GFCLK_MUX 0x4A009830 27-24'
)

#CM_CORE_AON MCASPs registers
#MCASP AUX_GFCLK AHCLKX and AHCLKR registers
MCASP_REGS=(
  'MCASP1_AUX_GFCLK_MUX 0x4A005550 23-22'
  'MCASP2_AUX_GFCLK_MUX 0x4A009860 23-22'
  'MCASP3_AUX_GFCLK_MUX 0x4A009868 23-22'
  'MCASP4_AUX_GFCLK_MUX 0x4A009898 23-22'
  'MCASP5_AUX_GFCLK_MUX 0x4A009878 23-22'
  'MCASP6_AUX_GFCLK_MUX 0x4A009904 23-22'
  'MCASP7_AUX_GFCLK_MUX 0x4A009908 23-22'
  'MCASP8_AUX_GFCLK_MUX 0x4A009890 23-22'
  'MCASP_VIDEO1_CLK_DIV 0x4AE06148 2-0'
  'MCASP_VIDEO2_CLK_DIV 0x4AE06150 2-0'
  'MCASP_HDMI_CLK_DIV 0x4AE06124 2-0'
  'MCASP_PER_ABE_X1_GFCLK_DIV 0x4AE06138 2-0'
  'MCASP1_AHCLKX_MUX 0x4A005550 27-24'
  'MCASP1_AHCLKR_MUX 0x4A005550 31-28'
  'MCASP2_AHCLKX_MUX 0x4A009860 27-24'
  'MCASP2_AHCLKR_MUX 0x4A009860 31-28'
  'MCASP_MLB_CLK_DIV 0x4AE06134 2-0'
  'MCASP_MLBP_CLK_DIV 0x4AE06130 2-0'
  'MCASP3_AHCLKX_MUX 0x4A009868 27-24'
  'MCASP4_AHCLKX_MUX 0x4A009898 27-24'
  'MCASP5_AHCLKX_MUX 0x4A009878 27-24'
  'MCASP6_AHCLKX_MUX 0x4A009904 27-24'
  'MCASP7_AHCLKX_MUX 0x4A009908 27-24'
  'MCASP8_AHCLKX_MUX 0x4A009890 27-24'
)

source clk_framework_utils.sh

set_tree_input PER_PLL_REGS[@]
set_tree_input CORE_PLL_REGS[@]
set_tree_input ABE_PLL_REGS[@]
set_tree_input MPU_PLL_REGS[@]
set_tree_input IVA_PLL_REGS[@]
set_tree_input USB_PLL_REGS[@]
set_tree_input EVE_PLL_REGS[@]
set_tree_input DSP_PLL_REGS[@]
set_tree_input GMAC_PLL_REGS[@]
set_tree_input GPU_PLL_REGS[@]
set_tree_input DDR_PLL_REGS[@]
set_tree_input PCIE_REF_REGS[@]
set_tree_input PCIE_APLL_REGS[@]
set_tree_input USB_OTG_SS_REGS[@]
set_tree_input SATA_REGS[@]
#set_tree_input DEBUGSS_REGS[@] #Commented, TRM is missing register info
set_tree_input PRM_REGS[@]
set_tree_input CM_CORE_AON_PARTA_REGS[@]
set_tree_input CM_CORE_AON_PARTB_REGS[@]
set_tree_input VIDEO1_PLL_REGS[@]
set_tree_input VIDEO2_PLL_REGS[@]
set_tree_input HDMI_PLL_REGS[@]
set_tree_input CLKOUTMUX_REGS[@]
set_tree_input TIMERS_REGS[@]
set_tree_input MCASP_REGS[@]

source dra7xx_clk_framework_tree.sh

