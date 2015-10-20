module Data.Foreign.Ext
  ( AsForeign
  , write	
  ) where

import Data.Foreign
import Data.Foreign.Class

class (IsForeign a) <= AsForeign a where
  write :: a -> Foreign

instance stringAsForeign :: AsForeign String where
  write = toForeign
