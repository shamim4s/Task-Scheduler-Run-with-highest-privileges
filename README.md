# 🛠 Create Windows Scheduled Task via Batch Script

This batch script (`CreateScheduledTask.bat`) allows you to automatically create a **Windows Scheduled Task** that will launch an application (e.g., an `.exe` file) at system boot or user logon, with optional delay and elevated privileges.

## ✅ Features

- ⏱ Trigger on system **boot** or **user logon**
- 🔐 Option to **run with highest privileges**
- 🕒 Set a custom **delay time**
- 👤 Run as Administrators or SYSTEM or specific **username/password**
- 🔁 Automatically deletes existing task before creating new one

## 📂 Files

- `CreateScheduledTask.bat`: Main batch script to create the scheduled task.

## 🧪 How It Works (Step-by-Step)

### 1. Set Configuration Variables

The top section of the script contains customizable variables.

### 2. Delete Old Task

Deletes any existing task with the same name to avoid duplicates.

### 3. Build Task Trigger Arguments

Chooses between boot-based or logon-based triggers.

### 4. Configure Execution Privileges

Sets the privilege level (`HIGHEST` or `LIMITED`).

### 5. Create the Task

Executes the creation of the task using `schtasks`. Uses the values configured earlier.

## 💻 How to Use It

### Step-by-Step Instructions

1. **Edit the Script**: Modify the variables at the top.
2. **Run as Administrator**: Required for scheduling system tasks.
3. **Verify in Task Scheduler**: Open Task Scheduler to verify task exists.

## 🛡 Security Notes

Avoid hardcoding passwords in production. Use secure credential management if needed.

## 🧰 Example Use Case

Launch an application (`FilebrowserMonitor.exe`) at boot, with a 15s delay, under Admin account, with elevated permissions.

## 📞 Support

For more triggers, logging, or XML imports, extend the script or reach out.
