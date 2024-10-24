Name: Aryan Sudhagoni
G#: G01454180
This readme file contains the steps to create and configure the S3 bucket and EC2 instance used in this assignment in Part1 and Part2 respectively.
The URLs for the Part-1 and Part-2 are at the end of the page. I also added a separate text file containing only the links for the assignments. 


Steps to create and configure S3 bucket-

Step 1: Create a bucket- Sign in to the AWS Management Console and choose Create bucket then enter the Bucket name
Step 2: Enable static website hosting- Under Static website hosting, choose Enable.
Step 3: Edit Block Public Access settings- Under Block public access (bucket settings), choose Edit. Clear Block all public access, and choose Save changes.
Step 4: Add a bucket policy that makes your bucket content publicly available- To grant public read access for your website, update the bucket policy.
Step 5: Configure an index document
Step 6: Configure an error document
Step 7: Test your website endpoint
Step 8: Clean up


Steps to create and configure EC2 instance-

Step 1: Log in to AWS Console- Go to the AWS Management Console. Log in with your AWS credentials.
Step 2: Navigate to EC2 Dashboard- In the Services menu at the top, search for and select EC2.
Step 3: Launch a New Instance- In the EC2 Dashboard, click the Launch Instance button. Give your instance a name.
Step 4: Choose an Amazon Machine Image (AMI)- You will be prompted to choose an Amazon Machine Image (AMI). Select Ubuntu Server. Ensure that the AMI is free-tier eligible.
Step 5: Select an Instance Type- Choose an Instance Type. For the free tier, select t2.micro, which includes 1 vCPU and 1 GB RAM.
Step 6: Configure Instance Details- Keep the default settings for most configurations. Ensure Auto-assign Public IP is enabled so the instance is publicly accessible. In the Network section, make sure you're using the default VPC.
Step 7: Configure Security Group- A security group acts as a virtual firewall. You’ll need to set inbound rules for your instance to allow SSH (port 22) and HTTP/HTTPS (ports 80/443) traffic.
Step 8: Review and Launch- Review all the settings for your instance.
Step 9. Create/Select Key Pair
You will be prompted to choose an existing key pair or create a new key pair.If creating a new key pair: Download the key pair (.pem file) and store it securely. You will need this to connect to your instance via SSH.
Step 10: Connect to Your EC2 Instance
After your instance launches, click View Instances to go to the EC2 Dashboard.
Connect to the instance via SSH using the .pem file:
bash
Copy code
ssh -i "path/to/your-key.pem" ubuntu@your-ec2-public-ip
Replace "path/to/your-key.pem" with the location of your .pem file and your-ec2-public-ip with your instance's public IP address.
Step 11: Install and Configure Web Server- After connecting to your instance, you can set up a web server. For example, to install Apache:
bash
Copy code
sudo apt update
sudo apt install apache2 -y
Start the Apache service:
bash
Copy code
sudo systemctl start apache2
sudo systemctl enable apache2
Now, your instance is running a web server. You can visit the public IP of your EC2 instance in a browser, and it will serve the Apache default page.


Links for the webpages
PART-1 

Homepage - https://aryan-645-p1.s3.amazonaws.com/Intro.html
Error page- https://aryan-645-p1.s3.amazonaws.com/error.html

PART-2

Survey page - http://3.88.240.223/survey.html
