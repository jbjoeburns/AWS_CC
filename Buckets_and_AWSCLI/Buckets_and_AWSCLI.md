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
