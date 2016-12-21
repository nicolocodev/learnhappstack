module Console (execute) where

  import MyHttp (Context(..), WebPart)

  execute :: Context -> WebPart -> String
  execute inputContext webpart =
    case webpart inputContext of
      Just ctxt -> show (response ctxt)
      Nothing -> "Error"
