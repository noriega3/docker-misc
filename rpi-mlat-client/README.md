# rpi-mlat-client

This is the mutability client that selectively forwards Mode S messages to a server that resolves the transmitter position by multilateration of the same message received by multiple clients.

The source code is at https://github.com/mutability/mlat-client

Example:
```
docker run -t -i bradsjm/rpi-mlat-client --help
```
