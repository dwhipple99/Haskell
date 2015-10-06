-- David Whipple
-- 4/10/2014
--
-- Data Type Declarations
--

data List a = Nil 
            | Cons a (List a)
			deriving (Show)

-- Here is a Monad example from the lecture
instance Monad [] where
   return x = [x]
   m >>= f = concat (map f m)
   
crossProduct =
   do { x <- [1,2]
      ; y <- [3,4]
	  ; z <- [5,6]
	  ; return (x,y,z)
	  }

-- Some sample lists to work with
mylist1 = Nil
mylist2 = (Cons 10 Nil)
mylist3 = (Cons 7 (Cons 3 (Cons 5 Nil)))

-- This is problem 1.2 in Homework #1
-- This is a fromHaskellList function that converts from a
-- Haskell list to my defined type of list
fromHaskellList :: [a] -> List a
fromHaskellList [] = Nil
fromHaskellList (x:xs) = Cons x (fromHaskellList xs)

-- This is toHaskellList function that converts from my defined
-- type of list to a Haskell list.
toHaskellList :: List a -> [a]
toHaskellList Nil = []
toHaskellList (Cons a Nil) = [a] 
toHaskellList (Cons a list) = (:) a (toHaskellList list)

-- This takes a list of my List type and a function and applies the 
-- function to every element of the list
-- This is problem 1.3 in Homework #1
mymap :: (a->b)-> List a -> List b
mymap f Nil = Nil
mymap f (Cons a list) = Cons (f a) (mymap f list)

-- This is problem 1.4 in Homework #1
-- type Cont a = List a -> List a
myreverse :: List a -> List a
myreverse l = myreverse' l Nil
   where
      myreverse' :: List a -> List a -> List a
      myreverse' Nil acc = acc
      myreverse' (Cons a l) acc = myreverse' l (Cons a acc)

myappend :: List a -> List a -> List a
myappend Nil b = b
myappend a Nil = a
myappend (Cons a Nil) b = (Cons a b)
myappend (Cons a list) b = (Cons a (myappend list b))
	   
-- This is tail implementation
-- Thought I might need it, but didn't
mytail:: List a -> List a
mytail Nil = Nil
mytail (Cons a Nil) = (Cons a Nil)
mytail (Cons a lista) = mytail lista

-- These are some other sample functions I defined for practice,
-- not required for homework..
-- Sample Code of High Order Function
twice :: (a -> a) -> a -> a
twice f x = f (f x)
-- twice (*2) 3

-- This simply returns the length of my type of list                   
mylength :: List a -> Int
mylength Nil = 0
mylength (Cons a list) = 1 + mylength list

-- This returns True if my list is empty
isNil :: List a -> Bool
isNil Nil = True
isNil (Cons a list) = False

-- I had originally used this, but changed my implementation after 
-- speaking with professor Mainland
-- helperReverseFunction :: [a] -> [a]
-- helperReverseFunction []=[]
-- helperReverseFunction (x:xs) = helperReverseFunction xs ++ [x]
 
{- 	
Here is my older version, that wasn't very eleqouent
myreverse list = fromHaskellList(helperReverseFunction(toHaskellList list))
-}
                   
-- Older version
-- myappend list1 list2 = fromHaskellList(toHaskellList(list1) ++ toHaskellList(list2))
