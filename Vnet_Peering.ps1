param(
   [Parameter(Mandatory=$true)][string] $RGName,
   [Parameter(Mandatory=$true)][string] $LinkName1,
   [Parameter(Mandatory=$true)][string] $LinkName2,
   [Parameter(Mandatory=$true)][string] $VnetName,
   [Parameter(Mandatory=$true)][string] $BastionVnet
)
$ErrorActionPreference = "Stop"
[Console]::ResetColor()
$scriptName = $MyInvocation.MyCommand.Name
write-host "========================================================="
write-host resourcegroupname is $RGName
write-host VM: Vnetname: $VnetName
write-host Bastion-Vnet: $BastionVnet
Write-Host "=========================================================="

#Checking vnet status. if exits or not

$VnetPeeringStatus = az network vnet list -g $RGName

if($VnetPeeringStatus -ne ""){
   az network vnet peering create -g $RGName -n $LinkName1 --vnet-name $VnetName --remote-vnet $BastionVnet --allow-vnet-access
   az network vnet peering show -g $RGName  -n $LinkName1 --vnet-name $VnetName
}
else {
   Write-Error Failed to Create Network Peering
}

if($VnetPeeringStatus -contains $BastionVnet){
   az network vnet peering create -g $RGName -n $LinkName2 --vnet-name $BastionVnet --remote-vnet $VnetName --allow-vnet-access
   az network vnet peering show -g $RGName  -n $LinkName2 --vnet-name $BastionVnet
}
else {
   Write-Error Failed to Create Network Peering
}

az network vnet peering sync -g $RGName -n $LinkName1 --vnet-name $VnetName

Write-Host "----------------------------------------------------"
Write-Host "END OF SCRIPT ($scriptName)"
Write-Host "------------------------------------------"
