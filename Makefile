HOSTS ?= localhost
TAG ?= all
VARFILE ?= vars.yaml
WORKDIR ?= "./workdir"

create-venv:
	python3 -m virtualenv venv && \
	. venv/bin/activate && \
	pip install -r requirements.txt


get-tags:
	. venv/bin/activate && \
	ansible-playbook -i ${HOSTS}, create-cluster.yaml --list-tags 


ansible-run:
	. venv/bin/activate && \
    ansible-playbook -i ${HOSTS}, create-cluster.yaml --tags ${TAG} --extra-vars @${VARFILE}


clean-up:
	rm -rf ${WORKDIR}