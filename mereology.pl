:- module(mereology, [
	part/1,
	part/2,
	proper_part/2,
	part_equality/2,
	proper_extension/2,
	part_overlaps/2,
	part_underlaps/2,
	part_disjoint/2

]).

% Test example
:- ensure_loaded(alex_desk).

%! proper_part(A, B) is nondet.
%  B is a proper part of A means
%  B is a direct part of A and
%  A and B are different.
:- multifile(proper_part/2).

%! part(A) is nondet.
%  A is a part in the thing under
%  analysis
:- multifile(part/1).

%! part(A, B) is nondet.
%  B is a part of A is the
%  reflexive, transitive, and
%  antisymettric version of
%  proper_part/2

% Reflexive
part(Part, Part) :- part(Part).
% Transitive
part(Parent, Child) :-
	part_t(Parent, Child, [Parent]).
part_t(Parent, Child, Visited) :-
	proper_part(Parent, Child),
	\+ memberchk(Child, Visited).
part_t(Parent, Child, Visited) :-
	proper_part(Parent, Between),
	\+ memberchk(Between, Visited),
	part_t(Between, Child, [Between|Visited]).

%! part_equality(A, B) is det.
%  A and B are equal if they
%  are the same part.
part_equality(A, A).

%! proper_extension(A, B) is det.
%  B is a part extension of A if
%  it extends A, i.e. if B is a part
%  of A and the two parts aren't equal
proper_extension(Part, Extension) :-
	dif(Extension, Part),
	part(Extension, Part).

%! part_overlaps(A, B) is det.
%  A and B overlap if there is some
%  part of which both A and B are parts.
part_overlaps(A, B) :-
	part(X),
	part(X, A),
	part(X, B).

%! part_underlaps(A, B) is det.
%  A and B underlap if there is some
%  part which is part of both A and B.
part_underlaps(A, B) :-
	part(X),
	part(A, X),
	part(B, X).

%! part_disjoint(A, B) is det.
%  A and B are disjoint if they share no
%  parts.
part_disjoint(A, B) :-
	\+ part_underlaps(A, B).
