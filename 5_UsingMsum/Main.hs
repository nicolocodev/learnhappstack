module Main where

import Control.Monad
import Console
import MyHttp(choose)
import Successful(ok)
import Filters

main :: IO ()
main = do

  let app = [get >=> dir "/hello" >=> ok "Hello, world", get >=> dir "/bye" >=> ok "Bye, bye!"]

  executeInLoop (choose app)
