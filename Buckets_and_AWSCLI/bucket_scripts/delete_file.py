import boto3

s3 = boto3.client('s3')

filename_to_del = raw_input("What would you like to delete?: ")
bucket_destination = raw_input("From which bucket?: ")

response = s3.delete_object(
    Bucket=bucket_destination,
    Key=filename_to_del,
)
print(response)