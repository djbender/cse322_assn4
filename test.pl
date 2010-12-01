noRepairCoverage(Fuel, Region, Cell) :-
	process(Region, Cell).

process([],A,A).
process([[]|Z],A,B) :-
	process(Z,A,B).
process([[H|T]|Z],A,B) :-
	write(H), nl, C is A+1, process([T|Z],C,B).
