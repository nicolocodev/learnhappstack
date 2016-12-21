module Console (execute) where

  import MyHttp (Context(..), ServerPart)

  execute :: Context -> ServerPart -> String
  execute inputContext serverpart =
    case serverpart inputContext of
      Just ctxt -> show (response ctxt)
      Nothing -> "Error"
