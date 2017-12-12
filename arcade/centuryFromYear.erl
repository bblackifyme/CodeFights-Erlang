-module(centuryFromYear).
-export([centuryFromYear/1 ]).

centuryFromYear(Year) ->
    int_ceil(Year/100).
  
int_ceil(X) ->
    T = trunc(X),
    case (X - T) of
        Neg when Neg < 0 -> T;
        Pos when Pos > 0 -> T + 1;
        _ -> T
    end.
