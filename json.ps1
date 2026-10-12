$json = '{
    "name": "Jenkins",
    "port": 8080,
    "status": "Running"
}'

$json

$json.GetType()



$data=$json | ConvertFrom-Json
$data.GetType()
$data.name



$json = '[
    {
        "name": "payment-api",
        "project": "FINANCE",
        "active": true
    },
    {
        "name": "mobile-app",
        "project": "MOBILE",
        "active": false
    },
    {
        "name": "automation",
        "project": "DEVOPS",
        "active": true
    }
]'

$repos = $json | ConvertFrom-Json
Write-Host "Let's make it look like an API response"

foreach ($repo in $repos) {

    Write-Host "Repository: $($repo.name)"
    Write-Host "Project: $($repo.project)"
    Write-Host "Active: $($repo.active)"
    Write-Host ""
}




foreach($repo in $repos){
if($repo.active -eq $true){
Write-Host "Repository: $($repo.name) | Project : $($repo.project)"
}
}


#real HTTP GET call using Invoke-RestMethod

$res=Invoke-RestMethod ` -Uri "https://jsonplaceholder.typicode.com/users" ` -Method Get
foreach($user in $res){
Write-Host "Name: $($user.name)"
Write-Host "Email: $($user.email)"
Write-Host "City: $($user.address.city)"
Write-Host ""
}

#When you use: PowerShell Invoke-RestMethod and the API returns JSON, PowerShell ordinarily deserializes that response for you.

# --------------------------------------------
# METHOD 1: Invoke-WebRequest
# --------------------------------------------
# Returns the complete HTTP response.
# JSON response body is available in .Content.

$rawResponse = Invoke-WebRequest `
    -Uri "https://jsonplaceholder.typicode.com/users" `
    -Method Get `
    -UseBasicParsing

Write-Host "HTTP Status: $($rawResponse.StatusCode)"

# Extract raw JSON response body
$json = $rawResponse.Content

# Convert JSON text into PowerShell objects
$users = $json | ConvertFrom-Json

# Display selected properties
$users | Select-Object name, email


# --------------------------------------------
# METHOD 2: Invoke-RestMethod
# --------------------------------------------
# Calls the REST API and automatically converts
# the JSON response into PowerShell objects.

$users = Invoke-RestMethod `
    -Uri "https://jsonplaceholder.typicode.com/users" `
    -Method Get

# PowerShell object properties can be used directly
$users | Select-Object name, email







<#
PowerShell API Command Notes
----------------------------

Invoke-WebRequest
    -> HTTP-focused
    -> Sends an HTTP request.
    -> Gives access to response status, headers, and content.
    -> Use .Content to access the raw response body.

ConvertFrom-Json
    -> Conversion-focused
    -> Converts JSON text into PowerShell objects.
    -> Object properties can then be accessed using .property syntax.

Invoke-RestMethod
    -> REST API-focused
    -> Sends a request to a REST API.
    -> Automatically converts JSON responses into PowerShell objects.
    -> Usually preferred when working directly with REST APIs.

Write-Host
    -> Display-focused
    -> Displays human-readable messages in the console.
    -> Useful for status messages, debugging, and script progress.

Select-Object
    -> Object/property-focused
    -> Selects specific properties from PowerShell objects.
    -> Useful for displaying only the required information.

Example Flow:

Invoke-WebRequest
        -> .Content
        -> Raw JSON String
        -> ConvertFrom-Json
        -> PowerShell Objects

Invoke-RestMethod
        -> API JSON Response
        -> Automatic conversion
        -> PowerShell Objects
#>

# API endpoint
$url = "https://jsonplaceholder.typicode.com/posts"


# Create PowerShell object/hashtable
$body = @{
    title  = "Tool Onboarding"
    body   = "Learning PowerShell REST APIs"
    userId = 1
}


# Convert PowerShell data into JSON
$jsonBody = $body | ConvertTo-Json


# Send JSON to API using POST
$response = Invoke-RestMethod ` -Uri $url ` -Method Post ` -Body $jsonBody ` -ContentType "application/json"

# Display API response
$response





$getResponse = Invoke-RestMethod ` -Uri $url ` -Method Get
 
Write-Host "`nGET Response:" $getResponse
