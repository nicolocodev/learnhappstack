module Main where

import Control.Monad
import Console
import MyHttp(Request(..), Response(..), Context(..), RequestType(..), choose)
import Successful(ok)
import Filters

main :: IO ()
main = do
  let req = Request { route = "/hello", reqtype = Get }
  let res = Response {content = "", statusCode = 200}
  let context = Context {request = req,  response = res}

  let app = [get >=> dir "/hello" >=> ok "Hello, world", get >=> dir "/bye" >=> ok "Bye, bye!"]
  --todo: implement Applicative Mplus
  executeInLoop context (choose app)
