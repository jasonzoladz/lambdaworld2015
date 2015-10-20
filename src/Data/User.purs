module Data.User
  ( User(..)
  , modifyAge
  ) where

import Prelude

import Data.Foreign
import Data.Foreign.Class
import Data.Foreign.Ext

newtype User = User { name :: String, age :: Int}

instance userAsForeign :: AsForeign User where
  write (User r) = toForeign r

instance userIsForeign :: IsForeign User where
  read value = do n <- readProp "name" value
                  a <- readProp "age" value
                  return $ User { name : n, age : a}

instance userShow :: Show User where
  show (User r) = "User ( name = " ++ (show r.name) ++ ", age = " ++ (show r.age) ++ " )"

modifyAge :: forall r. (Int -> Int) -> User -> User
modifyAge f (User r) = User $ r { age = f r.age }
