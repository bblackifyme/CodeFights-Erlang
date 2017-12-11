# Arrays 3 - rotateImage

> Warning: I claim no authority that this is the best (or even a good) solution. Just sharing my own experience and solution.

This is a blog/code post on my journey into learning erlang. I have been reading http://learnyousomeerlang.com/ and applying the knowledge via CodeFights Interview Practices https://codefights.com/interview-practice for real-life practice.

## Problem Statement

Note: Try to solve this task in-place (with O(1) additional memory), since this is what you'll be asked to do during an interview.

You are given an n x n 2D matrix that represents an image. Rotate the image by 90 degrees (clockwise).

Example

For

a = [[1, 2, 3],
     [4, 5, 6],
     [7, 8, 9]]
the output should be

rotateImage(a) =
    [[7, 4, 1],
     [8, 5, 2],
     [9, 6, 3]]
Input/Output

[time limit] 10000ms (erl)

[input] array.array.integer a

Guaranteed constraints:
1 ≤ a.length ≤ 100,
a[i].length = a.length,
1 ≤ a[i][j] ≤ 104.

[output] array.array.integer

## Solution

### Module Definition

We will first begin by creating out Erlang module for the problem, naming it rotateImage.erl

Then, we will define our module namespace and export our API.

```Erlang
-module(rotateImage).
-export([rotateImage/1]).
```

### Program / Solution Overview

Our algorithm works by:

1. ziping each nested list by the index of its elements

  This means for each list we take the Nth element of the list and put it in the Nth list in a list of lists

    example:
      [[11,12],
       [21,22]]
           transposed to:
      [[11,21],
       [12,22]]
2. We then reverse each of the nested lists in the list of lists
  ```
    example:
      [[21,11],
       [22, 12]]
  ```
3. Return the transposed and reversed list of lists.



### Completed Code:
```erlang
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

nest_reverse([H|T], Acc) -> nest_reverse(T, [lists:reverse(H) | Acc]);
nest_reverse([], Acc) -> lists:reverse(Acc).
```

### Usage

```erlang
17> c(rotateImage).                                      
rotateImage.erl:7:
{ok,rotateImage}
18> rotateImage:rotateImage([[1, 2, 3],[4,5,6],[7,8,9]]).
[[7,4,1],[8,5,2],[9,6,3]]
```


## Conclusion

This project became quite tricky to complete. The hardest part was by far determining a mechanism to 'zip' / 'transpose' the list of lists into index based new lists (all index 0 goes in list 0, all index 1 go in list 1 etc..). As Erlang natively does not offer a N length zip functionality, we had to develop our own in the transpose function. Once that was complete this was easy peasy!

This was challenging, however great practice at solving problems functionally.
