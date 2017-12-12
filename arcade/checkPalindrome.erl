-module(checkPalindrome).
-export([checkPalindrome/1]).

checkPalindrome(InputString) ->
  InputString == lists:reverse(InputString).
