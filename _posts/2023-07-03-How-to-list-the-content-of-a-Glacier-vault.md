---
layout: post
title: "How to list the content of a Glacier vault?"
date: 2023-07.03
categories: Cloud
tags: AWS Glacier CLI
---
You need to initiate a job to retrieve an inventory of a vault.

Here is the general process:

1. Initiate an inventory-retrieval job: You can do this via the AWS Management Console, AWS CLI, or AWS SDKs. The job essentially requests AWS Glacier to compile an inventory of the content of your vault. This job typically takes several hours to complete because Glacier is optimized for infrequent access.
2. After the job is complete, download the output of the job: The output is a file that contains the inventory of your vault. The inventory includes information about each archive in the vault, such as the archive ID, description, and creation date.
Here's an example of how to initiate an inventory-retrieval job using the AWS CLI:

```
aws glacier initiate-job --account-id - --vault-name your_vault_name --job-parameters '{"Type": "inventory-retrieval"}'

```

Replace your_vault_name with the name of your vault.
This command will return a job ID, which you can use to check the status of the job. You can do that with this command:

```
aws glacier describe-job --account-id - --vault-name your_vault_name --job-id your_job_id

```

Replace your_vault_name with the name of your vault, and your_job_id with the job ID returned by the initiate-job command.

Once the job is complete, you can download the output of the job with this command:

```
aws glacier get-job-output --account-id - --vault-name your_vault_name --job-id your_job_id output_file_name

```

Replace your_vault_name with the name of your vault, your_job_id with the job ID, and output_file_name with the name you want to give to the output file.