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

### 1. Set up a webhook server or run your web server

Start a server, any as long as you can view the logs or use a free webhook service to receive incoming POST requests.  
For example, head over to [https://webhook.site](https://webhook.site) — it will instantly generate a **unique URL** for you.
![image](https://github.com/user-attachments/assets/dc40c327-0ec0-4f1a-85df-3ebb7f31e0f0)

📸 _Copy that URL into your `yourhttp_server.txt` file._
I will use this URL and copy it into the project's yourhttp_server.txt file
![image](https://github.com/user-attachments/assets/5a4aac05-c3da-4e6a-b32e-0d4c4b8458bc)

— Your project is ready, now find a vector to copy the project to the victim's workstation(s).

---

### 2. Deploy on the target machine

Use any vector to place the folder on the victim’s workstation (USB, shared drive, phishing dropper, etc.).

On the target system, simply **double-click `RUN.vbs`**.  
This will launch the clipboard watcher **without any visible window** or trace in the taskbar.

---

### 3. Monitor remotely

Back at your command center, monitor the clipboard activity via the webhook interface.  
During the day, users often copy credentials, temporary secrets, or tokens. With this agent in place, you get them live.

📸 _Example: Passwords copied from KeePass can be intercepted in real time._

---

## 🪄 Optional: Make it persistent

To launch the agent at every startup, simply **drop a shortcut to `RUN.vbs`** into the following folder:

```
%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup
```

✅ You now have a **persistent, silent agent** that posts clipboard data to your server on every reboot.

---

## 🧪 Example with KeePass

Let’s simulate a realistic clipboard leak:

1. The victim opens **KeePass** and copies a password (e.g., `QP@ss8V3WordjepiCPO!`).
2. Our agent detects the new clipboard content.
   
![image](https://github.com/user-attachments/assets/0653659d-7952-4948-aadd-07adc0c67ab9)
3. It posts it immediately to our webhook endpoint.

📥 Here's what you receive on the server:

![image](https://github.com/user-attachments/assets/5e47b1d2-1d49-44d1-8913-68ce8964fe8c)


## 🔐 Ethical Warning

This kind of tool has the potential for misuse. **This project is strictly educational.**

⚠️ Clipboard monitoring must **only** be performed with **informed, explicit consent**, and within a **legal and ethical context** — such as:

- Internal red teaming
- Blue team training labs
- Consent-based security assessments
- Cybersecurity awareness demos

---

## 🧠 Takeaways

This project is a minimal, effective example of how simple scripts can become **powerful reconnaissance tools**.  
It also serves as a reminder of how seemingly harmless features — like copy/paste — can become a **data exfiltration vector**.

Use responsibly. Hack ethically. 🔐
