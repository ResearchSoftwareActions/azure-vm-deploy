# azure-vm-deploy
GitHub Action for deploying an Azure VM and running scripts on it


## Inputs

### `who-to-greet`

**Required** The name of the person to greet. Default `"World"`.

## Outputs

### `time`

The time we greeted you.

## Example usage

```yaml
uses: ResearchSoftwareActions/azure-vm-deploy@master
with:
  who-to-greet: 'Mona the Octocat'
```
