-module(isInfiniteProcess).
-export([isInfiniteProcess/2]).

isInfiniteProcess(A, B) ->
    A > B , (A + B) rem 2 /= 0.
