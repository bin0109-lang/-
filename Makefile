ARCHS = arm64
TARGET = iphone:clang:15.0:14.0
INSTALL_TARGET_PROCESSES = SupernaturalSquad
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = SignPatch
SignPatch_FILES = Tweak.x
SignPatch_CFLAGS = -fobjc-arc
include $(THEOS_MAKE_PATH)/tweak.mk
