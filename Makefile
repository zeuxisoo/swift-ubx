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

build:
	@swift build

run: build
	@.build/debug/Application

clean:
	@rm -rf .build

release: clean
	@swift build -c release
