# Arrays 1 - firstDuplicate

> Warning: I claim no authority that this is the best (or even a good) solution. Just sharing my own experience and solution.

This is a blog/code post on my journey into learning erlang. I have been reading http://learnyousomeerlang.com/ and applying the knowledge via CodeFights Interview Practices https://codefights.com/interview-practice for real-life practice.

## Problem Statement

**Note:** Write a solution with O(n) time complexity and O(1) additional space complexity, since this is what you would be asked to do during a real interview.

Given an array a that contains only numbers in the range from 1 to a.length, find the first duplicate number for which the second occurrence has the minimal index. In other words, if there are more than 1 duplicated numbers, return the number for which the second occurrence has a smaller index than the second occurrence of the other number does. If there are no such elements, return -1.

Example

For a = [2, 3, 3, 1, 5, 2], the output should be
firstDuplicate(a) = 3.

There are 2 duplicates: numbers 2 and 3. The second occurrence of 3 has a smaller index than than second occurrence of 2 does, so the answer is 3.

For a = [2, 4, 3, 5, 1], the output should be
firstDuplicate(a) = -1.

Input/Output

**time limit** 10000ms (erl)
**input** array.integer a

Guaranteed constraints:
1 ≤ a.length ≤ 105,
1 ≤ a[i] ≤ a.length.

**output** integer

The element in a that occurs in the array more than once and has the minimal index for its second occurrence. If there are no such elements, return -1.

[Erlang] Syntax Tips
```erlang
% Prints help message to the console
% Returns a string
helloWorld(Name) ->
    io:fwrite("This prints to the console when you Run Tests~n", []),
    "Hello, " ++ Name.
```

## Solution

### Module Definition

We will first begin by creating out Erlang module for the problem, naming it firstDuplicate.erl

Then, we will define our module namespace and export our API.

```Erlang
-module(firstDuplicate).
-export([firstDuplicate/1]).
```

### Program / Solution Overview

To solve this issue, we will be largely leveraging pattern matching and a recursive function.

1. We start by creating an empty Map and passing it into our function.
2. If the first parameter is not an empty list we then pattern match the List Head and Tail
3. If the Head is inside the map then we return that as our first duplicate
4. If not then we put the Head inside our map and pass it and the Tail into the recursive function.
5. If we never find a duplicate (ie get to an empty list in our function) then we pattern match off the empty list and return `-1`

And thats it!




### Completed Code:
```erlang
-module(firstDuplicate).
-export([firstDuplicate/1]).

firstDuplicate(A) ->
    firstDuplicateRec(A, maps:new()).
firstDuplicateRec([], Map) -> -1;
firstDuplicateRec([H|T], Map) ->
    case maps:is_key(H, Map) of
        true -> H;
        false -> firstDuplicateRec(T, maps:put(H, H, Map))
    end.
```

### Usage

```erlang
3> c(firstDuplicate).
firstDuplicate.erl:6: Warning: variable 'Map' is unused
{ok,firstDuplicate}
4> firstDuplicate:firstDuplicate([2, 3, 3, 1, 5, 2]).
3
5> firstDuplicate:firstDuplicate([2, 4, 3, 5, 1]).   
-1
```


## Conclusion

This was a great problem to tackle with Erlang and was a good introduction to practically using Maps inside Erlang.
I still find the syntax for Erlang If/Case statements to be a bit odd and foreign when compared to imperative languages.
