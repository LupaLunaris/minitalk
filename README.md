# minitalk

A small client/server communication program written in C for the 42 curriculum.

Instead of using sockets, the client sends messages to the server using Unix signals (`SIGUSR1` and `SIGUSR2`) to represent individual bits.

## Build and run

On a Unix-like system:

```bash
make
./server
```

The server prints its process ID. From another terminal:

```bash
./client <server_pid> "Hello"
```

Replace `<server_pid>` with the PID printed by the server.

## Files

- `server.c`: signal reception and message reconstruction
- `client.c`: encoding characters and sending signals
- `utils.c`: helper functions
- `minitalk.h`: shared declarations

## What I learned

Signals are a very constrained communication mechanism. Implementing message transmission bit by bit made me think carefully about acknowledgements, timing and termination.
