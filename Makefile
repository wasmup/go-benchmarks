.PHONY: all small test bench push run init ck lines race cost

all:
	go install -ldflags=-s

small:
	# make small binary:
	go build -ldflags "-s -w" .
	ls -lh

run:
	go run .

cost:	
	go build -gcflags=-m=2 . 2>&1 | code -
	
test:
	go test

bench:	
	go test -benchtime=400000000x -benchmem -run=^$ -bench .

push:
	git push

sameAsRemote:
	git fetch origin
	git reset --hard origin/main

ck:
	# git fsck
	# https://github.com/dominikh/go-tools
	# https://staticcheck.io/docs/
	staticcheck ./...

	# gc:
	# git gc

lines:
	# git ls-files | grep "\(.html\|.css\|.js\|.go\)$" | xargs wc -l
	git ls-files | xargs cat | wc -l

race:
	# The race detector is fully integrated with the Go toolchain. 
	# build your code with the race detector enabled, 
	# just add the -race flag to the command line:
	go build -race .  	

init:
	go get
	git log --graph --oneline --all
	
wasm:
	# cp "$(go env GOROOT)/misc/wasm/wasm_exec.js" .
	GOOS=js GOARCH=wasm go build -o view/main.wasm	