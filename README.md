Data analytics template
================

> Lightweight but compatible version of [ML Ops template](https://github.com/Datahel/mlops-template) for analytics & experimental work.

This template contains basic tools and environment for data analytics using python libraries and Jupyter Notebooks.

Initialize new repository using this template. Use this document as base
for your projects documentation.

## Creating a new repo from this template

For your D/A/ML project, create new repo from this template ([see GitHub instructions](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template)). Commit history will be cleaned and the authors won't have access to your new repository (although sharing your work is encouraged).

> NOTE: Updates to the template cannot be automatically synchronized to child projects!

Checklist for creating the repository:
1. Use dashes '-' instead of underscores '_' for the repository name. This is an [nbdev](https://nbdev.fast.ai) convention.
2. Set your organization as the owner, if you represent one.
3. Once the repository is ready, edit nbdev config file `settings.ini` & `ml_pipe/Makefile` according to your project information. The `lib_path` variable should be set to `nbs/your_repository_name_but_with_underscores_instead_of_dashes`.


## Working with the template:

The template assumes working within containers. Non-container development is possible but not recommended. 

### Option 1: Codespaces

Repositories generated from the template are development-ready with [GitHub Codespaces](https://docs.github.com/en/codespaces/overview).

Codespaces builds a container according to settings in `.devcontainer/devcontainer.json` and attaches to it in `vsc` mode (see 'Running the container' below).

Just launch your repository in a Codespace and start working.

### Option 2: Local


Begin by selecting your tools. Here are two examples for local development: Podman + JupyterLab (recommended), and Docker + VSC (*Visual Studio Code*).

The template container has two modes for development `vsc` (default) and `jupyterlab`. The mode is given an environment variable `MODE` when running the container.

*Podman + JupyterLab*

Podman is an open source container runtime tool, that can also operate Docker containers, and shares most of the syntax with Docker. While it is possible to configure VSC Dev Container or VSC Remote Container to use Podman or other open source container framework (see instructions with [minikube](https://benmatselby.dev/post/vscode-dev-containers-minikube/) or [Podman desktop](https://developers.redhat.com/articles/2023/02/14/remote-container-development-vs-code-and-podman#)), this requires some effort compared to Docker with Docker Desktop. In addition, third party Docker extensions may not work. Therefore, it is recommended to develop locally with Jupyterlab, which comes installed within the template container.

```bash
# On MacOS

# Install podman, docker and hyperkit
# These are the only requirements for your system - 
# everything else, including python and it's packages 
# are installed within the container!

$ brew install hyperkit
$ brew install docker docker-compose
$ brew install podman podman-compose
$ brew install podman-desktop
    
# Init podman machine and allocate resources
# NOTE: edit the allocation according to your needs.
# You may well run out of memory with this default setup.
$ podman machine init --cpus=2 --memory=4096

# Start podman machine
$ podman machine start

# Build container
$ cd your_repo
$ podman-compose build

# Start dev container with JupyterLab
$ MODE=jupyterlab podman-compose up

# To stop the dev container
# (in another terminal window or tab)
$ cd your_repo
$ podman-compose down

# To stop podman
$ podman machine stop
```

Check out [Podman docs](https://docs.podman.io/en/latest/index.html) for more information and instructions. 

*Docker Desktop + Visual Studio Code*

[Docker Desktop](https://www.docker.com/) is an open core tool for managing Docker containers. Please note that most non-personal use of Docker Desktop now requires paid license subscription.

To use the template with docker desktop, install and start docker desktop according to the instructions. VSC Extensions work with Docker Desctop with default settings.

Visual Studio Code is an IDE that supports container development. Install VSC and Dev Containers Extension. When you open your repository in VSC, it automatically detects `.devcontainer/devcontianer.json` and suggests opening the repository in a container. Alternatively, press `cmd/ctrl shift P`, type `Remote-Container: Rebuild and Reopen in Container` and press enter. VSC builds the container and attaches to it. 


### Working offline:

The repository allows developing and running ML models completely offline.

Steps to offline install:

0. Clone your repo on a network connected device or use codespaces.
1. Add required python packages to `requirements/requirements.in`. Try to include all packages you might require, because adding them later without internet access is rather difficult.
2. Build the image, and within the `requirements` folder run the script `./update_requirements.sh`. 
3. Rebuild the image.
4. Pull the image and transfer it to the offline device with Podman requirements installed.
5. Start container in the `jupyterlab` mode with your choice of container tools.

The API works offline, too, but requires network access for external clients.

# Prerequisites

The template was developed and tested with:

    GitHub Codespaces

and MacBook Pro M1 & macOS Ventura 13.2.1 with:

    Docker desktop 4.15.0 (93002)
    VSC 1.74.0
    VSC Dev Containers Extension v0.245.2

and MacBook Pro M1 & macOS Ventura 13.2.1 with:

    podman-desktop 1.1.0
    hyperkit 0.20210107
    podman 4.5.1
    podman-compose 1.0.6
    docker 24.0.2
    docker-compose 2.18.1

Additional configuration may be required for other systems.

# Analytics and development

This chapter describes how to use this repository template for data analytics.

## Data

Store your local data under data-folder. It is excluded from version
control to keep your data safe.

## Notebooks

Do your analytics work in nbs/00_core.ipynb. You may add or rename notebooks as you wish, but use of running number prefix is recommended for organizing your work.

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