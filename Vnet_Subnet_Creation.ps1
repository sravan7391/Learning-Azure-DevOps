param(
    [Parameter(Mandatory=$true)][string] $RGLocation,
    [Parameter(Mandatory=$true)][string] $RGName,
    [Parameter(Mandatory=$true)][string] $RVnetName,
    [Parameter(Mandatory=$true)][string] $VnetRange,
    [Parameter(Mandatory=$true)][string] $SubnetName,
    [Parameter(Mandatory=$true)][string] $SubnetRange
)
$ErrorActionPreference  = "stop"
[console]::ResetColor()
$ScriptName = $MyInvocation.MyCommand.Name

Write-host "----------------------------------------------------"
Write-Host resourcegroup location is $RGLocation
Write-Host resourcegroup name is $RGName
Write-host "----------------------------------------------------"
#Check RG Status
$RGStatus = az network vnet list --resource-group $RGName

if ($RGStatus -eq $false)
{
    az network vnet create -g $RGName -n $RVnetName --address-prefix $VnetRange --subnet-name $SubnetName --subnet-prefix $SubnetRange -l $RGLocation
    
    
}
else {
    write-Host Network $RGStatus already exists
    
}
#======================
Write-Host "End of Script ($ScriptName)"
