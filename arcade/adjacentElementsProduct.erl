-module(adjacentElementsProduct).
-export([adjacentElementsProduct/1]).

adjacentElementsProduct(InputArray) ->
    recElemProduct(InputArray, []).

recElemProduct([H|[H2 | T]], Accumulator) ->
    recElemProduct([H2 | T], [H*H2 | Accumulator]);

recElemProduct([_], Accumulator) ->
    lists:max(Accumulator).
