az group create -g PLB -l centralindia

 az vm create -g PLB -n VM1 --image UbuntuLTS --vnet-name PLB_Vnet --subnet PLB_Subnet --admin-username azureadmin --admin-password “testuser@123456" --size Standard_B1s --nsg PLB_NSG1 --zone 1 --public-ip-address '""'

 az vm create -g PLB -n VM2 --image UbuntuLTS --vnet-name PLB_Vnet --subnet PLB_Subnet --admin-username azureadmin --admin-password “testuser@123456" --size Standard_B1s --nsg PLB_NSG1 --zone 2 --public-ip-address '""'

az vm availability-set create -n AVSET -g PLB --platform-fault-domain-count 3 --platform-update-domain-count 20 -l centralindia 

az vm create  --resource-group PLB  --name VM3 availability-set AVSET —size Standard_B1s --vnet-name PLB_Vnet --subnet PLB_Subnet --image UbuntuLTS  --admin-username azureadmin --admin-password “testuser@123456" --nsg PLB_NSG1

az vm create  --resource-group PLB  --name VM4 availability-set AVSET —size Standard_B1s --vnet-name PLB_Vnet --subnet PLB_Subnet --image UbuntuLTS  --admin-username azureadmin --admin-password “testuser@123456" --nsg PLB_NSG1

az vm availability-set create  --resource-group PLB  --name AVSET  --platform-fault-domain-count 2 --platform-update-domain-count 2

az resource list -g PLB -o table

az vm list -o table