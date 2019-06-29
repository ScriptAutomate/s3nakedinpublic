import boto3

s3 = boto3.resource('s3')
for bucket in s3.buckets.all():
  for oh_noes in s3.BucketAcl(bucket.name).grants:
    if oh_noes['Grantee']['Type'] == 'Group' and oh_noes['Grantee']['URI'] == 'http://acs.amazonaws.com/groups/global/AllUsers':
      print(bucket)
