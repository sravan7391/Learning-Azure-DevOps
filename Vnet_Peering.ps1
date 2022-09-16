param(
   [Parameter(Mandatory=$true)][string] $RGName,
   [Parameter(Mandatory=$true)][string] $VnetName,
   [Parameter(Mandatory=$true)][string] $BastionVnet,
   [Parameter(Mandatory=$true)][string] $LinkName1,
   [Parameter(Mandatory=$true)][string] $LinkName2

  

)
$ErrorActionPreference = "Stop"
[Console]::ResetColor()
$scriptName = $MyInvocation.MyCommand.Name
write-host "========================================================="
write-host resourcegroupname is $RGName
write-host vnetname is $VnetName
write-host Vnet is $BastionVnet
Write-Host "=========================================================="

#Checking vnet status. if exits or not

$VnetPeeringStatus = az network vnet list --query "[?name=='$RGName']"

if($VnetPeeringStatus -contains $VnetName){
   az network vnet list -o table
   az network vnet peering create -g $RGName -n $LinkName --vnet-name $VnetName --remote-vnet $BastionVnet --allow-vnet-access
}
else {
   Write-Error Failed to Create Network Peering
}

if($VnetPeeringStatus -contains $VnetName){
   az network vnet list -o table
   az network vnet peering create -g $RGName -n $LinkName2 --vnet-name $BastionVnet --remote-vnet $VnetName --allow-vnet-access
}
else {
   az network vnet peering list -g $RGName --vnet-name $VnetName
}

#==================================================================

Write-Host "----------------------------------------------------"
Write-Host "END OF SCRIPT ($scriptName)"
Write-Host "------------------------------------------"
