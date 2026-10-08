$users = @(
    [PSCustomObject]@{
        name   = "user1"
        status = "active"
    },
    [PSCustomObject]@{
        name   = "user2"
        status = "inactive"
    },
    [PSCustomObject]@{
        name   = "user3"
        status = "active"
    }
)


foreach ($user in $users) {
    Write-Host $user.name
}


foreach($user in $users){
if($user.status -eq "active"){
Write-Host $user.name
}
}

#Invoke-RestMethod is used to send an HTTP request to an API and convert the response into PowerShell-friendly objects

$res= Invoke-RestMethod -Uri "https://jsonplaceholder.typicode.com/posts"
foreach($i in $res){
Write-Output $i.title
}


$response=@(
@{
"name" = "payment-api"
"project" = "FINANCE"
},
@{
"name" =  "mobile-app"
"project" = "MOBILE"
},
@{
"name" = "automation"
"project" = "DEVOPS"
}
)

foreach($j in $response){
Write-Output "Repository: $($j.name)"
Write-Output "Project: $($j.project)"
}




$token="my-token"
$headers=@(
Authorization ="Bearer $token"
}

$res=Invoke-RestMethod ` -Uri "https://jsonplaceholder.typicode.com/posts" ` -Headers $headers ` -Method Get
foreach($prj in $res){
Write-Host "Project: $(prj.name)"
}




#Function => reusable block of commands and call whenever required

function Show-Tool{
param(
$ToolName 
)
Write-Output "Checking $ToolName"
}


function Get-ToolProjects {

    param(
        $Url,
        $Token
    )

    $headers = @{
        Authorization = "Bearer $Token"
    }

    $response = Invoke-RestMethod `
        -Uri $Url `
        -Headers $headers `
        -Method Get

    return $response
}


$projects = Get-ToolProjects `
    -Url $url `
    -Token $token


foreach ($project in $projects) {

    Write-Host "Project: $($project.Name)"

}








