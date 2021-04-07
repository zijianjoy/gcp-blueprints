#***********************************************************************************************************************
# Edit this section to set the values specific to your deployment

.PHONY: set-cfg-values
set-cfg-values:
	kpt cfg set -R .  gke.private false

	kpt cfg set -R .  mgmt-ctxt mgmt-3-23

	kpt cfg set -R .  name dev-4-7
	kpt cfg set -R .  gcloud.project.projectNumber 117584514845
	kpt cfg set -R .  gcloud.core.project gongyuan-dev
	kpt cfg set -R .  gcloud.compute.zone asia-east1-c
	kpt cfg set -R .  location asia-east1-c
	kpt cfg set -R .  log-firewalls false

	kpt cfg set -R .  email gongyuan@google.com

# Reset various kpt values to default values and remove other
# files that shouldn't be included in PRs
# TODO(jlewi): We should add a test to make sure changed values don't get checked in
# We don't run it in generate because we don't want to force all developers to install kpt
clean-for-pr: reset-cfg-values
	rm -rf kubeflow/.build
	rm -rf management/.build

	rm -rf kubeflow/upstream/manifests
	rm -rf management/upstream/management

.PHONY: reset-cfg-values
reset-cfg-values:
	kpt cfg set -R . gke.private false

	kpt cfg set -R . mgmt-ctxt MANAGEMENT-CTXT

	kpt cfg set -R .  name KUBEFLOW-NAME
	kpt cfg set -R .  gcloud.core.project PROJECT
	kpt cfg set -R .  gcloud.project.projectNumber PROJECT_NUMBER
	kpt cfg set -R .  gcloud.compute.zone ZONE
	kpt cfg set -R .  location LOCATION
	kpt cfg set -R .  log-firewalls false

	kpt cfg set -R .  email EMAIL
