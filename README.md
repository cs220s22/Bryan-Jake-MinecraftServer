# Bryan-Jake-MinecraftServer

This is a minecraft server hosted with Docker and AWS.


Running the Server Locally:

	1.) Download Jarfile on https://www.minecraft.net/en-us/download/server
    2.) Edit Eula.txt file to be true
	3.) java -Xmx1024M -Xms1024M -jar server.jar nogui 
	4.) java -jar server.jar

Running the Server (Docker):

    1.) Have docker running
    2.) From the terminal enter "docker-compose up"
    
Closing the server (Docker):
 
    1.) In the terminal running the server hit "Crtl + C"
        and enter "docker-compose down"
        
Running the Server in a AWS EC2 intance:

    1.) Go to AWS website, then click on services, then EC2
    2.) Go to launch instance
    3.) Change your instance type to one with more memory like t2.large
    4.) Specify/Download a key par
    5.) Edit the Network settings creating a security group  
        1.) Specify a name and description Ex: Name: mine_server_security_group  description: minecraft server
        2.) Create two rules for the security group one with type: ssh and source type: anywhere, other is a custom 
            TCP with port range: 25565 and source type: anywhere
    6.) add this to User Data
```
        #!/bin/bash
        sudo yum update
        sudo yum -y install docker
        sudo yum -y install git
        sudo curl -L https://github.com/docker/compose/releases/download/1.21.0/docker-compose-`uname -s`-`uname -m` | sudo tee /usr/local/bin/docker-      compose > /dev/null
        git clone https://github.com/cs220s22/Bryan-Jake-MinecraftServer.git
        sudo systemctl start docker
        cd Bryan-Jake-MinecraftServer
        cd Docker
        sudo chmod +x /usr/local/bin/docker-compose
        sudo chmod 666 /var/run/docker.sock
        sudo service docker start && docker-compose up -d 
```


Technologies Used:

    - Minecraft: https://www.minecraft.net/en-us
    - Docker: https://www.docker.com/?utm_source=google&utm_medium=cpc&utm_campaign=search_na_brand&utm_term=docker_download_phrase&utm_content=modern&gclid=CjwKCAjwjZmTBhB4EiwAynRmD865r_6yj9d9dbz6f2F1TVErOBdoIadSFMXERJlRQl5O-2sKCffRjxoC9xAQAvD_BwE
    - AWS: https://aws.amazon.com/free/?trk=78b916d7-7c94-4cab-98d9-0ce5e648dd5f&sc_channel=ps&sc_campaign=acquisition&sc_medium=ACQ-P|PS-GO|Brand|Desktop|SU|AWS|Core|US|EN|Text&s_kwcid=AL!4422!3!432339156156!e!!g!!amazon%20aws&ef_id=Cj0KCQjw06OTBhC_ARIsAAU1yOVLmrSlpZkyCEau7cj1xzPaWWM0HA4OlB2LxrM9PRUarYQ35oBUVPoaApJ_EALw_wcB:G:s&s_kwcid=AL!4422!3!432339156156!e!!g!!amazon%20aws&all-free-tier.sort-by=item.additionalFields.SortRank&all-free-tier.sort-order=asc&awsf.Free%20Tier%20Types=*all&awsf.Free%20Tier%20Categories=*all

Sources:

    - https://www.youtube.com/watch?v=TxjvC6GRjkU&t=577s
  
