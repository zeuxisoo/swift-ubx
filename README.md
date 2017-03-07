# Swift Ubx

Demo swift program to show the performance status in console

## Develop

Help

    make usage

Install the vendors / packages

    make deps

Build the application

    make build

Run the built application

    make run

Clean builds

    make clean

## Release

Generate the release file

    make release

## Usage

For develop, fetch target performance like

    swift build && .build/debug/Application fetch 31590

FOr release, fetch target perforamnce like

    ./.build/release/Application fetch 31590
