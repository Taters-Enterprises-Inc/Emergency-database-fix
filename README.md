# 🛠️ XAMPP Emergency Fix Utilities

This repo contains **two emergency tools** to help fix common MySQL issues in XAMPP:

- `restore_mysql_data.bat` – Safely restores MySQL data using a backup and user data.
- `kill_3306_process.bat` – Terminates any process currently blocking MySQL port `3306`.

---

## 📥 Installation & Usage

1. **Download the `.bat` file** based on your issue (see table below).
2. **Paste it inside your XAMPP directory**:
   - For `restore_mysql_data.bat`, paste inside:  
     `xampp/mysql/`
   - For `kill_3306_process.bat`, paste anywhere (but run as Administrator).
3. **Right-click the file > Run as Administrator**.
4. Follow any on-screen instructions.

---

## 📋 Use Case Reference

| Script Name               | Purpose                                                                 | Location to Place      | When to Use                                                       |
|---------------------------|-------------------------------------------------------------------------|-------------------------|-------------------------------------------------------------------|
| `kill_3306_process.bat`   | Finds and kills the process using port 3306 (usually causing MySQL lock) | Anywhere (Run as Admin) | You see `MySQL shutdown unexpectedly` and suspect port conflict. |
| `restore_mysql_data.bat` | Renames broken data folder, restores from backup, and recovers user data | `xampp/mysql/`          | Your MySQL won’t start due to data corruption or crash.           |

---

## 📦 Folder Requirements

For `restore_mysql_data.bat` to work correctly, make sure:
- You have a valid backup folder inside `xampp/mysql/` named `backup`
- Your current `data` folder exists and is to be archived
- You run the script as **Administrator**

---

## ⚠️ Disclaimer

These scripts are intended for quick local fixes in a XAMPP environment.
- Always **make a full manual backup** before using.
- Not recommended for production environments.

---

## ✅ Tested On

- Windows 10 / 11  
- XAMPP v3.3.0
- MySQL (InnoDB and MyISAM)

---

