module Test.Main where

import Gejang (class ExtractRow)
import Prim.RowList (kind RowList)

data Proxy (a :: Type) = Proxy
data SProxy (s :: Symbol) = SProxy
data RProxy (r :: # Type) = RProxy

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
