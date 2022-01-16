

# TODO, explain

- document protoc install locally (dart pub global activate protoc_plugin)
- test if working with `protoc`

- install buf (gRPC tools - versioning / lints / generation / api breaking checks etc)

```bash
brew tap bufbuild/buf
brew install buf
```

run `./bin/generate` to get generated clients for app and server

-- document local server start
dart ./server/src/main.dart



# SERVER

- The server is pure dart
- On deploy we compile the bin/server.dart into an executable for speedier startups
- We only copy the executable to an empty docker container