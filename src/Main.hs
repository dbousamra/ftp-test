module Main where

import           Network.FTP.Server
import           Network.SocketServer
import           System.IO.HVFS
import           System.IO.HVFS.Combinators
import           System.Log.Logger

main = do
  updateGlobalLogger "" (setLevel DEBUG)
  updateGlobalLogger "Network.FTP.Server" (setLevel DEBUG)
  let opts = (simpleTCPOptions 12345) {reuse = True}
  serveTCPforever opts $
    threadedHandler $
    loggingHandler "" INFO $
    handleHandler $
    anonFtpHandler (HVFSReadOnly SystemFS)
