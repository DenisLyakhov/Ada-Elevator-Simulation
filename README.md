# Ada-Elevator-Simulation

The program aims to demonstrate the operation of an elevator or several elevators in the form of a simulation written in Ada. The user will have the option
of manual configuration of the simulation (Number of floors in the building, number of elevetors, starting and destination floors for each individual person)

# User Manual

The program has two main files - "MainOneElevator.adb" (one elevator in the building) and "MainTwoElevators.adb" (two elevators in the building). 
As mentioned above, the user has the option of configuring simulation's parameters. To do this, in main methods of the main files, the user has
the ability to enter the desired sequence of elevator calls. This is done with
"callElevator" function. The first argument is starting floor as integer, the second argument - destination floor
for this call, the third argument - lag time (time in the form of Float, after
which the elevator call must follow, defaults to "0.0").
Additionally, the number of floors and elevator cabins in the system can be changed by giving an appropriate argument to the "Elevator Shaft" object at the beginning
of the program and creating a new Elevator object (example is given in the program).

# Compilation
To compile the main files, execute the command: "gnatmake -P ElevatorMain.gpr

# Tests

Tests are located in the "Tests" folder. To compile them, execute the command: "gnatmake -P Elevator_Tests.gpr". After that, the test simulations will be demonstrated by running the corresponding executables (eg. "One_elevator_test_1", "Two_elevator_test 4", etc.)
