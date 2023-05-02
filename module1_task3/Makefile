build: ## build a new hugo template
	hugo > /dev/null 2>&1

clean: ## remove /dist
	rm -rf dist/*

post: ## builds a new post in hugo template
	hugo new posts/$(POST_NAME).md
	sed -i '/title:/c\title: "$(POST_TITLE)"' content/posts/$(POST_NAME).md

help: ## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'