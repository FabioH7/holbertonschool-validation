build: ## builds the go api
	make lint
	go build

run: ## compiles the code and creates a log file named awesome-api
	./awesome-api >./awesome-api.log 2>&1 &

lint: ## Checks the lint for go
	golangci-lint run

stop: ## stops the api server 
	pkill awesome-api
clean: ## removes the compiled file and the log file
	rm awesome-api awesome-api.log

test:  ## tests if the api server is running properly
	curl http://localhost:9999
	curl http://localhost:9999/health

help: ## Find out what each command does
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'