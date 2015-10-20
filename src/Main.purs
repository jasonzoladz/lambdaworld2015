module Main
  ( lambda
  ) where

import Prelude

import Control.Monad.Eff
import Control.Monad.Eff.Console
import qualified Control.Monad.Eff.Exception as E
import Control.Monad.Trans
import Control.Monad.Except.Trans
import Data.Bifunctor
import Data.Either
import Data.Foreign
import Data.Foreign.Class
import Data.User
import Network.Aws.Lambda
import Network.Aws.Lambda.Function

lambda :: Foreign -> Context -> Eff (console :: CONSOLE, lambda :: LAMBDA) Unit
lambda f c = let fail = failure c
                 succ = success c
                 user = modify f
              in do report user
                    either fail succ user

modify :: Foreign -> Either E.Error User
modify f = let ageX2 = modifyAge (2*)
               error = E.error <<< show
            in bimap error ageX2 $ read f

report :: forall r. Either E.Error User -> Eff (console :: CONSOLE | r) Unit
report (Left  e) = log $ "Error processing input: " ++ show e
report (Right u) = log $ "Processed user: " ++ show u
