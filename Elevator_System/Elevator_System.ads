package Elevator_System is
	type ElevatorArray is array (Integer range <>) of Integer;
	protected type Elevator_Shaft(Floors: Integer := 10) is
		function CheckCall(Call: Integer) return Integer;
		function CheckDestination(Dest: Integer) return Integer;
		function IsAvailable(ElevatorNum: Integer; Call: Integer) return Boolean;
		procedure GetCall(ElevatorNum: Integer; Call: Integer; ReturnValue: in out Integer);
		procedure GetDestination(ElevatorNum: Integer; Dest: Integer; ReturnValue: in out Integer);
		procedure CallElevator(Call: Integer; Dest: Integer);
		procedure getNext(ElevatorNum: Integer; result: in out Integer);
		function sameDirection(Caller : Integer; Direction : Integer) return Boolean;
		function canPickUp(ElevatorNum: Integer; caller: Integer; currentDestination: Integer; currentFloor: Integer; direction: Integer) return Boolean;
		function canLeave(ElevatorNum: Integer; caller: Integer; currentDestination: Integer; currentFloor: Integer) return Boolean;
		function getNumberOfFloors return Integer;
	private
	   destinationFloor: ElevatorArray(1..Floors) := (1..Floors => 0);
	   callFloor: ElevatorArray(1..Floors) := (1..Floors => 0);
	   callOrders: ElevatorArray(1..Floors) := (1..Floors => 0);
	   currentOrder: Integer := 1;
	   elevatorTasks: ElevatorArray(1..Floors) := (1..Floors => 0);
	end Elevator_Shaft;
end Elevator_System;