param(
   [Parameter(Mandatory=$true)][string] $RGName,
   [Parameter(Mandatory=$true)][string] $VnetName2,
   [Parameter(Mandatory=$true)][string] $SubnetName2,
   [Parameter(Mandatory=$true)][string] $Urn,
   [Parameter(Mandatory=$true)][string] $VmName,
   [Parameter(Mandatory=$true)][string] $Username,
   [Parameter(Mandatory=$true)][string] $Password,
   [Parameter(Mandatory=$true)][string] $VmSize

)
$ErrorActionPreference = "Stop"
[Console]::ResetColor()
$scriptName = $MyInvocation.MyCommand.Name
write-host "========================================================="
write-host resourcegroupname is $RGName
write-host vnetname is $VnetName
write-host SubnetName is $SubnetName2
Write-Host "=========================================================="

#Checking resourcegroup status. if exits or not
# $VMStatus = az vm list -d -o table --query "[?name=='$VmName']"
$VMStatus =  az vm list -d -o table --query "[?name=='$VmName']" 
#write-Host $VmName already exists.
if($VMStatus -eq ""){

   Write-Host creating VM
   az vm create --resource-group $RGName --name $VmName --image $Urn --vnet-name $VnetName2 --subnet $SubnetName2 --admin-username $Username --admin-password $Password --size $VmSize --public-ip-sku Standard
   az vm list -g $RGName -o table
  
}
else{  

    write-Host $VmName already exists
    az vm list -g $RGName -o table
 }

# if($VMStatus -eq $false){
#    Write-Host creating VM
#    az vm create --resource-group $RGName --name $VmName --image $Urn --vnet-name $VnetName --subnet $SubnetName --admin-username $Username --admin-password $Password --size $VmSize
# }
# else{
#    az vm list -d -o table --query "[?name=='$VmName']"
# }
#==================================================================

Write-Host "----------------------------------------------------"
Write-Host "END OF SCRIPT ($scriptName)"
Write-Host "------------------------------------------"