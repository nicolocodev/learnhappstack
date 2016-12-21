module Console (execute, executeInLoop) where

  import Data.List.Split

  import MyHttp (
      Context(..)
    , ServerPart
    , Request(..)
    , RequestType(..)
    )

  execute :: Context -> ServerPart -> String
  execute inputContext serverpart =
    case serverpart inputContext of
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

  executeInLoop :: Context -> ServerPart -> IO()
  executeInLoop inputContext serverpart =
    do
      putStrLn "Enter Input Route: "
      input <- getLine
      if input == "exit"
        then return ()
        else
          do
            let rqst = parseRequest input
            let ctxt = inputContext {request = rqst}
            let rslt = execute ctxt serverpart
            putStrLn rslt
            executeInLoop inputContext serverpart
