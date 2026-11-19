---
layout: post
title: "Find an EC2 network interface by private or public IP with the AWS CLI"
date: 2022-06-30
permalink: /2022-06-30-AWS-How-to-search-for-IP-addresses-CLI/
categories: blog Cloud
tags: AWS cli network
---
Use the AWS CLI to find an EC2 network interface by its private or public IPv4 address. The interface ID, description, and attachment details can help you identify the resource using the address.

## Before you run the commands

Configure the AWS CLI with credentials for the account you want to search. Those credentials need the `ec2:DescribeNetworkInterfaces` permission. Replace `eu-west-1` with the region that contains the interface and substitute the IPv4 address you are investigating. If you use a named CLI profile, add `--profile` followed by the profile name.

## Find an interface by private IPv4 address

```bash
aws ec2 describe-network-interfaces --region eu-west-1 --filters "Name=addresses.private-ip-address,Values=10.0.1.25" --output json
```

## Find an interface by public IPv4 address

```bash
aws ec2 describe-network-interfaces --region eu-west-1 --filters "Name=addresses.association.public-ip,Values=203.0.113.25" --output json
```

## Read the results

Example JSON output for a matching interface, with unrelated fields omitted:

```json
{
  "NetworkInterfaces": [
    {
      "NetworkInterfaceId": "eni-0123456789abcdef0",
      "Description": "Application server network interface",
      "Attachment": {
        "InstanceId": "i-0123456789abcdef0"
      }
    }
  ]
}
```

- `NetworkInterfaceId` identifies the interface. Use it to find the ENI in the EC2 console.
- `Description` can give you a clue about the resource or AWS service using the interface.
- `Attachment.InstanceId`, when present, identifies the EC2 instance to which the interface is attached. An interface can be unattached or used by a service without exposing an instance ID.

A successful response with `"NetworkInterfaces": []` means the query returned no visible matches for that address in the selected account and region. Check the CLI profile, region, and whether you chose the private or public filter. If you get an authorization error, check the caller's permissions.

## References

- [AWS CLI reference for describe-network-interfaces](https://docs.aws.amazon.com/cli/latest/reference/ec2/describe-network-interfaces.html)
- [AWS guide to finding the resource that owns an unknown IP address](https://repost.aws/knowledge-center/vpc-find-owner-unknown-ip-addresses)
