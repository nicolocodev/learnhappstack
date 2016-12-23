module Filters (get, post, dir) where

  import MyHttp(RequestType(..), Request(..), Context(..), ServerPart)

  iff :: (Context -> Bool) -> Context -> Maybe Context
  iff condition context =
    if condition context then
      Just context
      else Nothing

  get :: ServerPart
  get = iff (\ctx -> reqtype (request ctx) == Get)

  post :: ServerPart
  post = iff (\ctx -> reqtype (request ctx) == Post)

  dir :: String -> ServerPart
  dir path = iff (\ctx -> route (request ctx) == path)
