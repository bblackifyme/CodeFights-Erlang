-module(shapeArea).
-export([shapeArea/1]).

shapeArea(N) ->
 recShapeArea(N,1).

recShapeArea(N, Accumulator) when N > 0->
 recShapeArea(N-1, (N*4)-4 + Accumulator);

recShapeArea(0, Accumulator) ->
 Accumulator.
