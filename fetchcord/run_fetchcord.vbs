' Check if Discord is running and if it is, prompt the user to start FetchCord.
' To use the script, download it and place it in your startup folder.

Set WshShell = CreateObject("WScript.Shell")
Set objShell = CreateObject("WScript.Shell")

Do
    ' Check if Discord is running
    Set oWMIService = GetObject("winmgmts:\\.\root\cimv2")
    Set colProcesses = oWMIService.ExecQuery("SELECT * FROM Win32_Process WHERE Name = 'Discord.exe'")

    If colProcesses.Count > 0 Then
        ' If Discord is running, prompt the user
        intChoice = MsgBox("Discord is running, do you want to run FetchCord?", vbYesNo, "FetchCord")
        
        If intChoice = vbYes Then
            objShell.Run "fetchcord --update", 0, True
            objShell.Run "fetchcord -t 15", 0, True
            Exit Do
        Else
            Exit Do
        End If
    Else
        ' If Discord is not running, prompt the user if they want to keep checking or cancel
        intContinueChoice = MsgBox("Discord has not been detected to be running, continue checking every 30 seconds?", vbYesNo, "Discord Status")
        If intContinueChoice = vbNo Then
            Exit Do
        Else
            WScript.Sleep 30000
        End If
    End If
Loop

Set WshShell = Nothing
