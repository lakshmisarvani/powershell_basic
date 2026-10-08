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