all: js

build:
	dune build

doc:
	dune build @doc

%.bc.js: build
	dune build src/$(@) --profile release

js: box.bc.js stage.bc.js
