az group create -g PLB -l centralindia

 az vm create -g PLB -n VM1 --image UbuntuLTS --vnet-name PLB_Vnet --subnet PLB_Subnet --admin-username azureadmin --admin-password “testuser@123456" --size Standard_B1s --nsg PLB_NSG1 --zone 1 --public-ip-address '""'

 az vm create -g PLB -n VM2 --image UbuntuLTS --vnet-name PLB_Vnet --subnet PLB_Subnet --admin-username azureadmin --admin-password “testuser@123456" --size Standard_B1s --nsg PLB_NSG1 --zone 2 --public-ip-address '""'

az vm availability-set create -n AVSET -g PLB --platform-fault-domain-count 2 --platform-update-domain-count 2 -l centralindia

az vm create --resource-group PLB --name VM3 --availability-set AVSET --size Standard_B1s --vnet-name PLB_Vnet --subnet PLB_Subnet --image UbuntuLTS  --admin-username azureadmin --admin-password “testuser@123456" --nsg PLB_NSG1

az vm create --resource-group PLB --name VM4 --availability-set AVSET --size Standard_B1s --vnet-name PLB_Vnet --subnet PLB_Subnet --image UbuntuLTS  --admin-username azureadmin --admin-password “testuser@123456" --nsg PLB_NSG1

az network dns zone create -g PLB -n techupdate.today

# az network lb create --resource-group PLB --name myLoadBalancer --sku Standard --public-ip-address PLB-pip --frontend-ip-name myFrontEnd --backend-pool-name myBackEndPool

# az network lb probe create --resource-group PLB --lb-name myLoadBalancer --name myHealthProbe --protocol tcp --port 80

# az network lb rule create --resource-group PLB --lb-name myLoadBalancer --name myHTTPRule --protocol tcp --frontend-port 80 --backend-port 80 --frontend-ip-name myFrontEnd --backend-pool-name myBackEndPool --probe-name myHealthProbe --disable-outbound-snat true --idle-timeout 15 --enable-tcp-reset true

az resource list -g PLB -o table

az vm list -o table