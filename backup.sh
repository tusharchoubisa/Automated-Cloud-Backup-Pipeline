
#!/bin/bash

# Project: Automated Cloud Backup Pipeline

SOURCE_DIR="$HOME/automated-cloud-backup-pipeline/source"
BACKUP_DIR="$HOME/automated-cloud-backup-pipeline/backups"
LOG_DIR="$HOME/automated-cloud-backup-pipeline/logs"

S3_BUCKET="s3://tushar-simple-backup-2026/backup"

RETENTION_COUNT=7

mkdir -p "$BACKUP_DIR" "$LOG_DIR"

LOG_FILE="$LOG_DIR/backup.log"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_FILE="$BACKUP_DIR/backup_$TIMESTAMP.tar.gz"

echo "[$(date)] Backup started" | tee -a "$LOG_FILE"

if [ ! -d "$SOURCE_DIR" ]; then
    echo "Source directory not found!" | tee -a "$LOG_FILE"
    exit 1
fi

if ! command -v aws >/dev/null 2>&1; then
    echo "AWS CLI not installed!" | tee -a "$LOG_FILE"
    exit 1
fi

if ! aws sts get-caller-identity >/dev/null 2>&1; then
    echo "AWS authentication failed!" | tee -a "$LOG_FILE"
    exit 1
fi

tar -czf "$BACKUP_FILE" -C "$SOURCE_DIR" .

if [ $? -ne 0 ]; then
    echo "Backup creation failed!" | tee -a "$LOG_FILE"
    exit 1
fi

if aws s3 cp "$BACKUP_FILE" "$S3_BUCKET/"; then
    echo "Backup uploaded successfully!" | tee -a "$LOG_FILE"
else
    echo "S3 upload failed!" | tee -a "$LOG_FILE"
    exit 1
fi

if aws s3 ls "$S3_BUCKET/$(basename "$BACKUP_FILE")" >/dev/null 2>&1; then
    echo "S3 upload verified!" | tee -a "$LOG_FILE"
else
    echo "S3 verification failed!" | tee -a "$LOG_FILE"
    exit 1
fi

ls -1t "$BACKUP_DIR"/backup_*.tar.gz 2>/dev/null | tail -n +$((RETENTION_COUNT + 1)) | xargs -r rm --

echo "[$(date)] Backup completed" | tee -a "$LOG_FILE"

