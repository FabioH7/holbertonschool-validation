# Prerequisites

## Lifecycle

The application lifecycle includes several steps:

- `build`: Compile the source code to a binary named `awesome-api` with `go build`.

  The name `awesome-api` is from `go mod init github.com/<your github handle>/awesome-api`.

  Note: the first build may take some time.

- `run`: Run the application in the background by executing the `awesome-api` binary.

  Logs are written into a file named `awesome-api.log` with this command:

  `./awesome-api >./awesome-api.log 2>&1 &`.

- `stop`: Stop the application with `kill XXXXX` where `XXXXX`
  is the Process ID of the application.

  For instance, `kill "$(pgrep awesome-api)"`.

- `post`: Create a new blog post.
  The filename and title come from `POST_TITLE` and `POST_NAME`.

- `clean`: Stop the application, delete `awesome-api` binary
  and `awesome-api.log` file.

- `test`: Run tests to ensure that the application behaves as expected.

- `unit-tests`: Run unit tests.

- `integration-tests`: Run integration tests.

- `lint`: Lint Go lang code.

- `check`: Lint markdown source and check for dead links.

- `validate`: Validate `dist/index.html` using the
  command line Holberton’s W3C Validator.

- `workflow`: Use GitHub Actions for testing.

- `package`: Zip necessary files.

- `build-docker`: Builds docker container

- `docker-tests`: Checks dockers lint

- `help`: Display help message.
