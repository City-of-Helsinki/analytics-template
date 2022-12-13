# Data analytics template

Initialize new repository using this template. Use this README as base for your projects documentation.

# Dependencies

Tip: Add library dependencies to requirements/requirements.in. File dev-requirements.in is for project base requirements.
Use update_requirements.sh to compile requirements.txt.

# Prequisites

python, pip, pip-tools

 - Docker desktop 4.15.0 (93002)

If you prefer developing with VSC:

 - VSC 1.74.0
 - VSC Dev Containers Extension v0.245.2 (latest version has issues with MacOS & M1)

## Getting started:

### Running on local environment:

1. Create virtual environment and activate it:
2. python3 -m venv venv
3. source venv/bin/activate
4. Install pip-tools:
   1. pip install pip-tools
5. Compile requirements:
   1. pip-compile --upgrade --generate-hashes --allow-unsafe --resolver=backtracking -o requirements.txt requirements.in dev-requirements.in
6. Install requirements:
   1. pip install -r requirements.txt

# analytics_template
