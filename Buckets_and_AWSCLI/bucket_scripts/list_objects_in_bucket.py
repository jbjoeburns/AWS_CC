import boto3

s3 = boto3.resource('s3')

bucket_name = s3.Bucket('tech254-joe-bucket')

for bucket_content in bucket_name.objects.all():
    print(bucket_content.key)
