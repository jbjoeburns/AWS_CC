import boto3

s3 = boto3.client('s3')

filename_to_upload = raw_input("What would you like to upload?: ")
bucket_destination = raw_input("To which bucket?: ")

with open(filename_to_upload, 'rb') as data:
        s3.upload_fileobj(data, bucket_destination, filename_to_upload)