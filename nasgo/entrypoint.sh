echo  "EntryPoint:start ..."
  
cd /nasgo-node
./nasgo start

tail -f /nasgo-node/logs/debug.log
