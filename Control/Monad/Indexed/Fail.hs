module Control.Monad.Indexed.Fail
  ( IxMonadFail(..)
  ) where

import Control.Monad.Indexed

class IxMonad m => IxMonadFail m where
  ifail :: String -> m i i a
