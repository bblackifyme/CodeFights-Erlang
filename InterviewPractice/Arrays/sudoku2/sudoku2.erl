-module(sudoku2).
-export([sudoku2/1]).

sudoku2(Grid) ->
  RowList = lists:map(fun comparison/1, Grid),
  ColumnList = lists:map(fun comparison/1,transpose(Grid)),
  RowTrue = lists:all(fun selfPredicate/1 ,RowList),
  ColumnTrue = lists:all(fun selfPredicate/1 ,ColumnList),
  RowTrue and ColumnTrue and determineCubes(Grid).


comparison(Row) ->
  FilteredRow = lists:filter(fun filterDot/1, Row),
  SetLength = sets:size(sets:from_list(FilteredRow)),
  length(FilteredRow) == SetLength.

selfPredicate(A) -> A.

filterDot([46]) -> false;
filterDot(_) -> true.

transpose([[X | Xs] | Xss]) ->
  [[X | [H || [H | _] <- Xss]] | transpose([Xs | [T || [_ | T] <- Xss]])];

 transpose([[] | Xss]) -> transpose(Xss);
 transpose([]) -> [];
 transpose(Tuple) when is_tuple(Tuple) ->
 Xs = transpose(tuple_to_list(Tuple)),
 [list_to_tuple(X) || X <- Xs].

determineCubes([[H11, H12, H13 | T1], [H21, H22, H23 | T2], [H31, H32, H33 | T3]| NextRows]) ->
  Cube = [H11, H12, H13, H21, H22, H23, H31, H32, H33],
  comparison(Cube) and determineCubes([T1 , T2, T3 | NextRows]);

determineCubes([[],[],[] | NextRows]) ->
  determineCubes(NextRows);

determineCubes([[H11, H12, H13 | []], [H21, H22, H23 | []], [H31, H32, H33 | []] | NextRows]) ->
  Cube = [H11, H12, H13, H21, H22, H23, H31, H32, H33],
  comparison(Cube);

determineCubes([]) -> true.
