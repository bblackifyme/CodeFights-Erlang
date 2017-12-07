-module(rotateImage).
-export([transpose/1, rotateImage/1]).

rotateImage(A) ->
  nest_reverse(transpose(A),[]).

transpose([[X | Xs] | Xss]) ->
  [[X | [H || [H | _] <- Xss]] | transpose([Xs | [T || [_ | T] <- Xss]])];

 transpose([[] | Xss]) -> transpose(Xss);
 transpose([]) -> [];
 transpose(Tuple) when is_tuple(Tuple) ->
 Xs = transpose(tuple_to_list(Tuple)),
 [list_to_tuple(X) || X <- Xs].

nest_reverse([H|T], Acc) ->
  nest_reverse(T, [lists:reverse(H) | Acc]);
nest_reverse([], Acc) ->
  lists:reverse(Acc).
