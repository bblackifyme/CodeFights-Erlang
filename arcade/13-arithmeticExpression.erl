-module(arithmeticExpression).
-export([arithmeticExpression/3]).

arithmeticExpression(A, B, C) when A + B == C -> true;
arithmeticExpression(A, B, C) when A - B == C -> true;
arithmeticExpression(A, B, C) when A / B == C -> true;
arithmeticExpression(A, B, C) when A * B == C -> true;
arithmeticExpression(_, _, _) -> false.
