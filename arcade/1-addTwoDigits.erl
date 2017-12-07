-module(addTwoDigits).
-export([addTwoDigits/1]).

addTwoDigits(N) ->
  (N div 10) + (N rem 10).
