{-# LANGUAGE DeriveAnyClass #-}
{-# LANGUAGE RankNTypes     #-}

module Cyclic
  ( Cyclic(..)
  ) where

import GHC.Enum

class (Eq a, Bounded a, Enum a) =>
      Cyclic a where
  ffw :: Int -> a -> a
  ffw = calc

  rev :: Int -> a -> a
  rev = calc

calc :: (Bounded a, Enum a) => Int -> a -> a
calc n x = l !! n
  where
    t = allValues :: [a]
    l = take (n + (length t)) (cycle (boundedEnumFrom x))

allValues :: (Bounded a, Enum a) => [a]
allValues = [(minBound :: a) ..]

data Days
  = Mon
  | Tue
  | Wed
  | Thu
  | Fri
  | Sat
  | Sun
  deriving (Eq, Show, Bounded, Enum, Cyclic)
