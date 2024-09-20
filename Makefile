# Author: Bodey Lassiter
# File: Makefile
# Last Modified: 09/20/2024
# Purpose: This Makefile is used to compile and link the Employee project, which
#          includes a base class Employee and derived classes: Officer and Supervisor.

# Compiler
CC = g++

# Target executable
TARGET = employee

# Compilation flags
CFLAGS = -c -Wall -Wextra   # Compile with all errors and warnings

# Default target: build the executable
all: $(TARGET)

# Link object files to create the executable
$(TARGET): main.o Employee.o Officer.o Supervisor.o
	$(CC) main.o Employee.o Officer.o Supervisor.o -o $(TARGET)

# Compile main.o from main.cpp
main.o: main.cpp Employee.h Officer.h Supervisor.h
	$(CC) $(CFLAGS) main.cpp

# Compile Employee.o from Employee.cpp
Employee.o: Employee.cpp Employee.h
	$(CC) $(CFLAGS) Employee.cpp

# Compile Officer.o from Officer.cpp
Officer.o: Officer.cpp Officer.h Employee.h
	$(CC) $(CFLAGS) Officer.cpp

# Compile Supervisor.o from Supervisor.cpp
Supervisor.o: Supervisor.cpp Supervisor.h Employee.h
	$(CC) $(CFLAGS) Supervisor.cpp

# Clean up the project directory
clean:
	rm -f *.o *~ $(TARGET)
