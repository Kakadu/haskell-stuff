data X = X String deriving Show
data Lam = Var X | Abs X Lam | App Lam Lam
  deriving Show

var s = Var $ X s

data RStrat = RStrat
  { onVar :: RStrat -> X   ->        Lam
  , onAbs :: RStrat -> X   -> Lam -> Lam
  , onApp :: RStrat -> Lam -> Lam -> Lam
  }

applyStart st (Var x)   = onVar st st x
applyStart st (Abs v b) = onAbs st st v b
applyStart st (App a b) = onApp st st a b

idStrat :: RStrat
idStrat = RStrat { onVar=onVar, onAbs=onAbs, onApp=onApp }
  where
    onVar _ = Var
    onAbs _ = Abs
    onApp _ = App


main :: IO ()
main = do
  print $ applyStart idStrat $ var "x"
  print $ applyStart idStrat $ var "u"
