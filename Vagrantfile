# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure(2) do |config|
	config.vm.box = "centos/7"
	config.vm.box_version = "2004.01"
	config.vm.provider "virtualbox" do |v|
	v.memory = 256
	v.cpus = 1
	end
	config.vm.define "pmsrv" do |pmsrv|
		pmsrv.vm.network "private_network", ip: "192.168.50.10",  virtualbox__intnet: "net1"
		pmsrv.vm.hostname = "pmsrv"
		pmsrv.vm.provision "shell", path: "pmsrv_script.sh"
    end
	config.vm.define "pmclt" do |pmclt|
		pmclt.vm.network "private_network", ip: "192.168.50.11",  virtualbox__intnet: "net1"
		pmclt.vm.hostname = "pmclt"
		pmclt.vm.provision "shell", path: "pmclt_script.sh"
    end
end