SELF_DIR := $(dir $(lastword $(MAKEFILE_LIST)))

include $(SELF_DIR)/kubectl.mk
include $(SELF_DIR)/listings.mk
include $(SELF_DIR)/deployments.mk
include $(SELF_DIR)/tls.mk
