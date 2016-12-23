module Successful  (ok) where

  import MyHttp(Context(..), Response(..), ServerPart)

  ok :: String -> ServerPart
  ok reqContent context =
    Just context {
      response = Response {
        content = reqContent,
        statusCode = 200
      }
    }
