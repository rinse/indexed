-----------------------------------------------------------------------------
-- |
-- Module      :  Control.Monad.Indexed.Fail
-- Copyright   :  (C) 2025 Rinse
-- License     :  BSD-style (see the file LICENSE)
--
-- Maintainer  :
-- Stability   :  experimental
-- Portability :  portable
--
----------------------------------------------------------------------------
module Control.Monad.Indexed.Fail
  ( IxMonadFail(..)
  ) where

import Control.Monad.Indexed

class IxMonad m => IxMonadFail m where
  ifail :: String -> m i i a
