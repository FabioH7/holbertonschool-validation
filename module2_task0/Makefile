build: ## builds the go api
	go build

run: ## compiles the code and creates a log file named awesome-api
	./awesome-api >./awesome-api.log 2>&1 &

stop: ## stops the api server 
	kill "$(pgrep awesome-api)"

clean: ## removes the compiled file and the log file
	kill "$(pgrep awesome-api)"
	rm awesome-api awesome-api.log

test:  ## tests if the api server is running properly
	curl http://localhost:9999
	curl http://localhost:9999/health

help: ## Find out what each command does
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'