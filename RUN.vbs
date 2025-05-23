Set shell = CreateObject("WScript.Shell")
shell.Run "powershell.exe -ExecutionPolicy Bypass -File """ & WScript.ScriptFullName & "\..\givemeyourclipboard.ps1""", 0, False
