module Console (execute) where

  import MyHttp (Context(..), ServerPart)

  execute :: Context -> ServerPart -> IO ()
  execute inputContext serverpart =
    case serverpart inputContext of
      Just ctxt -> putStrLn $ show (response ctxt)
      Nothing -> putStrLn "Error"
