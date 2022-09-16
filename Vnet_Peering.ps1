param(
   [Parameter(Mandatory=$true)][string] $RGName,
   [Parameter(Mandatory=$true)][string] $VnetName,
   [Parameter(Mandatory=$true)][string] $BastionVnet
  

)
$ErrorActionPreference = "Stop"
[Console]::ResetColor()
$scriptName = $MyInvocation.MyCommand.Name
write-host "========================================================="
write-host resourcegroupname is $RGName
write-host vnetname is $VnetName
write-host Vnet is $SBastionVnet
Write-Host "=========================================================="

#Checking vnet status. if exits or not

$VnetPeeringStatus = az network vnet list

if($VnetPeeringStatus -contains $VnetName){
   az network vnet list -o table
   az network vnet peering create -g MyResourceGroup -n MyVnet1ToMyVnet2 --vnet-name $VnetName --remote-vnet $BastionVnet --allow-vnet-access
   az network vnet peering show -g $RGName -n MyVnet1ToMyVnet2 --vnet-name $VnetName
}
else {
   az network vnet peering list -g $RGName --vnet-name $VnetName
}
#==================================================================

Write-Host "----------------------------------------------------"
Write-Host "END OF SCRIPT ($scriptName)"
Write-Host "------------------------------------------"
