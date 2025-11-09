#!/bin/bash

# === Log Archiver Tool ===
# Compresses a log directory into a timestamped tar.gz archive
# and stores it in a new directory while logging the action.

# --- Usage ---
#   log-archive <log-directory>

# --- Example ---
#   log-archive /var/log

# --- Requirements ---
#   - bash
#   - tar
#   - mkdir
#   - date

# Exit on any error
set -e

# Check for correct arguments
if [ $# -ne 1 ]; then
    echo "Usage: $0 <log-directory>"
    exit 1
fi

LOG_DIR="$1"

if [ ! -d "$LOG_DIR" ]; then
    echo "Error: Directory $LOG_DIR does not exist."
    exit 1
fi

# Setup archive directory
ARCHIVE_ROOT="/var/log-archives"
mkdir -p  "$ARCHIVE_ROOT"

# Generate timestamp
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

# Create archive filename
ARCHIVE_NAME="logs_archive_${TIMESTAMP}.tar.gz"
ARCHIVE_PATH="${ARCHIVE_ROOT}/${ARCHIVE_NAME}"

# Compress the logs
tar -czf "$ARCHIVE_PATH" -C "$(dirname "$LOG_DIR")" "$(basename "$LOG_DIR")"

# Log the operation
LOG_FILE="${ARCHIVE_ROOT}/archive_log.txt"
echo "$(date +"%Y-%m-%d %H:%M:%S") - Archived $LOG_DIR to $ARCHIVE_PATH" >> "$LOG_FILE"


# Email notification
"
    echo "$MESSAGE" | mail -s "$SUBJECT" "$EMAIL" && \
        echo "$(date '+%Y-%m-%d %H:%M:%S') - Email sent to ${EMAIL}" >> "$LOG_FILE" || \
        echo "$(date '+%Y-%m-%d %H:%M:%S') - Failed to send email to ${EMAIL}" >> "$LOG_FILE"
fi

echo "✅ Logs archived successfully!"
echo "Archive saved at: $ARCHIVE_PATH"
if [ -n "$EMAIL" ]; then
    echo "Email notification sent to: $EMAIL"
fi
echo "Operation logged in: $LOG_FILE"