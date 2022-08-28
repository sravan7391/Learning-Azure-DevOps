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
write-host Urn is $Urn
write-host VMname is $VmName
write-host Username is $Username
write-host Password is $Password
write-host VMSize is $VmSize
Write-Host "=========================================================="

#Checking resourcegroup status. if exits or not
# $vnetStatus = az network vnet exists -g $RGName -n $VnetName
# if($vnetStatus -eq $false){
    Write-Host creating VM
    az vm create --resource-group $RGName --name $VmName --image $Urn --vnet-name $VnetName --subnet $SubnetName --admin-username $Username --admin-password $Password --size $VmSize


# }
# else{
    # Write-Host vnet $VnetName already exists
# }
#==================================================================

Write-Host "----------------------------------------------------"
Write-Host "-- script finished ($scriptName)"
Write-Host "------------------------------------------"