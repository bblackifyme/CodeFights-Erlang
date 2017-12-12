-module(knapsackLight).
-export([knapsackLight/5]).

knapsackLight(Value1, Weight1, Value2, Weight2, MaxW) when Weight1 + Weight2 =< MaxW ->
    Value1 + Value2;
knapsackLight(Value1, Weight1, Value2, Weight2, MaxW) when Weight1 =< MaxW, Weight2 =< MaxW ->
    max(Value1,Value2);
knapsackLight(Value1, Weight1, Value2, Weight2, MaxW) when Weight2 =< MaxW ->
    Value2;
knapsackLight(Value1, Weight1, Value2, Weight2, MaxW) when Weight1 =< MaxW ->
    Value1;
knapsackLight(Value1, Weight1, Value2, Weight2, MaxW) ->
    0.
