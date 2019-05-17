##Someone smarter than me, make this "BETTAR!!1!"﻿

#Connect to vCenter
$vCenterInstance = Read-Host "Enter a vCenter address"
Connect-VIServer -Server $vCenterInstance

#Import the list of vms
$vmlist = import-csv C:\users\User\Scripts\VMware\vm_list.csv
   foreach ($vm in $vmlist) 
{
   $vmName = $vm.Name
   $temp = $vm.Template
   $spec = $vm.CustomizationSpec
   $folder = $vm.Folder
   $vmHostCluster = $vm.Host_Cluster
   $dataStoreCluster = $vm.Datastore_Cluster
   $ip = $vm.IP_Address
   $snm = $vm.Subnet_Mask
   $dgw = $vm.Default_Gateway
   $dns1 = $vm.DNS_1
   $dns2 = $vm.DNS_2
   
   #Now we start building the VM objects

   #**Note** If you want to use DCHP then specify that at the customization level in vCenter and comment out the - 
   #following two code lines/leave the net info stuff null in the csv file (will throw errors for latter).
   
   #Get the customization spec, inject net info. **This would not work unless i assigned my variables individually (above)**
   #**Note** Windows vms will always require IP, SNM, GW and DNS when using the 'UseStaticIP' specification for the -IpMode flag. 
   
   Get-OSCustomizationSpec -Name $spec | Get-OSCustomizationNicMapping |
   Set-OSCustomizationNicMapping -IpMode UseStaticIP  -IpAddress $ip  -SubnetMask $snm -Dns $dns1,$dns2 -DefaultGateway $dgw
   
   #call modified customization script from above
   $NewOsSpec = Get-OSCustomizationSpec -Name $spec
   
   #get the template
   $template = Get-Template -Name $temp

   #get host cluster and select random host for vm to run on
   $vmHost = get-cluster $vmHostCluster | Get-VMHost -State Connected | Get-Random

   #get datastore
   $dataStore = Get-DatastoreCluster -name $dataStoreCluster

   #Pass the new vm objects and start spinning them in vCenter.
   New-VM -Name $vmName `
   -VMHost $vmHost `
   -datastore $dataStore `
   -Template $template `
   -Location $folder `
   -OSCustomizationSpec $NewOsSpec | Start-VM
}

