{-# LANGUAGE TemplateHaskell    #-}
{-# LANGUAGE DeriveAnyClass     #-}
{-# LANGUAGE DeriveDataTypeable #-}

import           Hedgehog
import qualified Hedgehog.Gen as Gen
import qualified Hedgehog.Range as Range
import Data.Data
import Cyclic

data Days
  = Mon
  | Tue
  | Wed
  | Thu
  | Fri
  | Sat
  | Sun
  deriving (Eq, Show, Data, Cyclic)

prop_ffv :: Property
prop_ffv =
  property $ do
    number <- forAll $ Gen.int (Range.constantFrom 1 300 1000)
    let number2 = number + 7
        res = ffw number Mon
        res2 = ffw number2 Mon
    res === res2

prop_rev :: Property
prop_rev =
  property $ do
    number <- forAll $ Gen.int (Range.constantFrom 1 300 1000)
    let number2 = number + 7
        res = rev number Mon
        res2 = rev number2 Mon
    res === res2

tests :: IO Bool
tests =
  checkParallel $$(discover)

main :: IO ()
main = do
  _ <- tests
  return ()
