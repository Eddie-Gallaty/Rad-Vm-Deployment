# Rad-Vm-Deployment 

***"It's rad!"***

# Build is verified working in PowerCLI 6.5 Release 1 build 4624819

This is a very simple yet powerful way to semi-automate vm deployment in vCenter 5.5 and onward (tested up to 6.7). This will loop thru each vm one by one.

***CSV MUST be in the format:*** "Name,Template,CustomizationSpec,Folder,Host_Cluster,Datastore_Cluster,IP_Address,Subnet_Mask,Default_Gateway,DNS_1,DNS_2"   
***See the "Template" (vm_list.csv) csv file I have uploaded.***

**NOTE** for CSV creation, it may benefit you to use my "vCenter Attribute Grabber" GUI script (uploaded in this repo) to copy and paste Template, Customization Spec, Folder name, etc into the CSV; I.E. Be lazy. 

***Always check the "Template" csv file to verify latest additons. A.K.A. "More to come!"***


