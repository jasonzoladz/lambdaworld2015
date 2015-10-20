{-
  Author    : Luis Vicente
  Copyright : 2015
  License   : MIT
-}

module Network.Aws.Lambda
  ( Context()
  , LAMBDA()
  ) where

foreign import data Context :: *

foreign import data LAMBDA :: !
