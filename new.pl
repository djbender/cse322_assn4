route(Start, End, Visited, [End | Visited]) :-
	path(Start, End).
route(Start, End, Visited, Route) :-
	path(Start, Via),
	route(Via, End, [Via | Visited], Route).

subListLength([List|_Rest], L) :-
	length(List, L).

normal( In, Out ) :-
    normal( In, [], Out ).
normal( [], L, L ).
normal( A, L, [A|L] ) :-
	var( A ), !.
normal( A, L, [A|L] ) :-
	not( islist(A) ), !.
normal( [H|T], Sofar, Result ) :-
	normal( T, Sofar, Sofar1 ),
	normal( H, Sofar1, Result ), !.

islist( [] ) :- !.
islist( [_|_] ).

/*
groute(Grid,S1,S2,C1,C2,V1,V2,Visited,[End|Visited]) :-
	path(
groute(Grid,S1,S2,C1,C2,V1,V2,Visited,Route) :-
*/	
path(_Grid,S1,S2,C1,C2,Route) :-
	S1 is C1+1, 
	append([(S1,S2)],[(C1,C2)],Route)
	; 
	S1 is C1-1,
	append([(S1,S2)],[(C1,C2)],Route)
	;	
	S2 is C2+1,
	append([(S1,S2)],[(C1,C2)],Route)
	;	
	S2 is C2-1,
	append([(S1,S2)],[(C1,C2)],Route).

simpler(Grid,2) :-
	subListLength(Grid, L),
	do(Grid,Grid,L).

/*do([[Head|Tail]|[Rest]],Visited,L,Route) :-*/

/*
redo(Grid,Result) :-
	subListLength(Grid,L),
	redo_(Grid,L,1,1,Result).
redo_([[Head|Tail]|Rest],L,X,Y,Result) :-
	write(Head),nl,
	append([(X,Y,Head)],[], Temp),
	redo__([Tail|Rest],L,X,Y,Temp,Result).
redo__([[Head|Tail]|Rest],L,X,Y,Temp,Result) :-
	append([(X,_T,Head)],Temp,Result),
	redo__([Tail|Rest],L,X,Y,Temp,Result).

asdf(Grid,L,Result) :-
	asdf_(Grid,1,1,L,Result). 
*/
/*asdf_([[1],[2]],1,1,2,[],Result)*/
/*asdf_([[Head|Tail]|Rest],X,Y,L,Visited,Result) :-
	append([(X,Y,Head)],Visited,Result),
	X1 is X+1,
	asdf_([Tail|Rest],X1,Y,Result).

fdsa([Head|Tail],X,Y,Visited,Result) :-
	append([(X,Y,Head)],Visited,Result),
	X1 is X+1,
	fdsa(Tail,X1,Y,Visited,Result).
*/
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
	pathFinder(Region,FuelCap,A,B,X,Y,[],FuelCap).

/*pathFind(Grid,1,1,5,5,[],Route)*/
pathFinder(_Grid,_FuelCap,Sx,Sy,Ex,Ey,_Visited,_OFuelCap) :-
	Sx = Ex,
	Sy = Ey.
/*Recharge Fuel*/
pathFinder(Grid,_FuelCap,Sx,Sy,Ex,Ey,Visited,OFuelCap) :-
	neighborSquare(Grid,Sx,Sy,Rx,Ry),
	returnCell(Grid,Rx,Ry,3),
	not(member((Rx,Ry),Visited)),
	append([(Rx,Ry)],Visited,V1),
	pathFinder(Grid,OFuelCap,Sx,Sy,Ex,Ey,V1,OFuelCap).
pathFinder(Grid,FuelCap,Sx,Sy,Ex,Ey,Visited,OFuelCap) :-
	FuelCap > 0,
	FCNew is FuelCap - 1,
	neighborSquare(Grid,Sx,Sy,Rx,Ry),
	returnCell(Grid,Rx,Ry,1),
	not(member((Rx,Ry),Visited)),
	append([(Rx,Ry)],Visited,V1),
	pathFinder(Grid,FCNew,Rx,Ry,Ex,Ey,V1,OFuelCap).
	
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
