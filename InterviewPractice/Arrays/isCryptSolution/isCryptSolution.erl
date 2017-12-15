-module(isCryptSolution).
-export([isCryptSolution/2]).

isCryptSolution([Word1, Word2, Word3], Solution) ->
  KeyMap = toDict(Solution),
  decode(Word1, KeyMap) + decode(Word2, KeyMap) == decode(Word3, KeyMap).

decode(Word, KeyMap) ->
  decode(Word, KeyMap, []).
decode([Char|Tail], Dictionary, Acc) ->
  [{Value, _ }] = dict:fetch([Char], Dictionary),
  NewAcc = [ Value | Acc],
  decode(Tail, Dictionary, NewAcc);
decode([], _, Acc) ->
  element(1,string:to_integer(lists:concat(lists:reverse(Acc)))).

toDict(Solution) -> toDict(Solution, dict:new()).
toDict([[Key,Value] | Tail], Dict) ->
  toDict(Tail, dict:append(Key, string:to_integer(Value), Dict));
toDict([] , Dict) -> Dict.
