module Main where

import Console
import MyHttp(Request(..), Response(..), Context(..), RequestType(..))
import Successful(ok)

main :: IO ()
main = do
  let req = Request { route = "/hello", reqtype = Get }
  let res = Response {content = "", statusCode = 200}
  let context = Context {request = req,  response = res}
  let result = execute context (ok "Hola mundo")
  putStrLn result
