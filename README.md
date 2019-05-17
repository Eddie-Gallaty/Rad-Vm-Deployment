# Rad-Vm-Deployment

# Build is verified working in PowerCLI 6.5 Release 1 build 4624819

#This is a very simple yet powerful way to semi-automate vm deployment in vCenter 5.5 and onward (tested up to 6.7). This will loop thru each vm one by one.

# Take this and make it "BETTAR!!1!"

# **NOTE** for CSV creation, it may benefit you to use the "vCenter Atribute Grabber" GUI script to copy and paste Template, Customization Spec, Folder name, etc into the CSV; I.E. Be lazy. 

# ***CSV MUST be in the format: "Name,Template,CustomizationSpec,Folder,Host_Cluster,Datastore_Cluster,IP_Address,Subnet_Mask,Default_Gateway,DNS_1,DNS_2" See the "Template" (vm_list.csv) csv file I have uploaded.

#Always check the "Template" csv file to verify latest additons. A.K.A. "More to come!"***



