module Filters (get, post, dir) where

  import MyHttp(RequestType(..), Request(..), Context(..))

  iff :: (Context -> Bool) -> Context -> Maybe Context
  iff condition context =
    if condition context then
      Just context
      else Nothing

  get :: Context -> Maybe Context
  get = iff (\ctx -> reqtype (request ctx) == Get)

  post :: Context -> Maybe Context
  post = iff (\ctx -> reqtype (request ctx) == Post)

  dir :: String -> Context -> Maybe Context
  dir path = iff (\ctx -> route (request ctx) == path)
