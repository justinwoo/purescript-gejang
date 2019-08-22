module Gejang where

import Data.Variant (Variant)

class ExtractRow (record :: Type) (row :: # Type) | record -> row

instance extractRowRecord :: ExtractRow { | row } row
instance extractRowVariant :: ExtractRow (Variant row) row
