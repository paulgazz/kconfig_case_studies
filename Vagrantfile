Vagrant.configure("2") do |config|
  config.vm.box = "https://cloud-images.ubuntu.com/xenial/current/xenial-server-cloudimg-amd64-vagrant.box"
  config.ssh.forward_agent = true
  config.vm.provision "shell", path: "scripts/vm_setup.sh", privileged: false
  config.vm.provider "virtualbox" do |vb|
    vb.name = "kconfig_case_studies"
    # vb.memory = "8192"
  end
end
