# purescript-gejang

This library is literally just a type class to extract a row type from a Record or Variant. You could also use `TypeEquals` instead.

![](./gejang.jpg)

## How it works

```purs
class ExtractRow (record :: Type) (row :: # Type) | record -> row

instance extractRowRecord :: ExtractRow { | row } row
instance extractRowVariant :: ExtractRow (Variant row) row
```

## Usage

```purs
type MyRecord =
  { apple :: String
  , banana :: String
  , kiwi :: SProxy "hi"
  }

extractionZone
  :: forall record r
   . ExtractRow record r
  => Proxy record -> RProxy r
extractionZone _ = RProxy

-- inferred type
myRow :: RProxy
  ( apple :: String
  , banana :: String
  , kiwi :: SProxy "hi"
  )
myRow = extractionZone (Proxy :: _ MyRecord)
```
