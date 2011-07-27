#! /bin/sh
# 
# Copyright (C) 2011 Texas Instruments Incorporated - http://www.ti.com/
#  
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License as 
# published by the Free Software Foundation version 2.
# 
# This program is distributed "as is" WITHOUT ANY WARRANTY of any
# kind, whether express or implied; without even the implied warranty
# of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# @desc Get module config option and module name for a driver.
# @params 
#        Input: device type like "nand", "mmc", "spi", "sound", "graphics" 
# @returns Config Option and Top-level .ko file (Module) name to modprobe for
#          this driver separated by colon ':'. If one device requires multiple 
#          top-level .ko files then separate the CONFIG_OPTION:KO_FILE_NAME pairs
#          by space. 
#          Ex: "CONFIG_JFFS2_FS:jffs2 CONFIG_MTD_NAND_OMAP2:omap2_nand"
# @history 2011-03-22: First version

source "common.sh"  # Import do_cmd(), die() and other functions

############################# Functions #######################################

################################ CLI Params ####################################
if [ $# -ne 1 ]; then
        echo "Error: Invalid Argument Count"
        echo "Syntax: $0 <device_type like 'nand', 'mmc', 'spi', 'rtc', 'graphics'>"
        exit 1
fi
DEVICE_TYPE=$1
############################ USER-DEFINED Params ###############################
# Try to avoid defining values here, instead see if possible
# to determine the value dynamically. ARCH, DRIVER, SOC and MACHINE are 
# initilized and exported by runltp script based on platform option (-P)
case $ARCH in
esac
IFS_ORIG=$IFS
IFS=","
for DRIVER in $DRIVERS
do
  case $DRIVER in
    *omap2-nand)
      nand="CONFIG_JFFS2_FS:jffs2 CONFIG_MTD_NAND_OMAP2:omap2_nand";; # not sure this is the right one.
    *davinci-nand)
      nand=":davinci_nand";;

    *mmci-omap-hs)
      mmc="CONFIG_MMC_OMAP_HS:omap_hsmmc";;
    *davinci-mmc)
      mmc=":davinci_mmc";;

    *rtc-s35390a)
      rtc=":rtc-s35390a";;
	  *omap_rtc)
	    rtc=":rtc-omap";;	

    *davinci_spi)
      spi=":davinci_spi";;

    *watchdog)
      wdt=":davinci_wdt";;

	  *fb0)
	    graphics=":omapfb";;

	  *omap3-audio)
	    sound=':snd_soc_omap3evm';;	

    *soc-audio)
      sound=':snd-soc-evm';;

  esac
done
IFS=$IFS_ORIG

# In case if the module name is not depending on driver, you may overwrite the 
# CONFIG_OPTION:KO_FILE_NAME pairs based on SOC or MACHINE name below.
case $SOC in
esac
case $MACHINE in
esac

# Define default values for variables being overriden
#: ${nand:="davinci_nand"}

########################### DYNAMICALLY-DEFINED Params #########################
# Try to use /sys and /proc information to determine values dynamically.
# Alternatively you should check if there is an existing script to get the
# value you want

########################### REUSABLE TEST LOGIC ###############################
# DO NOT HARDCODE any value. If you need to use a specific value for your setup
# use USER-DEFINED Params section above.

# Avoid using echo. Instead use print functions provided by st_log.sh

# Use do_cmd() (imported from common.sh) to execute your test steps.
# do_cmd() will check return code and fail the test is return code is non-zero.
#echo ${!DEVICE_TYPE}
eval MODULE_NAME=\$$DEVICE_TYPE
if [ -z "$MODULE_NAME" ]; then
	die 'Config Option and Module name not found'
	exit 1
fi
echo "$MODULE_NAME"