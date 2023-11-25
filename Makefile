.ONESHELL:
.PHONY: all help install check precommit tfswitch tfinit tfplan tfapply tfproviders tfreconfigure lint secure clean
.DEFAULT_GOAL = help

# Shell and Environment
SHELL := /bin/zsh
include .env
export

# Settings
APPNAME = wardenwombat
p = infrastructure/terraform
DEBUG_MODE = false

# Binary and Variables
BLUE=\033[0;34m
NC=\033[0m
SRC=.
ERRORCHECK="Not all packages installed, try running `make install`. Exiting..."
CHECKTF := $(shell terraform --version 2>/dev/null)
CHECKTFSWITCH := $(shell tfswitch --version 2>/dev/null)
CHECKTFLINT := $(shell tflint --version 2>/dev/null)
CHECKTFSEC := $(shell tfsec --version 2>/dev/null)
CHECKTFORM := $(shell terraformer --version 2>/dev/null)
TERRAFORMBINARY := $(shell which terraform)

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

help: check
	@echo ' '
	@echo 'Usage: '
	@echo ' make install              attempt to install required dependencies    '
	@echo ' make check                check you have all required dependencies    '
	@echo ' make precommit            run precommit lint and test                 '
	@echo ' make tfswitch             set correct version of terraform (tfswitch) '
	@echo ' make tfinit                initialise terraform requirements           '
	@echo ' make tfplan               run terraform plans                         '
	@echo ' make tfapply              apply terraform on project folder           '
	@echo ' make tfproviders          print providers for project folder          '
	@echo ' make tfreconfigure		   reconfigure terraform state                  '
	@echo ' make lint                 lint and validate terraform project         '
	@echo ' make secure               test project security                       '
	@echo ' make clean                remove all local caches                     '
	@echo ' '

precommit: check
	@echo -e "${BLUE}🛫 Running pre-commit scripts against source and test files...${NC}\n"
	@pre-commit run --all-files

install:
	@brew install pre-commit gawk terraform-docs tflint tfsec coreutils
	@brew install warrensbox/tap/tfswitch
	@brew install --HEAD terraformer

tfstage:
	@if [ "$(DEBUG_MODE)" = "true" ]; then \
		export TF_LOG=TRACE; \
	else \
		unset TF_LOG; \
	fi; \

tfswitch: tfstage
	@tfswitch --chdir=$(p) --latest

tfinit: tfstage
	@$(TERRAFORMBINARY) -chdir=$(p) init -input=false -upgrade -backend-config=s3.tfvars

tfplan: tfstage
	@$(TERRAFORMBINARY) -chdir=$(p) plan -input=false

tfapply: tfstage
	@$(TERRAFORMBINARY) -chdir=$(p) apply -input=false -auto-approve

tfproviders: tfstage
	@$(TERRAFORMBINARY) -chdir=$(p) providers

tfreconfigure: tfstage
	@$(TERRAFORMBINARY) -chdir=$(p) init -migrate-state -backend-config=s3.tfvars

tfstateshow:
	@$(TERRAFORMBINARY) -chdir=$(p) state show .terraform/terraform.tfstate

secure:
	@tfsec $(p)

lint:
	@$(TERRAFORMBINARY) -chdir=$(p) fmt -write=true -diff=true -recursive
	@tflint --chdir=$(p) --color
