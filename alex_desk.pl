% https://manuall.co.uk/ikea-alex-desk/
% Test case, simplified from link above,
% We have a desk with legs and a box top,
% the box top has two drawers. All the "wooden"
% parts are painted, the legs are metal. We also
% have a mug.

part(mug).
part(desk).

part(drawer-N) :- between(1, 2, N).
part(drawerBase-N) :- between(1, 2, N).
part(drawerFront-N) :- between(1, 2, N).
part(drawerBack-N) :- between(1, 2, N).
part(drawerLeft-N) :- between(1, 2, N).
part(drawerRight-N) :- between(1, 2, N).

part(deskBox).
part(deskBoxTop).
part(deskBoxBottom).
part(deskBoxSide-N) :- between(1, 2, N).
part(deskBoxCenter).
part(deskBoxBack).
part(paint).

part(legs).
part(legUpright-N) :- between(1, 4, N).
part(legShortBrace-N) :- between(1, 4, N).
part(legLongBrace-N) :- between(1, 3, N).

proper_part(desk, legs).
proper_part(desk, deskBox).

proper_part(legs, legsUpright-N) :- part(legsUpright-N).
proper_part(legs, legsShortBrace-N) :- part(legsShortBrace-N).
proper_part(legs, legsLongBrace-N) :- part(legsLongBrace-N).

proper_part(deskBox, drawer-N) :- part(drawer-N).
proper_part(deskBox, deskBoxSide-N) :- part(deskBoxSide-N).
proper_part(deskBox, deskBoxTop).
proper_part(deskBox, deskBoxBottom).
proper_part(deskBox, deskBoxCenter).
proper_part(deskBox, deskBoxBack).

proper_part(deskBoxSide-N, paint) :- part(deskBoxSide-N).
proper_part(deskBoxTop, paint).
proper_part(deskBoxBottom, paint).
proper_part(deskBoxCenter, paint).
proper_part(deskBoxBack, paint).

proper_part(drawer-N, drawerBase-N) :- part(drawer-N).
proper_part(drawer-N, drawerFront-N) :- part(drawer-N).
proper_part(drawer-N, drawerBack-N) :- part(drawer-N).
proper_part(drawer-N, drawerLeft-N) :- part(drawer-N).
proper_part(drawer-N, drawerRight-N) :- part(drawer-N).

proper_part(drawerBase-N, paint) :- part(drawerBase-N).
proper_part(drawerFront-N, paint) :- part(drawerFront-N).
proper_part(drawerBack-N, paint) :- part(drawerBack-N).
proper_part(drawerLeft-N, paint) :- part(drawerLeft-N).
proper_part(drawerRight-N, paint) :- part(drawerRight-N).
