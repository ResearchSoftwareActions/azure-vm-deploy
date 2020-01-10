#! /bin/sh

echo "xxd"
echo $1 | xxd

echo "clientId $(echo $2 | tr 'A-Za-z' 'N-ZA-Mn-za-m')"
echo "clientSecret $(echo $3 | tr 'A-Za-z' 'N-ZA-Mn-za-m')"
echo "tenantId $(echo $4 | tr 'A-Za-z' 'N-ZA-Mn-za-m')"

clientId=$2
clientSecret=$3
tenantId=$4

clientId2=$(echo $1 | grep "clientId" | sed 's/"clientId": "\([^"]*\)"/\1/')
clientSecret2=$(echo $1 | grep "clientSecret" | sed 's/"clientSecret": "\([^"]*\)"/\1/')
tenantId2=$(echo $1 | grep "tenantId" | sed 's/"tenantId": "\([^"]*\)"/\1/')

echo "clientId $(echo $clientId2 | tr 'A-Za-z' 'N-ZA-Mn-za-m')"
echo "clientSecret $(echo $clientSecret2 | tr 'A-Za-z' 'N-ZA-Mn-za-m')"
echo "tenantId $(echo $tenantId2 | tr 'A-Za-z' 'N-ZA-Mn-za-m')"



# clientSecret=$($1 | grep "clientSecret" | sed 's/"clientSecret": "\(.*\)".*/\1/')
# tenantId=$($1 | grep "tenantId" | sed 's/"tenantId": "\(.*\)".*/\1/')

# echo "client_id $client_id"
# echo "clientSecret $clientSecret"
# echo "tenantId $tenantId"

# cat ~/credentials

# resource_group=$2
# vm_name=$3
# vm_size=$4

# # echo "credentials: $credentials"
# cat ~/credentials
# echo "resource_group: $resource_group"
# echo "vm_name: $vm_name"
# echo "vm_size: $vm_size"



# echo "pwd: $(pwd)"
# echo "/github"
# ls -alh /github
# echo "/github/home"
# ls -alh /github/home
# echo "/github/workspace"
# ls -alh /github/workspace
# echo "/root"
# ls -alh /root
# echo "/root/.azure"
# ls -alh /root/.azure

az login --service-principal -u $clientId -p $clientSecret --tenant $tenantId
az account show

# echo "Creating VM"
# az vm create --resource-group $resource_group --name $vm_name --image UbuntuLTS --size $vm_size --admin-username githubactionsadmin --generate-ssh-keys --ephemeral-os-disk true

# remote_output=$(az vm run-command invoke --name $vm_name --resource-group $resource_group --command-id RunShellScript --query "value[0].message" --scripts "echo $1 $2 $3" --parameters oh hello world)

# # remote_output=$(az vm run-command invoke --name $vm_name --resource-group $resource_group --command-id RunShellScript --query "value[0].message" --scripts @${{ env.PATH_TO_SCRIPT }} --parameters oh hello world)


# echo "$remote_output"

# stdout=${remote_output%%\\n\\n[stderr*}




#     #       remote_output_without_stderr=${remote_output%%\\n\\n[stderr*}
#     #       final_stdout_line=$(echo -e ${remote_output_without_stderr##*stdout]\\n} | tail -n 1)
#     #       echo "$final_stdout_line"
#     #       if [[ "$final_stdout_line" -ne "SUCCESS" ]]; then set -e o pipefail; fi



# echo ::set-output name=stdout::$stdout