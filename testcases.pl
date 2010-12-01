main :- true.

main1part1 :-
	(
	consult(assn4_part1),
	getTest1(Region, Fuel),
	noRepairCoverage(Fuel, Region, Cell),
	print(Cell),
	print('\n')
	);
	(
	print(fail),
	print('\n')
	).
main1part2 :-
	(
	consult(assn4_part2),
	getTest1(Region, _Fuel),
	routeToFire(Region, Station, Path),
	print('\n'),
	print('Station: '),
	print(Station),
	print('\nPath: '),
	print(Path)
	);
	(
	print(fail),
	print('\n')
	).

main2part1 :-
	(
	consult(assn4_part1),
	getTest2(Region, Fuel),
	noRepairCoverage(Fuel, Region, Cell),
	print(Cell),
	print('\n')
	);
	(
	print(fail),
	print('\n')
	).
main2part2 :-
	(
	consult(assn4_part2),
	getTest2(Region, _Fuel),
	routeToFire(Region, Station, Path),
	print('\n'),
	print('Station: '),
	print(Station),
	print('\nPath: '),
	print(Path)
	);
	(
	print(fail),
	print('\n')
	).

main3part1 :-
	(
	consult(assn4_part1),
	getTest3(Region, Fuel),
	noRepairCoverage(Fuel, Region, Cell),
	print(Cell),
	print('\n')
	);
	(
	print(fail),
	print('\n')
	).
main3part2 :-
	(
	consult(assn4_part2),
	getTest3(Region, _Fuel),
	routeToFire(Region, Station, Path),
	print('\n'),
	print('Station: '),
	print(Station),
	print('\nPath: '),
	print(Path)
	);
	(
	print(fail),
	print('\n')
	).

main4part1 :-
	(
	consult(assn4_part1),
	getTest4(Region, Fuel),
	noRepairCoverage(Fuel, Region, Cell),
	print(Cell),
	print('\n')
	);
	(
	print(fail),
	print('\n')
	).
main4part2 :-
	(
	consult(assn4_part2),
	getTest4(Region, _Fuel),
	routeToFire(Region, Station, Path),
	print('\n'),
	print('Station: '),
	print(Station),
	print('\nPath: '),
	print(Path)
	);
	(
	print(fail),
	print('\n')
	).

main5part1 :-
	(
	consult(assn4_part1),
	getTest5(Region, Fuel),
	noRepairCoverage(Fuel, Region, Cell),
	print(Cell),
	print('\n')
	);
	(
	print(fail),
	print('\n')
	).
main5part2 :-
	(
	consult(assn4_part2),
	getTest5(Region, _Fuel),
	routeToFire(Region, Station, Path),
	print('\n'),
	print('Station: '),
	print(Station),
	print('\nPath: '),
	print(Path)
	);
	(
	print(fail),
	print('\n')
	).

getTest1(Region, Cap) :-
	Region = [[2, 1, 1, 1], [5, 1, 0, 1], [0, 1, 0, 1], [4, 1, 1, 1]],
	Cap = 4.

getTest2(Region, Cap) :-
	Region = [[1, 0, 5, 0, 0, 4] ,[1 ,1 ,1 ,1 ,0 ,1] ,[0, 1, 3, 1, 0, 1], [2, 1, 1, 1, 4, 0], [0, 0, 1, 0, 0, 3], [0, 3, 1, 1, 1, 1], [0, 0, 4, 0, 0, 1]],
	Cap = 2.

getTest3(Region, Cap) :-
	Region = [[4, 1, 1, 1, 1, 5, 1, 3, 1, 1, 1, 1, 1], [0, 0, 1, 1, 1, 0, 1, 3, 1, 1, 1, 1, 2]],
	Cap = 4.

getTest4(Region, Cap) :-
	Region = [[4, 1, 1, 4, 1, 5], [0, 0, 0, 2, 1, 0], [1, 1, 1, 1, 1, 1]],
	Cap = 120.

getTest5(Region, Cap) :-
	Region = [[0, 0, 4, 0, 0], [3, 1, 1, 1, 3], [2, 1, 1, 1, 2], [1, 3, 3, 3, 1], [1, 1, 1, 1, 1]],
	Cap = 1.
