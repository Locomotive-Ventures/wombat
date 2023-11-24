.ONESHELL:
.PHONY: all help install check precommit tfswitch tfinit tfplan tfapply tfproviders lint secure clean TERRAFORMBINARY
.DEFAULT_GOAL = help
SHELL := /bin/zsh
APPNAME = wardenwombat
BLUE=\033[0;34m
NC=\033[0m
SRC=.
ERRORCHECK="Not all packages installed, try running `make install`. Exiting..."
CHECKTF := $(shell terraform --version 2>/dev/null)
CHECKTFSWITCH := $(shell tfswitch --version 2>/dev/null)
CHECKTFLINT := $(shell tflint --version 2>/dev/null)
CHECKTFSEC := $(shell tfsec --version 2>/dev/null)
CHECKTFORM := $(shell terraformer --version 2>/dev/null)

header:
	@echo -e "$(BLUE)--------------------------------------------------"
	@echo -e "🚀 Automated makefile helper for: $(APPNAME)"
	@echo -e "--------------------------------------------------$(NC)"
	@echo ' '

check: header
	@echo 'Requirements Checks:'
# Check if Terraform is installed and ready to use
ifdef CHECKTF
	@echo " ✅ terraform is installed ($(shell which terraform))"
else
	@echo " ❌ terraform is not installed"
	$(error "$(ERRORCHECK)")
endif
# Check if Terraform Switch is installed and ready to use
ifdef CHECKTFSWITCH
	@echo " ✅ tfswitch is installed ($(shell which tfswitch))"
else
	@echo " ❌ tfswitch is not installed"
	$(error "$(ERRORCHECK)")
endif
# Check if Terraform Lint is installed and ready to use
ifdef CHECKTFLINT
	@echo " ✅ tflint is installed ($(shell which tflint))"
else
	@echo " ❌ tflint is not installed"
	$(error "$(ERRORCHECK)")
endif
# Check if tfsec is installed and ready to use
ifdef CHECKTFSEC
	@echo " ✅ tfsec is installed ($(shell which tfsec))"
else
	@echo " ❌ tfsec is not installed"
	$(error "$(ERRORCHECK)")
endif
	@echo " "
