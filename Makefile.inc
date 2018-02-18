SELF_DIR := $(dir $(lastword $(MAKEFILE_LIST)))

include $(SELF_DIR)/includes/colors.mk
include $(SELF_DIR)/includes/help.mk

include $(SELF_DIR)/includes/git.mk
include $(SELF_DIR)/includes/environment.mk

include $(SELF_DIR)/includes/kubectl.mk
include $(SELF_DIR)/includes/listings.mk
include $(SELF_DIR)/includes/tls.mk
include $(SELF_DIR)/includes/testing.mk
