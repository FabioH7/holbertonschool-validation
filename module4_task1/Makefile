DOCKER= docker run -v "${PWD}:/go/src/app" -w "/go/src/app" $(DOCKER_IMAGE)
DOCKER_IMAGE = awesome:build
TARGET=awesome-api
RM=rm -rf
MAKE=make
COVERAGE=coverage
HUGO=hugo

build: build-docker	## Generate the source code of the application to binary.
	$(MAKE) lint
	$(DOCKER) go mod tidy
	$(MAKE) check && make hugo-build && make go-build

build-docker: ## builds docker
	docker build -t $(DOCKER_IMAGE) .build

go-build: #builds go files
	$(DOCKER) go build -o $(TARGET)

hugo-build: # builds Hugo
	$(HUGO)

run:  ## runs api
	./$(TARGET) >./$(TARGET).log 2>&1 &

post:  ## Create a new blog post whose filename and title come from the environment variables POST_TITLE and POST_NAME
	$(HUGO) new posts/$(POST_NAME).md
	sed -i '2s/.*/title: "$(POST_TITLE)"/' content/posts/$(POST_NAME).md

stop:	## Stop the application.
	@pkill $(TARGET)

clean:	## Stop the application. Delete the binary and the log file.
	@if pgrep -x $(TARGET) > /dev/null; then \
		pkill $(TARGET); \
	fi
	@$(RM) $(TARGET) $(TARGET).log $(COVERAGE)-units.out $(COVERAGE)-integrations.out dist/ *~

test: build-docker ## Test the application.
	$(MAKE) unit-tests
	$(MAKE) integration-tests
	$(MAKE) validate

unit-tests: ## Run unit tests
	$(DOCKER) go test -v -short -coverprofile=$(COVERAGE)-units.out

integration-tests: ## Run integration tests
	$(DOCKER) go test -v -coverprofile=$(COVERAGE)-integrations.out

lint: ## i fucking hate you lint
	markdownlint README.md DEPLOY.md

check:	## Lint markdonw source, check dead links
	markdownlint content/**/*.md
	find content -name \*.md -print0 | xargs -0 -n1 markdown-link-check

validate:	## Validate the file dist/index.html using the command line Holberton’s W3C Validator.
	python3 /opt/W3C-Validator/w3c_validator.py ./dist/index.html || true

package: ## zips files
	zip -r awesome-website.zip awesome-api ./dist

help:	## Show this help usage.
	@sed -ne '/@sed/!s/## //p' $(MAKEFILE_LIST)
