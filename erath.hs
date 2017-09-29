import Prelude

erath :: [Int]
erath = 1: foo [2..]
  where
    foo (x:xs) = x : foo (filter (\n -> n `mod` x /= 0) xs)

main :: IO ()
main =
  print $ take 10 erath
