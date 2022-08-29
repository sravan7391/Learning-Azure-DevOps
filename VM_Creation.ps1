param(
   [Parameter(Mandatory=$true)][string] $RGName,
   [Parameter(Mandatory=$true)][string] $VnetName,
   [Parameter(Mandatory=$true)][string] $SubnetName,
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
write-host SubnetName is $SubnetName
Write-Host "=========================================================="

#Checking virtual machine(s) status. if exits or not
# $VMStatus = az vm list -d -o table --query "[?name=='$VmName']"
$VMStatus = az vm list -g $RGName -d
#write-Host $VmName already exists.
if($null -eq $VMStatus){

   Write-Host creating VM
   az vm create --resource-group $RGName --name $VmName --image $Urn --vnet-name $VnetName --subnet $SubnetName --admin-username $Username --admin-password $Password --size $VmSize
   az vm list -d -o table --query "[?name=='$VmName']"
  
}

# if($VMStatus -eq $false){  

#     write-Host Network $VmName already exists
#     az vm list -d -o table --query "[?name=='$VmName']"
#  }

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