{-# OPTIONS_GHC -fwarn-tabs #-}
{-
Name: <David Whipple>

-}

module HW03 where

import Set

isThisWorking :: String
isThisWorking = "Yes"

lastDigit :: Integer -> Integer
lastDigit x = x `mod` 10

dropLastDigit :: Integer -> Integer
dropLastDigit x
              | x == (x `div` 10) = 0
              | otherwise = x `div` 10

toDigits :: Integer -> [Integer]
toDigits x
         | x == 0 = []
         | x < 0  = []
         | otherwise = toDigits (x `div` 10) ++ [x `mod` 10]

doubleEveryOther :: [Integer] -> [Integer]
doubleEveryOther = \x-> reverse (doubleEOHelper(reverse x))

doubleEOHelper :: [Integer] -> [Integer]
doubleEOHelper [] = []
doubleEOHelper (x:[]) = [x]
doubleEOHelper (x:y:zs) = x : ( 2 * y) : doubleEOHelper zs

sumDigits :: [Integer] -> Integer
sumDigits [] = 0
sumDigits (x:xs)
       | x < 10 = x + sumDigits xs
       | otherwise = (lastDigit x) + (dropLastDigit x) + sumDigits xs

validate :: Integer -> Bool
validate x = (sumDigits (doubleEveryOther ( toDigits x))) `mod` 10 == 0

type Peg = String
type Move = (Peg, Peg)

-- hanoi is implemented
--
hanoi :: Integer -> Peg -> Peg -> Peg -> [Move]
hanoi 0 _ _ _ = []
hanoi n a b c = hanoi (n-1) a c b ++ [(a,b)] ++ hanoi (n-1) c b a
