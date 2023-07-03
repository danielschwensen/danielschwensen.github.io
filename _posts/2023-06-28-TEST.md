---
layout: post
title: "How to Upload files and folder to AWS s3 with a CLI"
date: 2023-06-28
categories: Cloud
tags: AWS S3 CLI
---
To upload files and folders to Amazon S3 using the AWS Command Line Interface (CLI), you can use the aws s3 cp command.

Here is the basic syntax for the aws s3 cp command:

```
aws s3 cp <local-path> <s3-path>

```

- local-path is the path to the file or folder on your local machine that you want to upload.
- s3-path is the path to the S3 bucket where you want to upload the file or folder. It should be in the format s3://<bucket-name>/<key>, where <bucket-name> is the name of the S3 bucket and <key> is the path to the location within the bucket where you want to upload the file or folder.

For example, to upload a file named file.txt from your local machine to the root of an S3 bucket named my-bucket, you could use the following command:

```
aws s3 cp file.txt s3://my-bucket/file.txt

```

To upload a folder named my-folder from your local machine to the root of an S3 bucket, you can use the --recursive flag to copy all the files and subfolders within the folder:

```
aws s3 cp my-folder s3://my-bucket/ --recursive

```

You can also specify a different destination folder within the S3 bucket by adding it to the s3-path. For example, to upload the contents of my-folder to a folder named s3-folder within the S3 bucket, you can use the following command:

```
aws s3 cp my-folder s3://my-bucket/s3-folder/ --recursive

```

Note that the aws s3 cp command will overwrite any existing files with the same name in the destination. 
To avoid overwriting existing files, you can use the --dryrun flag to test the command without actually uploading the files.

You can also use the aws s3 sync command to synchronize a local folder with an S3 bucket or a folder within an S3 bucket.

Here is the basic syntax for the aws s3 sync command:

```
aws s3 sync <local-path> <s3-path>

```

- local-path is the path to the folder on your local machine that you want to sync with the S3 bucket.
- s3-path is the path to the S3 bucket or folder where you want to sync the local folder. It should be in the format s3://<bucket-name>/<key>, where <bucket-name> is the name of the S3 bucket and <key> is the path to the location within the bucket where you want to sync the local folder.

For example, to sync the contents of a local folder named my-folder with the root of an S3 bucket named my-bucket, you could use the following command:

```
aws s3 sync my-folder s3://my-bucket/

```

To sync the contents of my-folder with a folder named s3-folder within the S3 bucket, you can use the following command:

```
aws s3 sync my-folder s3://my-bucket/s3-folder/

```

The aws s3 sync command will copy new and updated files from the local folder to the S3 bucket, and it will also delete any files from the S3 bucket that are not present in the local folder.
You can use the --delete flag to disable this behavior.