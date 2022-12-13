# execute workflow of the example notebooks
# to run the script, call python static_workflow.py workflow_setup.yaml
# this file has been added to .gitignore
# NOTE: use curly brackets only to format in global variables!
# hint: you can include additional parameters with sys.argv

# import relevant libraries
import papermill as pm
import os
import sys
import yaml

## parse arguments from workflow_setup.yaml
configfilename = sys.argv[1]
with open(configfilename, "r") as f:
    config = yaml.load(f, Loader=yaml.Loader)

# variables
notebooks = config["notebooks"]
analysis = notebooks["analysis"]

utils = config["utils"]

# update modules before running just to be sure
os.system("nbdev_build_lib")

# run analysis notebook
_ = pm.execute_notebook(
    analysis["notebook"],  # input
    utils["save_notebooks_to"]
    + utils["notebook_save_prefix"]
    + analysis["notebook"],  # output
    parameters=analysis["params"],  # params
)

# optional (uncomment): make backup of the index and workflow notebooks:
# os.system('cp {workflow} {save_notebooks_to}{workflow}')
