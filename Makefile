#
# Copyright (C) 2015 MediaTek Inc.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2 as
# published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#

obj-m += udc_lib.o

udc_lib-y += \
    adler32.o \
    crc32.o \
    zutil.o \
    udc_lib_main.o

udc_lib-$(CONFIG_ARM64) += udc_core_0.obj udc_core_1.obj
udc_lib-$(CONFIG_ARM) += udc_core_0-32.obj udc_core_1-32.obj

ccflags-y += \
    -DZ_SOLO

ccflags-y += \
	-I$(srctree)/drivers/misc/mediatek/eccci/udc \
	-I$(srctree)/drivers/misc/mediatek/eccci/udc/udc_lib_inc

