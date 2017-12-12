-module(willYou).
-export([willYou/3]).

willYou(Young, Beautiful, Loved) ->
    not (Young and Beautiful) and Loved or (Young and Beautiful) and not Loved.
