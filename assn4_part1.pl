/*might need to flip*/
returnCell(Grid,X,Y,Cell) :-
	nth1(Y,Grid,Z),
	nth1(X,Z,Cell).

noRepairCoverage(FuelCap,Region,Cell) :-
	returnCell(Region,X,Y,1),
	not(doit(FuelCap,Region,X,Y)),
	append([X],[],T),
	append([Y],T,Cell).

doit(FuelCap,Region,X,Y) :-
	returnCell(Region,A,B,2),
	pathFinder(Region,FuelCap,A,B,X,Y,[],FuelCap,0).

/*pathFind(Grid,1,1,5,5,[],Route)*/
pathFinder(_Grid,_FuelCap,Sx,Sy,Ex,Ey,_Visited,_OFuelCap,_JustFueled) :-
	Sx = Ex,
	Sy = Ey.
/*Recharge Fuel*/
pathFinder(Grid,_FuelCap,Sx,Sy,Ex,Ey,Visited,OFuelCap,JustFueled) :-
	/*debug*/
	/*
	write('3Cell: '), write(Sx),write(','),write(Sy),write('End: '),write(Ex),write(','),write(Ey),nl, 
	*/
	JustFueled = 0,
	neighborSquare(Grid,Sx,Sy,Rx,Ry),
	returnCell(Grid,Rx,Ry,3),
	pathFinder(Grid,OFuelCap,Sx,Sy,Ex,Ey,Visited,OFuelCap,1).
pathFinder(Grid,FuelCap,Sx,Sy,Ex,Ey,Visited,OFuelCap,JustFueled) :-
	/*debug*/
	/*
	write('NCell: '), write(Sx),write(','),write(Sy),write('End: '),write(Ex),write(','),write(Ey),nl,
	*/
	FuelCap > 0,
	FCNew is FuelCap - 1,
	neighborSquare(Grid,Sx,Sy,Rx,Ry),
	returnCell(Grid,Rx,Ry,1),
	not(member((Rx,Ry),Visited)),
	append([(Rx,Ry)],Visited,V1),
	pathFinder(Grid,FCNew,Rx,Ry,Ex,Ey,V1,OFuelCap,0).
	
neighborSquare(Grid,X,Y,Rx,Ry) :-
	subListLength(Grid, LX),
	length(Grid, LY),
	Rx is X+1,
	Ry is Y,
	Rx =< LX, Rx > 0,
	Ry =< LY, Ry > 0
	;
	subListLength(Grid, LX),
	length(Grid, LY),

	Rx is X-1,
	Ry is Y,
	Rx =< LX, Rx > 0,
	Ry =< LY, Ry > 0
	;
	subListLength(Grid, LX),
	length(Grid, LY),
	Rx is X,
	Ry is Y+1,
	Rx =< LX, Rx > 0,
	Ry =< LY, Ry > 0
	;
	subListLength(Grid, LX),
	length(Grid, LY),
	Rx is X,
	Ry is Y-1,
	Rx =< LX, Rx > 0,
	Ry =< LY, Ry > 0.

subListLength([List|_Rest], L) :-
	length(List, L).

