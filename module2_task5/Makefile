build:  ## builds everything
	make go-build
	make hugo-build 

hugo-build: ## build a new hugo template
	make check
	hugo > /dev/null 2>&1

go-build: ## builds the go api
	make lint
	go build

lint: ## Checks the lint for go
	golangci-lint run

clean: ## remove /dist
	rm -rf dist awesome-api awesome-api.log coverage-integrations.out coverage-units.out

check: ## checks the markdown for styling problems
	markdownlint content/posts/*
	markdown-link-check content/posts/*

validate: ## validate html
	python3 opt/W3C-Validator/w3c_validator.py ./dist/index.html || true

post: ## builds a new post in hugo template
	hugo new posts/$(POST_NAME).md
	sed -i '/title:/c\title: "$(POST_TITLE)"' content/posts/$(POST_NAME).md

help: ## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

test: integration-tests unit-tests ## tests if the api server is running properly
	
unit-tests: ## run unit tests
	go test -v -short -coverprofile=coverage-units.out
 
integration-tests:  ## run integration tests
	go test -v -coverprofile=coverage-integrations.out

stop: ## stops the api server 
	pkill awesome-api

run: ## compiles the code and creates a log file named awesome-api
	./awesome-api >./awesome-api.log 2>&1 &