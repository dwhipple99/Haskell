-- 
-- David Whipple, CS550 - Homework #3
--
-- Church Numerals
-- Problem 1.1 - Define the first three Church numerals, zero, one and two

zero f z = z
one f z = f z
two f z = f (f z)
three f z = f (f (f z))

-- Here was another definition I found worked..
--zero = \f x -> x
--one  = \f x -> f x
--two  = \f x -> f (f x)

-- Problem 1.2
-- Define a type alias for Church numerals in Haskell
type Church a = (a -> a) -> a -> a

-- Give an appropriate type signature for each of my Church Numerals
zero :: (a -> a) -> a -> a
one :: (a -> a) -> a -> a
two :: (a -> a) -> a -> a
three :: (a -> a) -> a -> a

-- Problem 1.3 - Converting Church numerals to Integers
-- Write a function that converts Church numerals to integers
churchToInteger :: Church Integer -> Integer
churchToInteger n = n (+1) 0

