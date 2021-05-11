import Data.Semigroup
--We can think of class as an interface in C# or Java
--Semigroup is an interface describing implementation of a mathematical Semigroup

--class Semigroup a where
  -- An associative operation.
--  (<>) :: a -> a -> a

--Monoid is an interface that extends the Semigroup interface by including identity element
-- class Semigroup a => Monoid a where
--   -- The identity element
--   mempty :: a

--list is a  Semigroup
--try below and it will output [1,2,3,4]
--[1] <> [2,3] <> [4] 

-- data Sum a = Sum a
-- instance Num a => Semigroup (Sum a) where
--   Sum a <> Sum b  =  Sum (a+b)

data BlebType a = BlebType a deriving Show
instance Num a => Semigroup (Cuck a) where
    BlebType a <> BlebType b = BlebType (a+b)

