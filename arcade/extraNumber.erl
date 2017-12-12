-module(extraNumber).
-export([extraNumber/3]).

extraNumber(A, B, C) ->
    if A == B -> C;
    A == C -> B;
    true -> A
end.
