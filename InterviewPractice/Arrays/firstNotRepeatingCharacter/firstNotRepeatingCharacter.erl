-module(firstNotRepeatingCharacter).
-export([firstNotRepeatingCharacter/1]).

firstNotRepeatingCharacter(List) -> findfirst(counter(List,[])).

counter([], Acc) -> tail_reverse(Acc);
counter([H|T], Acc) ->
  Cleaned_Acc = proplists:delete(H, Acc),
  New_Acc = updater(proplists:get_value(H,Acc),{H, 1}, Cleaned_Acc),
  counter(T, New_Acc).

updater(undefined, {K,V}, List) -> [{K,V} | List];
updater(Value, {K,V}, List) -> [{K, V + Value} | List].

tail_reverse(L) -> tail_reverse(L,[]).
tail_reverse([],Acc) -> Acc;
tail_reverse([H|T],Acc) -> tail_reverse(T, [H|Acc]).

findfirst([]) -> cleaner("_");
findfirst([{C, 1}|_]) -> C;
findfirst([_|T]) -> findfirst(T).

cleaner([H|_]) -> H.
