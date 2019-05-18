#this is a simple quick and dirty application that pulls information about the connect vCenter instance such as templates, folders etc.
#use this to be lazy when copying attributes to and from stuff!

#Connect to vCenter.
$vCenterInstance = Read-Host "Enter a vCenter address"
Connect-VIServer -Server $vCenterInstance

# MAIN FORM
Add-Type -assembly System.Windows.Forms
$main_form = New-Object System.Windows.Forms.Form
$main_form.Text='vCenter Atribute Grabber'
$main_form.Width = 600
$main_form.Height = 300
$main_form.AutoSize =$true


# ****LABEL AREA****

#Label for Folder Location
$FoldLabel = New-Object System.Windows.Forms.Label
$FoldLabel.Text = "Folder"
$FoldLabel.Location = New-Object System.Drawing.Point(0,40)
$FoldLabel.AutoSize = $true
$main_form.Controls.Add($FoldLabel)


#Label for Templates
$TempLabel = New-Object System.Windows.Forms.Label
$TempLabel.Text = "Templates"
$TempLabel.Location = New-Object System.Drawing.Point(0,60)
$TempLabel.AutoSize = $true
$main_form.Controls.Add($TempLabel)

#Label for Customization Script
$CustLabel = New-Object System.Windows.Forms.Label
$CustLabel.Text = "Customization"
$CustLabel.Location = New-Object System.Drawing.Point(0, 80)
$CustLabel.AutoSize = $true
$main_form.Controls.Add($CustLabel)

#Label for Clusters
$ClusLabel = New-Object System.Windows.Forms.Label
$ClusLabel.Text = "Cluster"
$ClusLabel.Location = New-Object System.Drawing.Point(0,100)
$CustLabel.AutoSize = $true
$main_form.Controls.Add($ClusLabel)

#Label for Datastores
$DSLabel = New-Object System.Windows.Forms.Label
$DSLabel.Text = "DataStore"
$DSLabel.Location = New-Object System.Drawing.Point(0,125)
$DSLabel.Autosize = $true
$main_form.Controls.Add($DSLabel)


# ****COMBO BOX AREA****

#Combo box for Folders 
$FoldComboBox = New-Object System.Windows.Forms.ComboBox
$FoldComboBox.Width = 300

$folders = Get-Folder

Foreach ($folder in $folders)
{
    $FoldComboBox.Items.Add($folder.Name)
}
$FoldComboBox.Location = New-Object System.Drawing.Point(150,40)
$main_form.Controls.Add($FoldComboBox)

#Combo box to list templates
$TempComboBox = New-Object System.Windows.Forms.ComboBox
$TempComboBox.Width = 300

$Templates = Get-Template

Foreach ($Temp in $Templates)
{
    $TempComboBox.Items.Add($Temp.Name)
}

$TempComboBox.Location = New-Object System.Drawing.Point(150,60)
$main_form.Controls.Add($TempComboBox)

#Combo box for Customization Scripts
$CustComboBox = New-Object System.Windows.Forms.ComboBox
$CustComboBox.Width = 300

#List all Customization Scripts
$Customizations = Get-OSCustomizationSpec 

Foreach ($Cust in $Customizations)
{
    $CustComboBox.Items.Add($Cust.Name)
}
$CustComboBox.Location = New-Object System.Drawing.Point(150,80)
$main_form.Controls.Add($CustComboBox)



#Combo Box for clusters
$ClusComboBox = New-Object System.Windows.Forms.ComboBox
$ClusComboBox.Width = 300
$Clusters = Get-Cluster

Foreach ($Cluster in $Clusters)
{
    $ClusComboBox.Items.Add($Cluster.Name)
}
$ClusComboBox.Location = New-Object System.Drawing.Point(150,100)
$main_form.Controls.Add($ClusComboBox)

#Combo box for Datastores
$DSComboBox = New-Object System.Windows.Forms.ComboBox
$DSComboBox.Width = 300
$Datastores = Get-DatastoreCluster

Foreach ($DS in $Datastores)
{
    $DSComboBox.Items.Add($DS.Name)
}
$DSComboBox.Location = New-Object System.Drawing.Point(150,120)
$main_form.Controls.Add($DSComboBox)


#End 
$main_form.ShowDialog()

Disconnect-VIServer -force


