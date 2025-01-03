-----------------------------------------------------------------------------
-- |
-- Module      :  Control.Monad.Indexed.QualifiedDo
-- Copyright   :  (C) 2025 Rinse
-- License     :  BSD-style (see the file LICENSE)
--
-- Maintainer  :
-- Stability   :  experimental
-- Portability :  portable
--
----------------------------------------------------------------------------
module Control.Monad.Indexed.QualifiedDo
  ( (>>=), (>>), return, fail
  , fmap, (<*>), join, mfix
  ) where

import           Control.Monad.Indexed
import           Control.Monad.Indexed.Fix
import qualified Prelude

infixl 1 >>=, >>

(>>=) :: IxMonad m => m i j a -> (a -> m j k b) -> m i k b
m >>= f = ibind f m

(>>) :: IxMonad m => m i j a -> m j k b -> m i k b
m >> n = m >>= \_ -> n

return :: IxPointed m => a -> m i i a
return = ireturn

fail :: IxMonadFail m => Prelude.String -> m i i a
fail = ifail

fmap :: IxFunctor f => (a -> b) -> f j k a -> f j k b
fmap = imap

infixl 4 <*>

(<*>) :: IxApplicative m => m i j (a -> b) -> m j k a -> m i k b
(<*>) = iap

join :: IxMonad m => m i j (m j k a) -> m i k a
join = ijoin

mfix :: IxMonadFix m => (a -> m i i a) -> m i i a
mfix = imfix
