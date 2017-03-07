usage:
	@echo
	@echo "Commands     : Description"
	@echo "------------ : -------------"
	@echo "make init    : Initial project when first start"
	@echo "make deps    : Install the dependencies / packages"
	@echo "make build   : Build the application to executable file"
	@echo "make run     : Run the built executable file"
	@echo "make clean   : Clean the build file"
	@echo "make release : Generate the release file"
	@echo

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
