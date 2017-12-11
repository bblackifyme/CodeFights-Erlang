-module(metroCard).
-export([metroCard/1 ]).

metroCard(LastNumberOfDays) ->
    Dict = dict:from_list([{28,[31]},{30,[31]}, {31,[28,30,31]}]),
    {_ , Days} = dict:find(LastNumberOfDays, Dict),
    Days.
