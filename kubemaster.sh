sudo su

cat <<EOF > kubeadm-config.yaml
kind: ClusterConfiguration
apiVersion: kubeadm.k8s.io/v1beta3
kubernetesVersion: v1.25.0
---
kind: KubeletConfiguration
apiVersion: kubelet.config.k8s.io/v1beta1
cgroupDriver: systemd
EOF

kubeadm init --config kubeadm-config.yaml
#kubeadm init --config kubeadm-config.yaml --ignore-preflight-errors=all

#NOTE THE OUTPUT WILL ALSO PRINT A WORKER NODE JOINING STRING which u have to take note, for the worker nodes to join the cluster
#Once the control plane is initialized, run the following commands.

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

#NOTE THE OUTPUT WILL ALSO PRINT A WORKER NODE JOINING STRING which u have to take note, for the worker nodes to join the cluster

#VERIFICATION:

kubectl get pods -A

#this command will show that all the pods are running besides the coredns pods which are stuck in pending state. This is because a network add on is yet to be installed.
# https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/troubleshooting-kubeadm/#coredns-is-stuck-in-the-pending-state
# For this example, we can use weave as u can run a single command to install the network add ons

kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"

#now try getting pods again to see the weave and coredns pods is in running state. And the control plane will be in ready state

kubectl get pods -A
