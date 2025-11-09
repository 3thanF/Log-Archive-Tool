The project is a shell-based command-line tool designed to automatically archive and manage system logs.

![Description](https://media2.giphy.com/media/v1.Y2lkPTZjMDliOTUyOWhnOGphc2ZxbnIyYW95ZDRuc3JuZXBkOXFjcTJiNnN6dnk2ODZkdCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/k8390s43Cqi24Yrrdh/giphy.gif)


It helps keep Unix systems clean by compressing logs and storing them in a separate directory while maintaining them for future reference.
Check: https://roadmap.sh/projects/log-archive-tool
## Main Features:

* Runs from the terminal with a simple command:
```./log-archive.sh /var/log ```

* Accepts any log directory as an argument.

* Compresses all log files into a single ```tar.gz archive.```

* Names each archive with a timestamp, for example: ```logs_archive_20251108_210255.tar.gz```

* Saves all archives in a dedicated ```“archives”``` directory, creating it if necessary.

* Records the ```date, time, and location``` of each archive in a ```log file```.

* Can send an email notification to the user after the archive is completed.

* Supports both ```Postfix (with Gmail relay)``` and ```msmtp``` for email delivery.

* Includes error handling for missing arguments, invalid directories, and permission issues.

## Skills Practiced:

* Shell scripting ```(variables, conditions, date/time handling)```.

* File and directory management using ```tar, mkdir, and mv```.

* System administration basics for handling log files in ```/var/log```.

* Automation through ```cron``` scheduling.

* Email configuration and integration with external ```SMTP```services.

* Logging and simple error tracking.

## Example Workflow:

* Run the script with the log directory as an argument.

* The tool compresses all logs and moves the archive to the archive directory.

* It logs the details of the operation and optionally emails a success message to the user.
