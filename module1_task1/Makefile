build:
	hugo > /dev/null 2>&1s

clean:
	rm -rf dist/*

post:
	hugo new posts/$(POST_NAME).md
	sed -i'.swp' -e 's/title: "$(POST_NAME)"/title: "$(POST_TITLE)"/g' content/posts/$(POST_NAME).md
	rm content/posts/$(POST_NAME).md.swp