# Requires AWSPowerShell.NetCore Module
# Install-Module AWSPowerShell.NetCore
# https://www.powershellgallery.com/packages/AWSPowerShell.NetCore
foreach ($OhNoes in Get-S3Bucket) {
  if (($OhNoes | Get-S3ACL).Grants.Grantee | where {$_.URI -eq 'http://acs.amazonaws.com/groups/global/AllUsers'}) {
    $OhNoes
  }
}
