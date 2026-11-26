# Automated Cloud Backup Pipeline

## Project Overview
This project automates the process of creating compressed backups of local files using a Bash script and uploading them to Amazon S3 using AWS CLI.

## Tools & Technologies
- Linux
- Bash Scripting
- AWS CLI
- Amazon S3
- Git & GitHub

## Project Structure
- `backup.sh` – Bash script for creating and uploading backups.
- `source/` – Contains sample files for backup.
- `screenshots/` – Contains project execution and verification screenshots.
- `s3-backup-policy.json` – Reference IAM policy file.
- `.gitignore` – Excludes unnecessary files.

## Key Features
- Creates timestamped backup archives.
- Uploads backup files to Amazon S3.
- Verifies successful S3 uploads.
- Maintains the latest 7 local backup archives.
- Records backup activity in log files.
- Supports backup restoration and verification.

## Testing & Results
- Successfully executed the backup script in AWS CloudShell.
- Verified the backup archive in Amazon S3.
- Downloaded and extracted the backup archive.
- Compared restored files with the original source files.

## Learning Outcomes
- Practiced Linux commands and Bash scripting.
- Learned AWS CLI and Amazon S3 operations.
- Understood backup creation, upload, and restoration.
- Practiced basic cloud backup workflow.

## Original Project Credit
Inspired by: https://github.com/vemurikavya/automated-cloud-backup-pipeline

This is an adapted learning project. The script was modified and tested independently.
