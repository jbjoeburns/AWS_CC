# s3 buckets

***DOCS:*** https://docs.aws.amazon.com/cli/latest/reference/s3/

To view, First, search s3 and click it on AWS.

Called bucket because:
- You can put anything in there without any formatting or ordering
- Can contain different data types, different structures etc

s3 has tiers, pricing depends on usage.

## Making buckets using AWSCLI (AWS command line interface)

AWSCLI lets you interact with buckets using CRUD operations (CREATE, READ, UPDATE and DELETE).

Use the AWS Python API called Boto3 for this.

First make an instance, using standard security groups. Don't need HTTP.

Then do the standard update/upgrade.

``` 
sudo apt update
sudo apt upgrade -y
```

Then we need to install python.

```
sudo apt install python -y
```

Then we need pip.

```
sudo apt install python-pip -y
```

And finally AWSCLI.

``` 
sudo pip install awscli -y
```

Then we need to log in to AWSCLI using our key.

``` 
# Need to input access and secret access keys following this
aws configure
```

And finally we need to state the region as **buckets are made in specific regions**!!!

And the output format (**in this case, json!**)

To interact with AWS s3, we proceed commands with `aws s3`, so for example...
```
aws s3 ls
```

To make a bucket, use...
```
aws s3 mb s3://tech254-joe-bucket --region eu-west-1
```

To copy things to a bucket use 
```
aws s3 cp <filename> s3://tech254-joe-bucket
```

Then to download whats on your bucket, you can use
``` 
aws s3 sync s3://tech254-joe-bucket s3_downloads
```

To remove items in your bucket use
``` 
aws s3 rm s3://tech254-joe-bucket/<filename>
```

Then to remove the bucket itself, use 
```
aws s3 rb s3://tech254-joe-bucket/
```

## boto3 commands

First need to install boto3 with pip...
``` 
pip install boto3[crt]
```

Then, proceed any script with `import boto3`

### Resource vs client

To set the s3 interface you will be using, you need to either use `client = boto3.client('s3')` or `resource = boto3.resource('s3')`

Old boto3 used to rely on using 'client' for commands whereas generally resource is much cleaner. It is recommended to use resource when you can, but sometimes you are required to interact with the bucket using client as the functionality just isn't there for resource.

eg...

Downloading a file with resource
```
resource = boto3.resource('s3')
my_bucket = resource.Bucket('MyBucket')
my_bucket.download_file('file.txt', 'local_filename.txt')
```
vs downloading a file with client
``` 
client = boto3.client('s3')
with open('file.txt', 'wb') as data:
        client.download_fileobj('MyBucket', 'file.txt', data)
```

Resource script is far more understandable.

Examples of scripts that use both resource and client can be found in the bucket_scripts folder.

Examples below will use resource instead, and ***assume that boto3 is imported and the resource is given the variable name "s3"!***

### list buckets
```
for bucket in s3.buckets.all():
    print(bucket.name)
```
This will iterate through the bucket list and print each.

### Create bucket
```
response = s3.create_bucket(
    Buckets = '<bucket name>',
    CreateBucketConfiguration = {'LocationConstraint': 'eu-west-1'}
)

print(response)
```
Can define the bucket name, and the location it will be made here (not defining the location will make it default)

### Upload to bucket
``` 
response = s3.upload_file('<local filename>', '<bucket name>', '<given filename>')

print(response)
```
Given filename is the filename you want the file to have **ON** the bucket.

### Delete **file** from bucket
```
response = s3.Object('<bucket name>', '<filename>').delete()

print(response)
```

### Download from bucket
```
response = my_bucket.download_file('<filename on bucket>', '<given local filename>')

print(response)
```
Given local filename is what you want to call the downloaded file locally.

### Delete bucket

```
response = s3.Bucket('my-bucket').delete()

print(response)
```

These examples will all return and print **HTTP response codes**, which you can use to confirm successful execution.