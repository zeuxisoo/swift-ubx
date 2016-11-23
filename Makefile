usage:
	@echo "make init"
	@echo "make deps"
	@echo "make build"
	@echo "make run"
	@echo "make clean"
	@echo "make release"

init:
	@swift package SwiftUbx

deps:
	@swift package fetch

build: deps
	@swift build

run: build
	@.build/debug/Application

clean-deps:
	@rm -rf Packages

clean: clean-deps
	@rm -rf .build

release: clean deps
	@swift build -c release
