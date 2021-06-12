@echo off
echo -----------------------------------
if "%1"=="" goto show
if "%2"=="" goto show

:add
aws ec2 authorize-security-group-ingress ^
--group-id sg-YourGroupId ^
--ip-permissions IpProtocol=tcp,FromPort=0,ToPort=65535,IpRanges=[{CidrIp=%2/32,Description="All Ports (Home)"}]

:revoke
aws ec2 revoke-security-group-ingress ^
--group-id sg-YourGroupId ^
--ip-permissions IpProtocol=tcp,FromPort=0,ToPort=65535,IpRanges=[{CidrIp=%1/32,Description="All Ports (Home)"}]

goto end
:show
echo Checking my IP at Amazon:
curl https://checkip.amazonaws.com/
echo Describing security group sg-YourGroupId
aws ec2 describe-security-groups --group-ids sg-YourGroupId | find "Cidr"
echo Formato: aws-update old-ip new-ip
echo    Sera revogado o acesso do ultimo IP e acrescentado o novo.

:end
echo -----------------------------------
