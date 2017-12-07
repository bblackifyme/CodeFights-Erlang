-module(firstDuplicate).
-export([firstDuplicate/1]).

firstDuplicate(A) ->
    firstDuplicateRec(A, maps:new()).
firstDuplicateRec([], Map) -> -1;
firstDuplicateRec([H|T], Map) ->
    case maps:is_key(H, Map) of
        true -> H;
        false -> firstDuplicateRec(T, maps:put(H, H, Map))
    end.
