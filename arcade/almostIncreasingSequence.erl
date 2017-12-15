-module(almostIncreasingSequence).
-export([almostIncreasingSequence/1]).

almostIncreasingSequence(Sequence) ->
  isIncreasing(Sequence).

isIncreasing([H | [H2|T] ]) when H < H2 ->
  isIncreasing([H2|T]);

isIncreasing([H|[H2|_]]) when H > H2 ->
  false;
isIncreasing([H|[H|_]]) ->
  false;
isIncreasing([_| []]) ->
  true.
