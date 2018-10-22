# Cyclic

#### Provide cyclic behaviour to your Sum ADTs


![](https://i.stack.imgur.com/06m8k.jpg)


Consider the following datatype

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

***Cyclic*** provides `ffw` and `rev` functions that can be used to cycle trough the data constructors.

User needs to specify the number to use to calculate the resulting constructor and the starting constructor.

```
ghci > rev 2 Mon
Sun
ghci > ffw 33 Tue
Sun
```
