# AWS Cli

## Configure
```ini
// config
[default]
region = us-east-1

[aws]
region = us-east-1

[aws01]
region = us-east-1

[aws02]
region = us-east-1

[aws03]
region = us-east-1

// credentials
[aws]
aws_access_key_id = ADQ2QYQMZVMUJ
aws_secret_access_key = jDZT7PtAgVxFVf/WUTniwCjAJP

[aws01]
aws_access_key_id = AKIAZNJZPTAMP
aws_secret_access_key = CZPDWoDfQlvJcdPD1ZvMqzp21yQe

[aws02]
aws_access_key_id = AKIAXEIMFPJRLGV
aws_secret_access_key = DDRQqReBAFHCdKytqUQ5CSRxME5ZswvHmBm+Gv/k

[aws03]
aws_access_key_id = AKIARL3R3TN4
aws_secret_access_key = 8G2DLEaQgEAdYeEs6Hesskj

```

## 
```bash
> aws ec2 describe-instances --instance-ids i-0edb1aa37ed9db938 --query "Reservations[].Instances[].EnaSupport" --profile server01 --region us-east-1  
> aws ec2 modify-instance-attribute --instance-id i-0edb1aa37ed9db938 --ena-support --profile server01 --region us-east-1
> aws ec2 describe-images --image-ids ami-0331b61b8d32e84ac --query "Reservations[].Instances[].EnaSupport" --profile server01 --region us-east-1
> aws ec2 describe-instance-types --filters "Name=instance-type,Values=c5a.*" --query "InstanceTypes[].{Type: InstanceType, MaxENI: NetworkInfo.MaximumNetworkInterfaces, IPv4addr: NetworkInfo.Ipv4AddressesPerInterface}" --output table --profile server01 --region us-east-1
> aws ec2 import-image --description "Win10" --disk-containers file://in10.json --profile server01 --region us-east-1
> aws ec2 describe-import-image-tasks --import-task-ids "import-ami-0e89aeba0628c4eee" --profile server01 --region us-east-1
> aws s3 cpWin10.ova s3://ami/windows10/10.ova --profile server01
> aws s3 rm s3://ami/windows10/Win10.ova --profile server01
> 
```