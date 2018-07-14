module Cyclic
  ( Cyclic(..)
  ) where

class (Eq a, Enum a, Bounded a) =>
      Cyclic a where
  rev :: a -> a
  rev c
    | c == minBound = maxBound
    | c == maxBound = minBound
    | otherwise = pred c

  ffw :: a -> a
  ffw c
    | c == minBound = maxBound
    | c == maxBound = minBound
    | otherwise = succ c

