import boto3

s3 = boto3.client('s3')

filename_to_del = raw_input("What would you like to delete?: ")

response = s3.delete_object(
    Bucket='tech254-joe-bucket',
    Key=filename_to_del,
)
print(response)