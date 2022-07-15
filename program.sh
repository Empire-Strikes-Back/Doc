#!/bin/bash

repl(){
  clj \
    -J-Dclojure.core.async.pool-size=8 \
    -X:Ripley Ripley.core/process \
    :main-ns Doc.main
}


main(){
  clojure \
    -J-Dclojure.core.async.pool-size=8 \
    -M -m Doc.main
}

jar(){

  rm -rf out/*.jar out/classes
  clojure \
    -X:Genie Genie.core/process \
    :main-ns Doc.main \
    :filename "\"out/Doc-$(git rev-parse --short HEAD).jar\"" \
    :paths '["src"]'
}

release(){
  jar
}

"$@"