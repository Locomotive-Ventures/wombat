.ONESHELL:
.PHONY: all help install check precommit tfswitch tfinit tfplan tfapply tfproviders tfreconfigure lint secure clean
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
TERRAFORMBINARY := $(shell which terraform)
p = infrastructure/terraform

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

tfswitch:
	@tfswitch --chdir=$(p) --latest

tfinit:
	@$(TERRAFORMBINARY) -chdir=$(p) init -upgrade

tfplan:
	@export TF_LOG=TRACE; $(TERRAFORMBINARY) -chdir=$(p) plan

tfapply:
	@export TF_LOG=TRACE; $(TERRAFORMBINARY) -chdir=$(p) apply -input=false -auto-approve

tfproviders:
	@$(TERRAFORMBINARY) -chdir=$(p) providers

tfreconfigure:
	@$(TERRAFORMBINARY) -chdir=$(p) init -migrate-state

secure:
	@tfsec $(p)

lint:
	@tflint --color $(p)

