---
layout: post
title: "AWS Presigned URL"
date: 2021-09-28
categories: Cloud
tags: AWS S3 CLI
---

If you want to provide temporary access to an object that is otherwise private, then you can generate a presigned URL. The URL will be usable for a specified period of time, after which it will become invalid. 

The following AWS CLI command will return a URL that includes the required authentication string. The authentication will become invalid after 10 minutes. The default expiration value is 3600 seconds.

Exp:
```
aws s3 presign s3://BUCKETNAME/PrivateObject --expires-in 600
```

https://docs.aws.amazon.com/AmazonS3/latest/userguide/ShareObjectPreSignedURL.html
