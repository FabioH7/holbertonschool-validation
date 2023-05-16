# Deploy Information

## What is the archive and how to unarchive it?

--- The archive is named awesome-web.zip and is created on each commit
--- You can run the command:

```bash
unzip awesome-website.zip
```

### What are the commands to start and stop the application?

```bash
make run ## Starts the server
make stop ## Stops the server
```

#### How to customize where the application logs are written?

--- Change the TARGET variable value

#### How to “quickly” verify that the application is running (healthcheck)?

--- Make an api call to 0.0.0.0:9999/health and you should get back the message "ALIVE"
