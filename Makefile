# Project entry point. `make` (or `make help`) lists the targets.
# Every folder declares its targets in <folder>/<folder>.mk; they are only included here.

.DEFAULT_GOAL := help
ROOT := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))

include mk/common.mk
include study/study.mk
