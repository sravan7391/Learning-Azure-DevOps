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

#Checking resourcegroup status. if exits or not
 $VMStatus =  Get-AzVM -Location "EastUS"
if($VMStatus -eq $true){
     Write-Host vnet $VMName already exists
}
else{
     Write-Host creating VM
    az vm create --resource-group $RGName --name $VmName --image $Urn --vnet-name $VnetName --subnet $SubnetName --admin-username $Username --admin-password $Password --size $VmSize
 }
#==================================================================

Write-Host "----------------------------------------------------"
Write-Host "END OF SCRIPT ($scriptName)"
Write-Host "------------------------------------------"