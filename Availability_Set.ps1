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
$RGStatus = az group exists -n $RGName
$AvailabilityStatus = az vm availability-set list -g $RGName
#write-Host $VmName already exists.
if ($RGStatus -eq $false)
{
    write-host $RGName exists.
}
if($AvailabilityStatus -eq $false){

   Write-Error No Sets available..
  
}
else{  
        Write-host $AvailabilitySet Available.
 }
 #======================
Write-Host "End of Script ($ScriptName)"
