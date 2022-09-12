param(
    [Parameter(Mandatory=$true)][string] $RGLocation,
    [Parameter(Mandatory=$true)][string] $RGName,
    [Parameter(Mandatory=$true)][string] $RVnetName,
     [Parameter(Mandatory=$true)][string] $RVnetRange,
    [Parameter(Mandatory=$true)][string] $SubnetName,
    # [Parameter(Mandatory=$true)][string] $SubnetName2,
    [Parameter(Mandatory=$true)][string] $SubnetRange
    # [Parameter(Mandatory=$true)][string] $SubnetRange2
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
$RGStatus1 = az network vnet list -o table --query "[?name=='$RVnetName']"

if ($RGStatus1 -eq "")
{
    az network vnet create -g $RGName -n $RVnetName --address-prefix $VnetRange --subnet-name $SubnetName --subnet-prefix $SubnetRange -l $RGLocation   
}
else {
    write-Host Network $RGName, $RVnetName already exists   
    az network vnet subnet list -g $RGName --vnet-name $RVnetName -o table
    # az network vnet list --resource-group $RGName -o table
}
    # az network vnet list --resource-group $RGName -o table
write-Host "----------------- End of Script ($ScriptName) -----------------"
