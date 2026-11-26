# Automated Cloud Backup Pipeline

## Project Overview
This project automates the process of creating backups of local files and uploading them to Amazon S3 using a Bash script.

## Tools & Technologies
- Linux
- Bash Scripting
- AWS CLI
- Amazon S3
- IAM
- Cron
- Git & GitHub

## Project Structure
- `backup.sh` – Automates backup creation and S3 upload.
- `source/` – Contains sample files for backup.
- `s3-backup-policy.json` – IAM policy for S3 access.
- `.gitignore` – Excludes unnecessary files.

## Key Features
- Creates timestamped backup archives.
- Uploads backups to Amazon S3.
- Verifies successful uploads.
- Retries failed uploads.
- Maintains the latest 7 local backups.
- Logs backup activity.

## Learning Outcomes
- Practiced Linux commands and Bash scripting.
- Learned basic AWS S3 and IAM concepts.
- Understood backup automation.

## Original Project Credit
Inspired by: https://github.com/vemurikavya/automated-cloud-backup-pipeline

This repository is an adapted learning project. Configuration and testing will be done independently.
