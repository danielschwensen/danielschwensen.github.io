---
layout: post
title: "Preview S3 Sync Changes with the AWS CLI"
categories: Cloud
tags: AWS S3 cli
---

When you sync a local folder to Amazon S3, `aws s3 sync --dryrun` shows the uploads it would make. Add `--delete` to the same preview to see which destination objects would be removed if you mirrored the source. Comparing both previews is useful when a bucket already contains files from a previous release.

### **Prepare a Test Prefix**

Run the example in Bash or Zsh with AWS CLI v2 configured. Use a test bucket you can list and write to. Replace the bucket name below. If you use a named profile, select it with `AWS_PROFILE` before running the AWS commands.

```bash
aws --version
bucket='replace-with-your-test-bucket'
prefix="sync-preview-demo/$(date -u +%Y%m%dT%H%M%SZ)-$$"
destination="s3://$bucket/$prefix/"

work_dir="$(mktemp -d)"
mkdir -p "$work_dir/site/assets"
printf '<h1>Release 2</h1>\n' > "$work_dir/site/index.html"
printf 'body { color: navy; }\n' > "$work_dir/site/assets/style.css"
printf 'Old release\n' > "$work_dir/legacy.html"

aws s3 cp "$work_dir/legacy.html" "${destination}legacy.html"
```

The last command uploads one real test object. It sits inside this run's S3 prefix, while the local `site` directory contains only `index.html` and `assets/style.css`.

### **Preview an Upload**

```bash
aws s3 sync "$work_dir/site/" "$destination" --dryrun
```

Look for two `(dryrun) upload:` lines. `index.html` goes directly under the prefix and `assets/style.css` keeps its relative path. Normal sync leaves destination-only objects such as `legacy.html` in place.

### **Preview a Mirror**

```bash
aws s3 sync "$work_dir/site/" "$destination" --dryrun --delete
```

This time, the preview includes a `(dryrun) delete:` line for `legacy.html` in addition to the two uploads. `--delete` opts in to removing objects that exist only at the destination covered by the sync. With `--dryrun` present, the CLI reports that operation without carrying it out.

If you use `--exclude` or `--include`, use the same filters for the preview and the sync you intend to run. Objects excluded by those filters are also excluded from deletion.

### **Apply Only the Uploads**

To apply the first preview and keep `legacy.html`, run the upload without `--dryrun` or `--delete`.

```bash
aws s3 sync "$work_dir/site/" "$destination"
aws s3 ls "$destination" --recursive
```

The listing should now include `index.html`, `assets/style.css` and `legacy.html` under the test prefix. Running the same upload preview again should produce no upload lines once the source and destination copies match.

### **More Information**

- [How to upload files and folders to AWS S3 with a CLI]({% post_url 2023-06-28-How-to-Upload-files-and-folder-to-AWS-s3-with-a-CLI %})
- [AWS CLI reference for aws s3 sync](https://docs.aws.amazon.com/cli/latest/reference/s3/sync.html)
