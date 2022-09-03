param(
   [Parameter(Mandatory=$true)][string] $RGName,
   [Parameter(Mandatory=$true)][string] $AvailabilitySet
)
$ErrorActionPreference = "Stop"
[Console]::ResetColor()
$scriptName = $MyInvocation.MyCommand.Name
write-host "========================================================="
write-host Availability Set: $AvailabilitySet
write-host Resource Group: $RGName
Write-Host "=========================================================="

#Checking resourcegroup status. if exits or not
# $VMStatus = az vm list -d -o table --query "[?name=='$VmName']"
$AvailabilityStatus = az vm availability-set list -g $RGName
#write-Host $VmName already exists.
az vm availability-set list -g $RGName
# if( $AvailabilityStatus -eq $false){

#    az vm availability-set list -g $RGName
  
# }
# else{  
#         Write-host Need to create an Availability Set.
#  }
 #======================
Write-Host "End of Script ($ScriptName)"
