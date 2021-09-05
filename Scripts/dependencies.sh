#!/bin/bash
sudo yum update -y

# copying local machine pub key to authorized key of target machines
echo ----- copy local pub key to host machine -----
cat << EOF >> /home/ec2-user/.ssh/authorized_keys
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDZ4cok3mmW99QaPxsM4KzAZjgF0pRVq/wtXNA3IxMfWM35fmpteYuWVgEEvbW89FX9VgCWhdU174EtA8xK9buTqdJGWotoIkgDFcF92YjxB0J7bLeHcshX9kA6VGPT+xVP4zWBffVRtNpPN/Nk8Bl4W/wlcVfLeG25h/mk4lsDsOQ1XM2tHQi1G4VQ9ogMUZjYY9mEIBTPAL8JdyXivIypz0BM1yvNS7oNfU690mIPatZiO9SXAKGwiaZbuNrjVFtODAyAeVOAFEYdReWDU//C9XNh8kdLpZnz5gWKt++BQJ3roV9KrNuZxYFD9aueHscWWMbVPs4XV1i1qMZa+D6vo3yLjd0tTJQG5/9tady48VfCSYxpxbhDbaGWooAk/JKRO3Cb6KqoQq66pbW6kXvNewKy5P7Ve1/emM232uaafEvlPn0jmdhcoNkEDp6KK62xZHMcycQfT42rjv8ABda4TMxBRsuAaUTWtyWEMRxBIeQVCADQ5cRPxjYtcE+s+EE= CL90299@AB10-07316PL010
EOF

# Prepare Ansible dynamic inventory
echo ----- installing dependencies pip -----
sudo amazon-linux-extras install epel
sudo ansible-galaxy collection install amazon.aws
wget https://bootstrap.pypa.io/pip/2.7/get-pip.py
python get-pip.py

# Install Boto
echo ----- installing dependencies boto -----
pip install boto