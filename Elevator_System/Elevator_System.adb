with Ada.Text_IO;
use Ada.Text_IO;

package body Elevator_System is 
 
  protected body Elevator_Shaft is

	  function CheckCall(Call: Integer) return Integer is
	  begin
		return callFloor(Call);
	  end CheckCall;
	  
	  function CheckDestination(Dest: Integer) return Integer is
	  begin
		return destinationFloor(Dest);
	  end CheckDestination;
	  
	  function IsAvailable(ElevatorNum: Integer; Call: Integer) return Boolean is
	  begin
		return elevatorTasks(Call) = 0 or elevatorTasks(Call) = ElevatorNum;
	  end IsAvailable;
	  
	  procedure GetCall(ElevatorNum: Integer; Call : Integer; ReturnValue: in out Integer) is
	  begin
		ReturnValue := callFloor(Call);
		callFloor(Call) := 0;
		elevatorTasks(Call) := ElevatorNum;
	  end GetCall;
	  
	  procedure GetDestination(ElevatorNum: Integer; Dest : Integer; ReturnValue: in out Integer) is
	  begin
		ReturnValue := destinationFloor(Dest);
		destinationFloor(Dest) := 0;
		callOrders(Dest) := 0;
		elevatorTasks(Dest) := 0;
	  end GetDestination;
	  
	  procedure CallElevator(Call: Integer; Dest: Integer) is
	  begin
		callFloor(Call) := Call;
		destinationFloor(Call) := Dest;
		callOrders(Call) := currentOrder;
		currentOrder := currentOrder + 1;
		elevatorTasks(Call) := 0;
	  end CallElevator;
	  
	  procedure getNext(ElevatorNum: Integer; result: in out Integer) is
		first : Integer := 0;
	  begin
		result := 0;
		for i in callOrders'Range loop
				if (callOrders(i) /= 0 and elevatorTasks(i) = 0) and (first = 0 or callOrders(i) < first) then
					first := callOrders(i);
					result := i;
				end if;
		end loop;
		if result /= 0 then
			elevatorTasks(result) := ElevatorNum;
		end if;
	  end getNext;
	  
	  function sameDirection(Caller : Integer; Direction : Integer) return Boolean is
	  begin
		return (CheckDestination(Caller) - CheckCall(Caller)) * Direction > 0;
	  end sameDirection;
	  
	  function canPickUp(ElevatorNum: Integer; caller: Integer; currentDestination: Integer; currentFloor: Integer; direction: Integer) return Boolean is
	  begin
		return CheckCall(caller) /= currentDestination and CheckCall(caller) = currentFloor and sameDirection(caller, direction) and elevatorTasks(caller) = 0;
	  end canPickUp;
	  
	  function canLeave(ElevatorNum: Integer; caller: Integer; currentDestination: Integer; currentFloor: Integer) return Boolean is
	  begin
		return CheckDestination(caller) /= currentDestination and CheckDestination(caller) = currentFloor and CheckCall(caller) = 0 and CheckDestination(currentDestination) /= currentFloor and elevatorTasks(caller) = ElevatorNum;
	  end canLeave;
	  
	  function getNumberOfFloors return Integer is
	  begin
		return Floors;
	  end getNumberOfFloors;
  
  end Elevator_Shaft;
 
end Elevator_System;