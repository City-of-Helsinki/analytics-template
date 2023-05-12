#/bin/bash
MODE=${MODE:-vsc}
if [[ $MODE = vsc ]]
then
     # leave container running. default for working with vsc (Visual Studio Code) and codespaces.
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

      echo "Trying to strip out notebooks"
      nbdev_clean
      echo "Check that strip out was unnecessary"
      git status -s # display the status to see which nbs need cleaning up
      if [[ `git status --porcelain -uno` ]]; then
        git status -uno
        echo -e "Test failed: Detected unstripped out notebooks\n! Remember to install nbdev hooks to your environment using nbdev_install_hooks or execute nbdev_clean before commit."
        false
      else
        echo "Success: Notebooks are cleaned properly"
      fi
else
    echo "unknown mode: "$MODE", use 'vsc', 'jupyterlab' or leave empty (defaults to 'vsc')"
fi