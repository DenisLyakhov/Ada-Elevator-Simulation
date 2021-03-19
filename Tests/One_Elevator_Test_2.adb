with Ada.Text_IO, Elevator_System;
use Ada.Text_IO;

procedure One_Elevator_Test_2 is

-- Liczba pieter
Elevator_System1 : Elevator_System.Elevator_Shaft(10);
Elevator_Count : Integer := 1;

task type Elevator is
end Elevator;

task body Elevator is
	currentFloor : Integer := 1;
	direction: Integer := 0;
	currentDestination: Integer := 0;
	tmp: Integer := 0;
	i: Integer := 0;
	Elevator_Num : Integer;
begin
	Elevator_Num := Elevator_Count;
	Elevator_Count := Elevator_Count + 1;
	loop
		i := 0;
		while i = 0 loop
			--Put_Line("Main loop " & Elevator_Num'Img);
			Elevator_System1.getNext(Elevator_Num, i);
			--delay 0.1;
		end loop;
		--Put_Line("i = " & i'Img);
			
			-- IsAvailable may be not neccesary
			--Put_Line(Elevator_System1.CheckCall(i)'Img & " " & Elevator_System1.CheckDestination(i)'Img);
			
			
			--if Elevator_System1.CheckCall(i) /= 0 or Elevator_System1.CheckDestination(i) /= 0 then
				Put_Line("Elevator (" & Elevator_Num'Img & " ) starts at " & currentFloor'Img);
				
				-- CHECK: Maybe Dest isnt neccesary???
				if Elevator_System1.CheckCall(i) /= 0 then
					Elevator_System1.GetCall(Elevator_Num, i, currentDestination);
					--Put_Line("CALL");
					--Put_Line("Elevator (" & Elevator_Num'Img & ") Call: " & currentDestination'Img);
				else
					Elevator_System1.GetDestination(Elevator_Num, i, currentDestination);
					--Put_Line("Elevator (" & Elevator_Num'Img & ") Dest: " & currentDestination'Img);
					--Put_Line("DEST");
				end if;
				
				while currentDestination /= 0 loop
				
					if currentDestination < currentFloor then
						direction := -1;
					else
						direction := 1;
					end if;
					
					while currentFloor /= currentDestination loop
						currentFloor := currentFloor + direction;
						Put_Line("Elevator (" & Elevator_Num'Img & " ) currently at " & currentFloor'Img);
						
						-- CHANGE TO NUMBER OF FLOORS
						for caller in 1..Elevator_System1.getNumberOfFloors loop
						--Put_Line("Call from " & Elevator_System1.CheckCall(caller)'Img);
						--Put_Line("To " & Elevator_System1.CheckDestination(caller)'Img);
							if Elevator_System1.canPickUp(Elevator_Num, caller, currentDestination, currentFloor, direction) then
								Elevator_System1.GetCall(Elevator_Num, caller, tmp);
								Put_Line("Elevator (" & Elevator_Num'Img & " ) opens and closes at " & currentFloor'Img);
								delay 2.0;
							end if;
							if Elevator_System1.canLeave(Elevator_Num, caller, currentDestination, currentFloor) then
								Elevator_System1.GetDestination(Elevator_Num, caller, tmp);
								Put_Line("Elevator (" & Elevator_Num'Img & " ) opens and closes at " & currentFloor'Img);
								delay 2.0;
							end if;
						end loop;
						delay 1.0;
					end loop;
					
					Put_Line("Elevator (" & Elevator_Num'Img & " ) opens and closes at " & currentFloor'Img);
					delay 2.0;
					
					Elevator_System1.GetDestination(Elevator_Num, i, currentDestination);
				
				end loop;
			--end if;
			
	end loop;
end Elevator;

procedure callElevator(Call: in Integer; Dest: in Integer; Del: in Float := 0.0) is
begin
	delay 1.0;
	delay Duration(Del);
	Put_Line("-------------------------------------------------------");
	Put_Line("Got Elevator Call from floor *" & Call'Img & " * to floor *" & Dest'Img & " *");
	Put_Line("-------------------------------------------------------");
	Elevator_System1.CallElevator(Call, Dest);
end callElevator;

-- Tworzenie kabin
Elevator1: Elevator;

begin
	callElevator(10, 1);
	callElevator(3, 9);
	callElevator(8, 2);
end One_Elevator_Test_2;
  