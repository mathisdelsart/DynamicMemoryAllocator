# Compiler settings
CC = gcc
CFLAGS = -Wall -Wextra -Werror -g
TARGET = memory_management.out

# Source files
SRCS = memory_management.c
OBJS = $(SRCS:.c=.o)

# Default target
.PHONY: all
all: build run

# Build the project
.PHONY: build
build: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $^

%.o: %.c memory_management.h
	$(CC) $(CFLAGS) -c $< -o $@

# Run the program
.PHONY: run
run: $(TARGET)
	./$(TARGET)

# Clean generated files
.PHONY: clean
clean:
	rm -f $(TARGET) $(OBJS)

# Show help
.PHONY: help
help:
	@echo "Available targets:"
	@echo "  make all     - Build and run the program (default)"
	@echo "  make build   - Compile the program"
	@echo "  make run     - Execute the program"
	@echo "  make clean   - Remove all generated files"
	@echo "  make help    - Show this help message"