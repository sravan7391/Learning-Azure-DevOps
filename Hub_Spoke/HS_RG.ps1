param(
    [Parameter(Mandatory=$true)][string] $RGLocation,
    [Parameter(Mandatory=$true)][string] $RGName
)
$ErrorActionPreference  = "stop"
[console]::ResetColor()
$ScriptName = $MyInvocation.MyCommand.Name

Write-host "----------------------------------------------------"
Write-Host resourcegroup location is $RGLocation
Write-Host resourcegroup name is $RGName
Write-host "----------------------------------------------------"
#Check RG Status
$RGStatus = az group exists -n $RGName
# az group create -l $RGLocation -n $RGName

if ($RGStatus -eq $false)
{
    az group create -l $RGLocation -n $RGName
}
else{
    Write-Host resourcegroup $RGName already exists
}
#======================
Write-Host "End of Script ($ScriptName)"



az network vnet create --name hub-vnet --resource-group techTalk --subnet-name hub-subnet --address-prefixes 10.0.0.0/16 --subnet-prefixes 10.0.1.0/24
az network vnet create --name spoke1-vnet --resource-group techTalk --subnet-name spoke1-subnet --address-prefixes 10.1.0.0/16 --subnet-prefixes 10.1.1.0/24
az network vnet create --name spoke2-vnet --resource-group techTalk --subnet-name spoke2-subnet --address-prefixes 10.2.0.0/16 --subnet-prefixes 10.2.1.0/24

az network vnet list -o table

az network vnet subnet create --vnet-name hub-vnet --name GatewaySubnet --resource-group techTalk --address-prefix 10.0.0.0/27
az network public-ip create --name tTpip --resource-group techTalk --allocation-method Dynamic --sku Basic
az network vnet-gateway create --name hub-subnet --location centralindia --public-ip-address tTpip --resource-group techTalk --vnet hub-vnet --gateway-type Vpn --sku Standard --vpn-type RouteBased --no-wait
az network vnet-gateway delete --name hub-subnet  --resource-group techTalk
