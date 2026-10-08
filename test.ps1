#Get-Date
#Get-Process


#to print the service name and status with condition status is in running 
#Get-Service |
Where-Object {$_.Status -eq "Running"} |
Select-Object Name, Status



#Get-Process | Select-Object Name, Id

#Get-ChildItem

#$PSVersionTable.PSVersion


#$tools=@("Jira","Confluence","Bitbucket")

#foreach($i in $tools){
#Write-Output $i
#}


#Get-Service | Get-Member



#Get-NetTCPConnection

$tools = @("Jira","Confluence","BitBucket","Jenkins")
foreach($i in $tools){
if($i -eq "Jenkins"){
Write-Output "Found Jenkins"
}
}


for($i=1;$i -le 5;$i++){
Write-Host $i
}

Write-Host "While loop"

$count=5
while($count -le 10){
Write-Host $count
$count++
}







