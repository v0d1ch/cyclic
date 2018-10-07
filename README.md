# Cyclic

#### Provide cyclic behaviour to you Sum ADTs

- Example:
 Consider you have a following datatype

```
data Days
  = Mon
  | Tue
  | Wed
  | Thu
  | Fri
  | Sat
  | Sun
  deriving (Eq, Show, Data, Cyclic)
```

Cyclic provides `ffw` and `rev` functions that can be used to
cycle trough the constructors number of times provided by the user.

```
ghci > rev 2 Mon
Sun
ghci > ffw 33 Tue
Sun
```
