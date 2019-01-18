#!/bin/bash

MESAIC_ROOT=$HOME/job/mesaic/mesaic
if [ -f "$MESAIC_ROOT/packages/mesaic-cli/mesaic.bashrc" ]; then
  source $MESAIC_ROOT/packages/mesaic-cli/mesaic.bashrc
  alias m=mesaic
  alias ml="mesaic logs"
  alias ms="mesaic start"
  alias mb="mesaic build"

  # mac: "mesaic (start) api-cli", e.g. "mac migrate" or "mac seed presets.dev"
  function mac() { 
      node $MESAIC_ROOT/packages/mesaic-cli start --no-build api-cli $@ | bunyan 
  }
fi

function mesaic-logs () {
  project=$1
  shift
  pm2 logs --raw -f $project | bunyan $@
}

function mesaic-errors () {
  project=$1
  shift
  mesaic-logs $project -c '!this.req || this.err' $@
}

