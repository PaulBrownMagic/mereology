:- begin_tests(mereology).

:- use_module(mereology).
% See: https://plato.stanford.edu/entries/mereology/
% Definitions up to section 3.1 included in tests

% example
test(proper_part_raw) :-
	proper_part(desk, legs).
test(proper_part_in_part) :-
	part(desk, legs).
% theoretical
test(proper_parthood) :-
	forall(proper_part(A, B),
		(	part(A, B),
			\+ A == B
		)).
test(proper_parthood_strict) :-
	forall(proper_part(A, B),
		(	part(A, B),
			\+ part(B, A)
		)).

% example
test(part_is_reflexive_desk) :-
	part(desk, desk).
test(part_is_transitive) :-
	part(desk, drawerFront-2).

% theoretical
test(part_is_reflexive) :-
	forall(part(P),
		part(P, P)).
test(part_antisymmetry) :-
	forall((part(A, B), part(B, A)),
		A == B).

% Will only pass if reflexive and transitive,
% depends on all parts in alex_desk.pl being part of desk
test(alex_desk_all_parts_part_of_desk) :-
	forall((part(P), P \= mug),
		part(desk, P)).

% example
test(equality_desk) :-
	part_equality(desk, desk).
test(equality_not_equal) :-
    forall((part(P), P \= desk),
		\+ part_equality(desk, P)).
% theoretical
test(equality) :-
	forall(part_equality(A, B),
		(	part(A, B),
			part(B, A)
		)).
% consequence of theory
test(part_identity) :-
	forall(part(P),
		part_equality(P, P)).

% example
test(proper_extension_desk) :-
	proper_extension(drawer-2, desk).
% theory
test(proper_extension) :-
	forall(proper_extension(A, B),
		(	part(B, A),
			\+ A == B
		)).

% example
test(overlaps_desk) :-
	part_overlaps(drawer-1, drawer-2).
% theory
test(overlaps) :-
	forall(part_overlaps(A, B),
		(	part(C, A),
			part(C, B)
		)).

% example
test(underlaps_desk) :-
	part_underlaps(drawer-1, drawer-2). % paint underlaps
% theory
test(underlaps) :-
	forall(part_underlaps(A, B),
		(	part(A, C),
			part(B, C)
		)).

% example
test(disjoint_desk_mug) :-
	part_disjoint(desk, mug).
% theory
test(disjointness) :-
	forall(part_disjoint(A, B),
		\+ part_overlaps(A, B)).

