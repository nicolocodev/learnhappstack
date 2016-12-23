module Console (execute, executeInLoop) where

  import Data.List.Split

  import MyHttp (
      Context(..)
    , ServerPart
    , Request(..)
    , RequestType(..)
    , Response(..)
    )

  execute :: Context -> ServerPart -> IO ()
  execute inputContext serverpart =
    case serverpart inputContext of
      Just ctxt -> putStrLn $ show (response ctxt)
      Nothing -> print "Error"

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

  executeInLoop :: ServerPart -> IO()
  executeInLoop serverpart =
    do
      putStrLn "Enter Input Route: "
      input <- getLine
      if input == "exit"
        then return ()
        else
          do
            let res = Response {content = "", statusCode = 500}
            let ctxt = Context {request = parseRequest input, response = res}
            execute ctxt serverpart
            executeInLoop serverpart
