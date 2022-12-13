#/bin/bash
MODE=${MODE:-dev}
if [[ $MODE = dev ]]
then
    tail -f /dev/null

elif [[ $MODE = jupyterlab ]]
then
    jupyter-lab --allow-root --ip 0.0.0.0 --port 8888
    
else
    echo "unknown mode: "$MODE", use 'dev', 'jupyterlab' or leave empty (defaults to 'dev')"
fi