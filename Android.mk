LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := udc_lib.ko
LOCAL_PROPRIETARY_MODULE := true
LOCAL_MODULE_OWNER := mtk
LOCAL_INIT_RC := init.udc_lib.rc

ifeq ($(KERNEL_TARGET_ARCH),arm64)
LOCAL_SRC_FILES := \
	adler32.c \
	crc32.c crc32.h \
	zconf.h \
	zlib.h \
	zutil.c zutil.h \
	udc_core_0.obj udc_core_1.obj \
	udc_lib_main.c \
	Makefile
else
LOCAL_SRC_FILES := \
	adler32.c \
	crc32.c crc32.h \
	zconf.h \
	zlib.h \
	zutil.c zutil.h \
	udc_core_0-32.obj udc_core_1-32.obj \
	udc_lib_main.c \
	Makefile
endif

ifeq ($(TARGET_OUT_VENDOR),)
LOCAL_MODULE_PATH := $(ALPS_OUT)/vendor/lib/modules
else
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/lib/modules
endif

include $(MTK_KERNEL_MODULE)
