-- Enumeration types
data Bool = True | False
data Color = Red | Green | Blue

-- Record types that contain fields
data Vector2d = MakeVector Double Double
data Person = Person Int String

-- Parameterized types. Note the type parameter `a`
data PairOf a = TwoValues a a

-- Recursive types
data IntList = Empty | Node Int IntList

-- Complex types which combine many of these features
data Maybe a = Nothing | Just a
data Either a b = Left a | Right b
data List a = Nil | Cons a (List a)             -- This is equivalent to the built-in [a] type
data Tree a = Leaf a | Node a (Tree a) (Tree a)
data MultiTree a = MultiTree a [MultiTree a]     -- Note the list

--Guards behave  like switch statements 
ilog3 :: Integer -> Integer
ilog3 x 
    | (x < 3) = 1
    | otherwise = 1 + ilog3 (div x 3)

	
eitherDiv :: Integer -> Integer -> Either String Integer
eitherDiv x 0 = Left ((show x) ++ "/0")
eitherDiv x y = Right (div x y)

--coproducts
addEithers :: Either String Int -> Either String Int -> Either String Int
addEithers (Right a) (Right b) = (Right (a+b))
addEithers (Right a) (Left b) = Left b
addEithers (Left a) _ = Left a

--let and where keyword
countdown :: Integer -> String
countdown x = let y = helpr x 
                in "Ready!" ++ y ++ "Liftoff!"
                where 
                    helpr 0 = " "
                    helpr n = " " ++show n ++ "..." ++ helpr (n-1)
					
--list comprehension					
smallestDivisor :: Integer -> Integer
smallestDivisor n = head [x | x <- [2..n], mod n x == 0]

--   mapMaybe length Nothing      ==> Nothing
--   mapMaybe length (Just "abc") ==> Just 3
mapMaybe :: (a -> b) -> Maybe a -> Maybe b
mapMaybe f Nothing = Nothing
mapMaybe f (Just x) = (Just (f x))


-- (f . g) x = f (g x). 
--
-- Examples:
--   multiCompose [] "foo" ==> "foo"
--   multiCompose [] 1     ==> 1
--   multiCompose [(++"bar")] "foo" ==> "foobar"
--   multiCompose [reverse, tail, (++"bar")] "foo" ==> "raboo"
--   multiCompose [(3*), (2^), (+1)] 0 ==> 6
--   multiCompose [(+1), (2^), (3*)] 0 ==> 2

multiCompose :: [a -> a] -> a -> a
multiCompose fs x = foldr (.) id fs x


-- Tail recursive function similar to while loop in other languages
--   buildList 1 5 2 ==> [1,1,1,1,1,2]
--   buildList 7 0 3 ==> [3]
buildList :: Int -> Int -> Int -> [Int]
buildList x 0 z = [z]
buildList x n z = x:(buildList x (n-1) z)


--   myMaximum []  ==>  0
--   myMaximum [1,3,2]  ==>  3
myMaximum :: [Int] -> Int
myMaximum [] = 0
myMaximum (x:xs) = foldr maxHelper x xs
maxHelper :: (Ord a) => a -> a -> a --(Ord a) is the class constraint allowing comparisons
maxHelper x y = max x y


-- given an Array, find the index of the largest element. 
-- assume the Array isn't empty.
--
-- You may assume that the largest element is unique.
--
-- Use Data.Array.indices or Data.Array.assocs

maxIndex :: (Ix i, Ord a) => Array i a -> i
maxIndex g = (fst . head) [x | x <- assocs g, snd x == maximum g] 


-- def fibonacci(n):
--    a = 0
--    b = 1
--    while n>1:
--        c = a+b
--        a = b
--        b = c
--        n = n-1
--    return b
fibonacci :: Integer -> Integer
fibonacci n = fibonacci' 0 1 n
fibonacci' :: Integer -> Integer -> Integer -> Integer
fibonacci' a b 1 = b
fibonacci' a b n = fibonacci' b (a+b) (n-1)
