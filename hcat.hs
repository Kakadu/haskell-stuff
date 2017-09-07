import System.Environment
import Control.Monad.Trans.List


main :: IO ()
main = do
  args <- getArgs
  case args of
    [] -> fromStdIn
    xs -> (sequence $ map catFile xs) >> return ()


  where
    catFile name = do
      text <- readFile name
      putStrLn text
    fromStdIn = do
      name <- getLine
      putStrLn name
      fromStdIn
