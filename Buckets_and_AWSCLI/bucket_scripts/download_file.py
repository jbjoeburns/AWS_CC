import boto3

s3 = boto3.client('s3')

filename_to_download = raw_input("What would you like to download?: ")
bucket_destination = raw_input("From which bucket?: ")

with open(filename_to_download, 'wb') as data:
        s3.download_fileobj(bucket_destination, filename_to_download, data)