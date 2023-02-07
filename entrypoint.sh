#/bin/bash
MODE=${MODE:-dev}
if [[ $MODE = dev ]]
then
    tail -f /dev/null
elif [[ $MODE = jupyterlab ]]
then
    jupyter-lab --allow-root --ip 0.0.0.0 --port 8888
elif [[ $MODE = ci-test ]]
then
      # Declare github ci test procedures here
      echo "Run nbdev_test"
      cd /app
      nbdev_test
else
    echo "unknown mode: "$MODE", use 'dev', 'jupyterlab' or leave empty (defaults to 'dev')"
fi