
/*might need to flip*/
returnCell(Grid,X,Y,Cell) :-
	nth1(Y,Grid,Z),
	nth1(X,Z,Cell).

routeToFire(Region,Station,Path) :-
	returnCell(Region,X,Y,4),
	doit(Region,X,Y,Path),
	append([X],[],T),
	append([Y],T,Station).

doit(Region,X,Y,P) :-
	returnCell(Region,A,B,5),
	pathFinder(Region,X,Y,A,B,[],0,P).

pathFinder(_Grid,Sx,Sy,Ex,Ey,_Visited,_F,[]) :-
	/* debug */
	/*
	write('ECell: '), write(Sx),write(','),write(Sy),write('End: '),write(Ex),write(','),write(Ey),nl,
	*/
	Sx = Ex,
	Sy = Ey.
	
pathFinder(Grid,Sx,Sy,Ex,Ey,Visited,_F,Path) :-
	/* debug */
	/*
	write('1Cell: '), write(Sx),write(','),write(Sy),write('End: '),write(Ex),write(','),write(Ey),nl,
	*/
	neighborSquare(Grid,Sx,Sy,Rx,Ry,_),
	returnCell(Grid,Rx,Ry,5),
	pathFinder(Grid,Rx,Ry,Ex,Ey,Visited,1,Path).

	
pathFinder(Grid,Sx,Sy,Ex,Ey,Visited,F,Path) :-
	/* debug */
	/*
	write('0Cell: '), write(Sx),write(','),write(Sy),write('End: '),write(Ex),write(','),write(Ey),nl,
	*/
	F = 0,
	neighborSquare(Grid,Sx,Sy,Rx,Ry,D),
	returnCell(Grid,Rx,Ry,1),
	not(member((Rx,Ry),Visited)),
	append([(Rx,Ry)],Visited,V1),
	pathFinder(Grid,Rx,Ry,Ex,Ey,V1,0,P1),
	append([D],P1,Path).
	
neighborSquare(Grid,X,Y,Rx,Ry,r) :-
	subListLength(Grid, LX),
	length(Grid, LY),
	Rx is X+1,
	Ry is Y,
	Rx =< LX, Rx > 0,
	Ry =< LY, Ry > 0.
neighborSquare(Grid,X,Y,Rx,Ry,l) :-
	subListLength(Grid, LX),
	length(Grid, LY),
	Rx is X-1,
	Ry is Y,
	Rx =< LX, Rx > 0,
	Ry =< LY, Ry > 0.
neighborSquare(Grid,X,Y,Rx,Ry,d) :-
	subListLength(Grid, LX),
	length(Grid, LY),
	Rx is X,
	Ry is Y+1,
	Rx =< LX, Rx > 0,
	Ry =< LY, Ry > 0.
neighborSquare(Grid,X,Y,Rx,Ry,u) :-
	subListLength(Grid, LX),
	length(Grid, LY),
	Rx is X,
	Ry is Y-1,
	Rx =< LX, Rx > 0,
	Ry =< LY, Ry > 0.

subListLength([List|_Rest], L) :-
	length(List, L).

