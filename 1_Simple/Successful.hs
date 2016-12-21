module Successful  (ok) where

  import MyHttp(Context(..), Response(..), WebPart)

  ok :: String -> WebPart
  ok reqContent context =
    Just context {
      response = Response {
        content = reqContent,
        statusCode = 200
      }
    }
