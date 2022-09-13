
param(
    [Parameter(Mandatory=$true)][string] $RGLocation,
    [Parameter(Mandatory=$true)][string] $RGName,
    [Parameter(Mandatory=$true)][string] $RVnetName2,
    [Parameter(Mandatory=$true)][string] $RVnetRange2,
    # [Parameter(Mandatory=$true)][string] $SubnetName,
    [Parameter(Mandatory=$true)][string] $SubnetName2,
    # [Parameter(Mandatory=$true)][string] $SubnetRange,
    [Parameter(Mandatory=$true)][string] $SubnetRange2
)

$ErrorActionPreference  = "stop"
[console]::ResetColor()
$ScriptName = $MyInvocation.MyCommand.Name

Write-host "----------------------------------------------------"
Write-Host resourcegroup location is $RGLocation
Write-Host resourcegroup name is $RGName
Write-host "----------------------------------------------------"

$RGStatus = az network vnet list -o table --query "[?name=='$RVnetName2']"

if ($RGStatus -eq "")
{
    az network vnet create -g $RGName --name $RVnetName2 --address-prefix $RVnetRange2 --subnet-name $SubnetName2 --subnet-prefix $SubnetRange2 -l $RGLocation   
}
else {
    write-Host Network $RGName, $RVnetName2 already exists   
    az network vnet subnet list -g $RGName --vnet-name $RVnetName2 -o table
}
write-Host "----------------- End of Script ($ScriptName) -----------------"