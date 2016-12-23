module MyHttp (RequestType (..), Request(..), Response(..), Context(..), ServerPart, choose) where

import Control.Monad
--import Control.Applicative

data RequestType = Get | Post deriving (Eq)

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

type ServerPart = Context -> Maybe Context

choose :: [ServerPart] -> ServerPart
choose app ctxt = msum $ map ($ ctxt) app
