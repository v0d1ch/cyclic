{-# LANGUAGE DeriveAnyClass      #-}
{-# LANGUAGE RankNTypes          #-}
{-# LANGUAGE DeriveDataTypeable  #-}

module Cyclic
  ( Cyclic(..)
  ) where

import Data.Data
import Data.List (elemIndex)
import Data.Maybe (fromMaybe)

class (Eq a, Data a) =>
      Cyclic a where
  ffw :: Int -> a -> a
  ffw = calc

  rev :: Int -> a -> a
  rev = calc

calc :: (Eq a, Data a) => Int -> a -> a
calc n x = l !! ((calcIndex n len) + cIndex)
  where
    t = map fromConstr (dataTypeConstrs $ constrType (toConstr x))
    cIndex = fromMaybe 0 (elemIndex x t)
    len = length t
    l = take (len * 2 + n) (cycle t)
    calcIndex ui ll =
        if ui >= ll then mod ui ll
           else if ui <= ll then ui
           else ui

data Days
  = Mon
  | Tue
  | Wed
  | Thu
  | Fri
  | Sat
  | Sun
  deriving (Eq, Show, Bounded, Enum, Typeable, Data, Cyclic)
