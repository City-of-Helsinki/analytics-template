Data analytics template
================

This template contains basic tools and environment for data analytics using python libraries and Jupyter Notebooks.

Initialize new repository using this template. Use this document as base
for your projects documentation.

# Prerequisites

Docker, GitHub Codespaces or Python >3.10

Note: Default python version in this devcontainer is 3.10.6

Optional:

- Docker desktop 4.15.0 (93002)
- Visual studio code
  - VSC 1.74.0
  - VSC Dev Containers Extension v0.245.2 (latest version has issues with MacOS & M1)

# Getting started:

This chapter explains how to Initialize new repository using this template. 

## Setup git repository using template

0.  (Create [GitHub account](https://github.com/) if you do not have one
    already.
1.  Sign into your GitHub homepage
2.  Go to
    [github.com/City-of-Helsinki/analytics_template](https://github.com/City-of-Helsinki/analytics_template)
    and click the green button that says ‘Use this template’.
3.  Give your project a name. Do not use the dash symbol ‘-’, but rather
    the underscore ’\_’, because the name of the repo will become the
    name of your Python module.
4.  If you are creating a project for your organization, change the
    owner of the repo. From the drop down bar, select your organization
    GitHub account (e.g. City-of-Helsinki). You need to be included as a
    team member to the GitHub of the organization.
5.  Define your project publicity (you can change this later, but most
    likely you want to begin with a private repo).
6.  Click ‘Create repository from template’

# Development environment setup

### Codespaces

If your organization has
[Codespaces](https://github.com/features/codespaces) enabled (requires
GitHub Enterprise & Azure subscription), you can do development using
Visual Studio Code and you are now ready to begin development. Just
launch the repository in a codespace, and a dev container is
automatically set up!

#### Using this template repository as base for your analytics project. 

1. Open this repository in GitHub.
2. Click on the "Use this template" button, which is located next to the "Clone or download" button.
3. GitHub will then prompt you to select the repository name, description, and visibility for your new repository based on the template you've chosen. Customize these options to fit your needs.
4. Click the "Create repository from template" button.
5. GitHub will create a new repository for you, based on the template you've chosen.


#### Using GitHub codespaces environment for analytics and development.

1. Go to GitHub page of your newly created repository.
2. Click on the "Code" button to open the dropdown menu.
3. In the dropdown menu, select "Open with CodeSpaces." This will open the CodeSpaces setup page.
4. After clicking the "Create Codespace" button, GitHub will then create your CodeSpace environment, which may take a few minutes depending on your configuration options.
5. Once your CodeSpace environment is ready, you can find it under Code-menu. This will launch a web-based version of Visual Studio Code, which you can use to edit and run your code in the CodeSpace environment.


### Local vscode with python

Open cloned repository folder in Visual Studio Code. Try to execute any python script. 
Virtual environment installation will be prompted. Follow instructions and Visual Studio Code will setup python environment for you.

### Advanced setup: command line setup in local environment:

If you choose not to use codespaces of IDE, such as Visual Studio Code, you can setup this project from command line using this instruction.

0. Clone repository to your workstation.
1. Create virtual environment: `python3 -m venv venv`
2. Activate virtualenv: `source venv/bin/activate`
3. Install pip-tools: `pip install pip-tools`
4. Compile requirements:
    `update_requirements.sh`
5. Install requirements: `pip install -r requirements.txt` 
6. Create an ipython kernel for running the notebooks:
    `python -m ipykernel install --user --name analytics-env`
7. Start jupyterlab: `jupyter-lab`

# Analytics and development

This chapter describes how to use this repository template for data analytics.

## Data

Store your local data under data-folder. It is excluded from version
control to keep your data safe.

TODO: tarkista mitä pitää tehdä kun päivittää riippuvuuksia codespacessa.

## Notebooks

Do your analytics work in nbs/00_core.ipynb.

Optionally you can define your readme in nbs/index.ipynb. See next chapter for details.

## Readme

If you want to compile README.md from notebook, you can build readme content to nbs/index.ipynb. 
Compile index-notebook to README.md using command:

        nbdev_readme

## Nbdev

Nbdev is a Python library that allows developers to create Python packages, projects, and Jupyter notebooks all in one place. 
It is an open-source project developed by fast.ai and is designed to simplify the process of building and maintaining Python projects.


### Using shared python code between notebooks

When you run nbdev_export on this notebook, it will generate a Python module that includes the code from all of the cells that have the #export comment. This module can then be included in a Python package or used as a standalone script.

Use nbdev_export to export your python modules for other notebooks to
use.

        nbdev_export

### Before committing

Running nbdev_clean will remove all of these generated files, leaving only the original notebooks and any other files you've created. 
This can help keep your project directory clean and organized, and make it easier to focus on the actual code you're working on.

Run nbdev_clean to remove metadata from notebooks for cleaner commits.

        nbdev_clean

## Dependencies

Add library dependencies to requirements.in and use update_requirements.sh to construct requirement.txt. 
File dev-requirements.in is intended for project development environment requirements. 

### Notes to codespaces users

Note that pip-compile in update_requirements.sh can fail due low memory.
Then add requirement to requirements.in and install library manually: `pip install <library>`.

When editing requirements files, make sure you enter empty line to end of the document to ensure your change will be saved to filesystem.