-module(candies).
-export([candies/2]).

candies(N, M) ->
    N * (M div N).
