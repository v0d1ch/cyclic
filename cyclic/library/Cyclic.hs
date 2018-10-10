{-# LANGUAGE DeriveAnyClass #-}
{-# LANGUAGE DeriveDataTypeable #-}

module Cyclic
  ( Cyclic(..)
  ) where

import Data.Data
import Data.List (elemIndex)
import Data.Maybe (fromMaybe)

class (Eq a, Data a) =>
      Cyclic a where
  ffw :: Int -> a -> a
  ffw = calc (+)
  rev :: Int -> a -> a
  rev = calc (-)

calc
  :: (Eq a, Data a)
  => (Int -> Int -> Int) -> Int -> a -> a
calc f n x = l !! ((calcIndex n len) + cIndex)
  where
    t = map fromConstr (dataTypeConstrs $ constrType (toConstr x))
    cIndex = fromMaybe 0 (elemIndex x t)
    len = length t
    l = take (len * 2 + n) (cycle t)
    calcIndex ui ll
      | ui >= ll = mod ui ll
      | ui <= ll = ll `f` ui
      | otherwise = ui

