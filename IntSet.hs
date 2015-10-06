module IntSet (
    IntSet,
    emptyS,
    memberS,
    insertS,
    mergeS,
    deleteS
  ) where

type IntSet = [(Int,Int)]

-- Creating empty set
emptyS :: IntSet
emptyS = []

-- I wrote this as a helper
isEmptyS :: IntSet -> Bool
isEmptyS [] = True
isEmptyS _  = False

-- Checking if an integer is in the set
memberS :: Int -> IntSet -> Bool
memberS i' []       = False
memberS i' [(f,e)]  = if (i' >= f && i' <= e)
                      then True
                      else False
memberS i' is'      = if (i' >= fst (head is') && (i' <= snd (head is')))
                      then True
                      else memberS i' (tail is')

-- Adding an element to the set
insertS :: Int -> IntSet -> IntSet
insertS i' []      = if (i' > 0)
                     then [(i',i')] 
				     else error "Trying to add 0, or negative number"
insertS i' [(a,b)] | (i' > b) = [(a,i')]
				   | (i' > a) = [(a,b)]
insertS i' is'     | ((i' <= fst (head is')) && (i' >= 0)) = [(i', snd (head is'))] ++ tail is'
                   | ((i' >= fst (head is')) && (i' <= snd (head is'))) = is'
                   | ((i' >= fst (head is')) && (i' >= snd (head is'))) = [(head is')] ++ insertS i' (tail is')
				   --[((fst (head is')),i')] ++ tail is'
insertS _ _    = error "insertS undefined"

-- Union two sets
mergeS :: IntSet -> IntSet -> IntSet
mergeS _ _ = error "mergeS undefined"

-- Delete an element from the set
deleteS :: Int -> IntSet -> IntSet
deleteS i' []     = emptyS
deleteS i' is'    | ((i' == fst (head is')) && (i' == snd (head is'))) = tail is'
                  | ((i' == fst (head is'))) = [((i'+1), (snd (head is')))] ++ tail is'
				  | ((i' == snd (head is'))) = [((fst (head is')), (snd (head is') - 1))] ++ tail is'
				  | otherwise deleteS i' (tail is')
--deleteS _ _       = error "deleteS undefined"

{-
let a = emptyS
let b = emptyS
insertS 0
insertS 0 []
insertS 1 []
insertS 50 []
insertS 0 [(1,20)]
insertS 15 [(0,20)]
insertS 21 [(0,20)]
insertS 7 [(2,4), (5,7), (12,15)]
insertS 17 [(2,4), (5,7), (12,15)]
insertS 1 [(2,4), (5,7), (12,15)]
insertS 0 [(2,4), (5,7), (12,15)]
insertS 7 [(2,4), (5,7), (12,15)]
-}
