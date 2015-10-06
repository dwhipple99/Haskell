-- David Whipple, 
--
-- Continuation Monad
-- 
-- This was given..
newtype Cont r a = Cont { runCont :: (a -> r) -> r }

-- Here is the continuation Monad..
instance Monad (Cont r) where
   return x = Cont $ \k -> k x
   m >>= f = Cont (\k -> runCont m (\x -> runCont (f x) k))
       
