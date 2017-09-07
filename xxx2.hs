import Control.Monad.Except
import Control.Monad.Writer

-- we use ExceptT instead of ErrorT because first is deprecated
type MyMonad1 e w a = ExceptT e (Writer w) a
type MyMonad2 e w a = WriterT w (Either e) a


main :: IO ()
main = do
  print $ runWriter $ runExceptT $ tell "foo" >> throwError "err" >> tell "bar"
  print $ runExcept $ runWriterT $ tell "foo" >> throwError "err" >> tell "bar"
  print "demo about moand commutativity"
  return ()
