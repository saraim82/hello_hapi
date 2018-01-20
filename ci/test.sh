#!/bin/bash

set -eu

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
export fly_target=${fly_target:-tutorial}
echo "Concourse API target ${fly_target}"
echo "HELLO $(basename $DIR)"

pushd $DIR
  fly -t ${fly_target} set-pipeline -p hello_api -c pipeline.yml -n
  fly -t ${fly_target} unpause-pipeline -p hello_api
  #fly -t ${fly_target} trigger-job -w -j hello_api/job-install_dependencies
popd