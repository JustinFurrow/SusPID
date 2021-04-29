#Basic commands for investigating a suspcious process, generally identified via netstat -f or netstat -naob. Outputs all associated .dll files, where the process was launched from, and what process spawned it.
#Special thanks to Wild West Hackin' Fest, Black Hills Information Security, and John Strand for teaching me the basics of how to search for and investigate processes in WindowsCLI. 

$susPID = Read-Host "Enter PID for investigation"
Tasklist /m /fi "pid eq $susPID"
Wmic process where processid=$susPID get commandline
Wmic process get name,parentprocessid,processid | Select-String "Name","$susPID"