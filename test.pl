noRepairCoverage(Fuel, Region, Cell) :-
	process(Region, Cell).

process([],_,_,L,L).
process([[]|Rest],_,Y,L,Z) :-
	X1 is 0,
	Y1 is Y+1,
	process(Rest,X1,Y1,L,Z).
process([[Head|Tail]|Rest],X,Y,L,Z) :-
	write('@'), write(X), write(','), write(Y), write(': '), write(Head), nl, 
	X1 is X+1,
	Count is L+1, 
	process([Tail|Rest],X1,Y,Count,Z).
