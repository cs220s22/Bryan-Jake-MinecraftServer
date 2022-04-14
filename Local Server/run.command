#!/bin/bash
cd "$(dirname "$0")"
exec java -Xms2G -Xmx2G -jar server.jar nongui