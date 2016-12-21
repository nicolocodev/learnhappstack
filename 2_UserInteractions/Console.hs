module Console (execute, executeInLoop) where

  import Data.List.Split

  import MyHttp (
      Context(..)
    , WebPart
    , Request(..)
    , RequestType(..)
    )

  execute :: Context -> WebPart -> String
  execute inputContext webpart =
    case webpart inputContext of
      Just ctxt -> show (response ctxt)
      Nothing -> "Error"

  parseRequest :: String -> Request
  parseRequest input =
    case rawType of
      "GET" -> Request {reqtype = Get, route = reqRoute}
      "POST" -> Request {reqtype = Post, route = reqRoute}
      _ -> error "Foo"
    where
      parts = splitOn ";" input
      rawType = head parts
      reqRoute = head $ tail parts

  executeInLoop :: Context -> WebPart -> IO()
  executeInLoop inputContext webpart =
    do
      putStrLn "Enter Input Route: "
      input <- getLine
      if input == "exit"
        then return ()
        else
          do
            let rqst = parseRequest input
            let ctxt = inputContext {request = rqst}
            let rslt = execute ctxt webpart
            putStrLn rslt
            executeInLoop inputContext webpart
