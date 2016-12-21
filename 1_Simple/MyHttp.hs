module MyHttp (RequestType (..), Request(..), Response(..), Context(..), WebPart) where

data RequestType = Get | Post

data Request = Request
  { route     :: String
    , reqtype :: RequestType
  }

data Response = Response
  { content    :: String
  , statusCode :: Int
  }

instance Show Response where
  show (Response cntnt stts) =
    "Status Code: " ++ show stts ++ "\n" ++ "Content: " ++ cntnt

data Context = Context
  { request  :: Request
  , response :: Response
  }

type WebPart = Context -> Maybe Context
