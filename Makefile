TARGET := iphone:clang:latest:7.0
INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = MediaControls

$(BUNDLE_NAME)_FILES = Switch.xm
$(BUNDLE_NAME)_LIBRARIES = Accessibility flipswitch
$(BUNDLE_NAME)_INSTALL_PATH = /Library/Switches
$(BUNDLE_NAME)_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk
