# Arrays 2 - firstNotRepeatingCharacter

> Warning: I claim no authority that this is the best (or even a good) solution. Just sharing my own experience and solution.

This is a blog/code post on my journey into learning erlang. I have been reading http://learnyousomeerlang.com/ and applying the knowledge via CodeFights Interview Practices https://codefights.com/interview-practice for real-life practice.

## Problem Statement

Note: Write a solution that only iterates over the string once and uses O(1) additional memory, since this is what you would be asked to do during a real interview.

Given a string s, find and return the first instance of a non-repeating character in it. If there is no such character, return '_'.

Example

For s = "abacabad", the output should be
firstNotRepeatingCharacter(s) = 'c'.

There are 2 non-repeating characters in the string: 'c' and 'd'. Return c since it appears in the string first.

For s = "abacabaabacaba", the output should be
firstNotRepeatingCharacter(s) = '_'.

There are no characters in this string that do not repeat.

Input/Output

[time limit] 10000ms (erl)
[input] string s

A string that contains only lowercase English letters.

Guaranteed constraints:
1 ≤ s.length ≤ 105.

[output] char

The first non-repeating character in s, or '_ ' if there are no characters that do not repeat.

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

We will first begin by creating out Erlang module for the problem, naming it firstNotRepeatingCharacter.erl

Then, we will define our module namespace and export our API.

```Erlang
-module(firstNotRepeatingCharacter).
-export([firstNotRepeatingCharacter/1]).
```

### Program / Solution Overview

1. We start by building a proplist (key-value tuples in a list) of our letters and count in order of appearance
2. We then return the first letter in our list that contains a value of 1.
3. If no letters have only 1 occurrence we return `_`.

An oddity I found in CodeFights is that when returning a single string, CodeFights returns the List representation of the string and not the numerical identifier. As a result I had to build a 'cleaner' that takes that list and returns the head (our `_` character)

### Step 1

The first step was to develop a counting mechanism that recursively goes through the string and aggregates the letter count into a proplist ordered by appearance in the string.

We do this by recursively going through the list of characters (our string) and updating a proplist with the running count.

proplist info: http://erldocs.com/18.0/stdlib/proplists.html

```erlang
counter([], Acc) ->
  tail_reverse(Acc);
counter([H|T], Acc) ->
  Cleaned_Acc = proplists:delete(H, Acc),
  New_Acc = updater(proplists:get_value(H,Acc),{H, 1}, Cleaned_Acc),
  counter(T, New_Acc).

updater(undefined, {K,V}, List) ->
  [{K,V} | List];
updater(Value, {K,V}, List) ->
  [{K, V + Value} | List].

tail_reverse(L) -> tail_reverse(L,[]).

tail_reverse([],Acc) -> Acc;
tail_reverse([H|T],Acc) -> tail_reverse(T, [H|Acc]).
```

### Step 2:
Now that we have the completed and ordered letter frequencies, we can recursively look for the first with a count of 1!

Then if there are none, we return the cleaned letter code.

```erlang
findfirst([]) ->
  cleaner("_");
findfirst([{C, 1}|T]) ->
  C;
findfirst([H|T]) ->
  findfirst(T).

cleaner([H|T]) ->
  H.
```

### Completed Code:
```erlang
-module(firstNotRepeatingCharacter).
-export([firstNotRepeatingCharacter/1]).

firstNotRepeatingCharacter(List) -> findfirst(counter(List,[])).

counter([], Acc) -> tail_reverse(Acc);
counter([H|T], Acc) ->
  Cleaned_Acc = proplists:delete(H, Acc),
  New_Acc = updater(proplists:get_value(H,Acc),{H, 1}, Cleaned_Acc),
  counter(T, New_Acc).

updater(undefined, {K,V}, List) -> [{K,V} | List];
updater(Value, {K,V}, List) -> [{K, V + Value} | List].

tail_reverse(L) -> tail_reverse(L,[]).
tail_reverse([],Acc) -> Acc;
tail_reverse([H|T],Acc) -> tail_reverse(T, [H|Acc]).

findfirst([]) -> cleaner("_");
findfirst([{C, 1}|T]) -> C;
findfirst([H|T]) -> findfirst(T).

cleaner([H|T]) -> H.
```

### Usage

```erlang
2> c(firstNotRepeatingCharacter).
{ok,firstNotRepeatingCharacter}
3> firstNotRepeatingCharacter:firstNotRepeatingCharacter("abacabad").
99
4> [99].
"c"
5> firstNotRepeatingCharacter:firstNotRepeatingCharacter("abacabaabacaba").
95
6> [95].
"_"
```

While using from the terminal is that Erlang returns the integer value for the character.

To get the string representation we convert it for printing through [int] mechanism

## Conclusion

It took me a while and several iterations to get through this one Erlang. I came to realize the extent to which I have become reliant on abstractions like Python Dictionaries (in which this was a trivial use case).

I tried several methods with other datatypes like dicts and orddicts, however kept hitting issues with ordering/indexing. Since the problem statement requires knowing the order of appearance I could not rely on sorted structures. Eventually I stumbled upon proplists and had to do some research into the use and methods.

In summary this was quite fun and I learned more about proplists and solving problems recursively.
