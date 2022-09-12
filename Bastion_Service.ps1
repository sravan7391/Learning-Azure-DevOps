param(
    [Parameter(Mandatory=$true)][string] $RGLocation,
    [Parameter(Mandatory=$true)][string] $RBastionName,
    [Parameter(Mandatory=$true)][string] $RGName,
    [Parameter(Mandatory=$true)][string] $RVnetName,
    [Parameter(Mandatory=$true)][string] $MyIp
)
$ErrorActionPreference  = "stop"
[console]::ResetColor()
$ScriptName = $MyInvocation.MyCommand.Name

Write-host "----------------------------------------------------"
Write-Host resourcegroup location is $RGLocation
Write-Host resourcegroup name is $RGName
Write-host "----------------------------------------------------"
#Check Vnet, Subnet Status
# $RGStatus = az network vnet list --resource-group $RGName --vnet-name $RVnetName
$RGStatus1 = az network bastion list -o table --query "[?name=='$RGName']"

if ($RGStatus1 -eq "")
{
    az network bastion create --name $RBastionName --public-ip-address $MyIp --resource-group $RGName --vnet-name $RVnetName --location $RGLocation
    az network public-ip create --resource-group $RGName --name $MyIp --sku Standard --location $RGLocation
}
else {
    write-Host "orange" Network $RGName, $RBastionName already exists   
    az network bastion show --name $RBastionName --resource-group $RGName -o table
    # az network vnet list --resource-group $RGName -o table
}
write-Host "----------------- End of Script ($ScriptName) -----------------"
