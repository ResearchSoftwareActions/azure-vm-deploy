#! /bin/sh

# Read secrets from the credentials
clientId=$(echo $1 | grep "clientId" | sed 's/.*"clientId": "\([^"]*\)".*/\1/')
clientSecret=$(echo $1 | grep "clientSecret" | sed 's/.*"clientSecret": "\([^"]*\)".*/\1/')
tenantId=$(echo $1 | grep "tenantId" | sed 's/.*"tenantId": "\([^"]*\)".*/\1/')

# Load configuration variables
resource_group=$2
vm_name=$3
vm_size=$4

# Log in to Azure using the secrets
echo "Logging in to Azure..."
az login --service-principal -u $clientId -p $clientSecret --tenant $tenantId

echo "Creating VM..."
az vm create --resource-group $resource_group --name $vm_name --image UbuntuLTS --size $vm_size --admin-username githubactionsadmin --generate-ssh-keys --ephemeral-os-disk true
remote_output=$(az vm run-command invoke --name $vm_name --resource-group $resource_group --command-id RunShellScript --query "value[0].message" --scripts 'echo $1 $2 $3' --parameters oh hello world)

# # remote_output=$(az vm run-command invoke --name $vm_name --resource-group $resource_group --command-id RunShellScript --query "value[0].message" --scripts @${{ env.PATH_TO_SCRIPT }} --parameters oh hello world)

echo "$remote_output"
# output_without_stderr=${remote_output%%\\n\\n[stderr*}
# stdout=${output_without_stderr##*stdout]\\n}
# stderr=${remote_output##*stderr]\\n}

stdout=$(echo -e $(echo $remote_output | sed 's/.*\[stdout\]\\n\(.*\)\\n\\n\[stderr\].*/\1/'))
stderr=$(echo -e $(echo $remote_output | sed 's/.*\[stderr\]\\n\(.*\).*"/\1/'))

echo "stdout: $stdout"
echo "stderr: $stderr"

echo ::set-output name=stdout::$stdout
echo ::set-output name=stderr::$stderr