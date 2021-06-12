# AWSAllowMyNewIP
Windows batch command-line for IP update on your main security group.

#Requirements
- Windows (any)
- curl for Windows
- aws-update.bat

#Preparing
Edit aws-update.bat and replace all sg-YourGroupId occurrencies with the id of your AWS EC2 Security Group.
Add curl\bin folder to your Windows PATH.

#aws-update usage
C:\>aws-update
   Check your current public IP and lists all IPs (Cidr) from your Security Group.
   
C:\>aws-update old-ip new-ip
   Revoke the authorization for the old-ip (all ports) and add new ingress rule for the new-ip (all ports).
  

