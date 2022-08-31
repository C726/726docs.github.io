# AWS Cli

## Configure
```ini
// config
[default]
region = us-east-1

[qiniuserver01]
region = us-east-1

[24server01]
region = us-east-1

[24server02]
region = us-east-1

[24server03]
region = us-east-1

// credentials
[qiniuserver01]
aws_access_key_id = AKIAYYKIDQ2QYQMZVMUJ
aws_secret_access_key = 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

[24server01]
aws_access_key_id = AKIAZNJZIWBK7NAPTAMP
aws_secret_access_key = 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

[24server02]
aws_access_key_id = AKIAXEIMFVVERBPJRLGV
aws_secret_access_key = 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

[24server03]
aws_access_key_id = AKIARL3R3TN4YDGDJXTA
aws_secret_access_key = 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

```

## 
```bash
> aws ec2 describe-instances --instance-ids i-0edb1aa37ed9db938 --query "Reservations[].Instances[].EnaSupport" --profile qiniuserver01 --region us-east-1  
> aws ec2 modify-instance-attribute --instance-id i-0edb1aa37ed9db938 --ena-support --profile qiniuserver01 --region us-east-1
> aws ec2 describe-images --image-ids ami-0331b61b8d32e84ac --query "Reservations[].Instances[].EnaSupport" --profile qiniuserver01 --region us-east-1
> aws ec2 describe-instance-types --filters "Name=instance-type,Values=c5a.*" --query "InstanceTypes[].{Type: InstanceType, MaxENI: NetworkInfo.MaximumNetworkInterfaces, IPv4addr: NetworkInfo.Ipv4AddressesPerInterface}" --output table --profile qiniuserver01 --region us-east-1
> aws ec2 import-image --description "QiniuServerWin10" --disk-containers file://qiniuwin10.json --profile qiniuserver01 --region us-east-1
> aws ec2 describe-import-image-tasks --import-task-ids "import-ami-0e89aeba0628c4eee" --profile qiniuserver01 --region us-east-1
> aws s3 cp QiniuWin10.ova s3://qiniuserverami/windows10/QiniuWin10.ova --profile qiniuserver01
> aws s3 rm s3://qiniuserverami/windows10/QiniuWin10.ova --profile qiniuserver01
> 
```