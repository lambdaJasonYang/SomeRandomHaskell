# SomeRandomHaskell

Run Idle: stack ghci  
Run Single File:stack ghci test.hs  
Run Project: stack runhaskell main.hs  

Install library:stack install HTTP  

## Notes  
Haskell type classes are like interfaces  
Haskell type classes are contructed with "Class Blah a where ..."  
Haskell type classes are used with "instance Blah Sometype where ..."  
Autoimplement/Derive fundamental type classes like "Show,Eq,Ord" using "data Person = Monster | Human String deriving (Show,Eq,Ord)"
