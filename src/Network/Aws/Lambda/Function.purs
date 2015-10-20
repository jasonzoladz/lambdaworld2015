{-
  Author    : Luis Vicente
  Copyright : 2015
  License   : MIT
-}

module Network.Aws.Lambda.Function
  ( failure
  , success
  ) where

import Prelude

import Control.Bind
import Control.Monad.Eff
import Control.Monad.Eff.Exception
import Control.Monad.Eff.Unsafe
import Control.Monad.Except.Trans
import Data.Either
import Data.Foreign
import Data.Foreign.Ext
import Network.Aws.Lambda

foreign import failure :: forall r. Context -> Error -> Eff (lambda :: LAMBDA | r) Unit

foreign import succImpl :: forall r. Context -> Foreign -> Eff (lambda :: LAMBDA | r) Unit

success :: forall a r. (AsForeign a) => Context -> a -> Eff (lambda :: LAMBDA | r) Unit
success c = succImpl c <<< write
