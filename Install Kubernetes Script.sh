#/bin/bash
echo "     STEP 1: Running script with $(whoami)"

echo "     STEP 2: Installing apt-transport-https" 
	apt-get install -y apt-transport-https 1>/dev/null
	curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add 
	echo 'deb http://apt.kubernetes.io/ kubernetes-xenial main' > /etc/apt/sources.list.d/kubernetes.list
echo "            -> Done"

echo "     STEP 3: Updating apt"
	apt-get update 1>/dev/null
echo "            -> Updated ...."
echo "     STEP 4: Installing docker.io"
	apt-get install -y docker.io 1>/dev/null
	
echo "     STEP 5: Starting Docker Deamon and enable Service....."	
	systemctl start docker 1>/dev/null
	echo "            -> Started $(docker --version) ...."
	systemctl enable docker.service 1>/dev/null
	echo "            -> Enabled ...."
	
echo "     STEP 6: Installing kubenetes master components"
	echo "            -> Installing kubelet"
		apt-get install -y kubelet 1>/dev/null
	echo "            -> Installing kubeadm"
		apt-get install -y kubeadm 1>/dev/null
	echo "            -> Installing kubectl"
		apt-get install -y kubectl 1>/dev/null
	echo "            -> Installing kubernetes-cni"
		apt-get install -y kubernetes-cni 1>/dev/null

echo "-----------------------------------------------------------"
echo "	Kubernetes node template is now created "
echo "	Create AMI form this node to create worker nodes"
echo "	Action --> Image --> Create Image"
echo "	    Note: This node will be your master node "	
echo "-----------------------------------------------------------"
exit