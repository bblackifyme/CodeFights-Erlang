-module(makeArrayConsecutive2).
-export([makeArrayConsecutive2/1]).

makeArrayConsecutive2(Statues) ->
    Sorted = lists:sort(Statues),
    rec_get_deltas(Sorted, 0).

rec_get_deltas([H|[H2 | T]], Accumulator) ->
    rec_get_deltas([H2|T], Accumulator + (H2-H-1));

rec_get_deltas(_, Accumulator) ->
    Accumulator.
