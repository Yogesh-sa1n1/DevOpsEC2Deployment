# DevOpsEC2Deployment
Automate EC2 Deployment with spring boot app


1. Sign UP for your own AWS free tier
2. Spins up an EC2 instance of a specific type
3. Installs dependencies -java 19
4. Clones repo & deploys app from GitHub
a. Github repo link -https://github.com/techeazy-consulting/techeazy-devops
5. Tests if app is reachable via port 8080
6. Stops the instance after a set time (for cost saving)
7. No secret or Access KEY to be added in REPO -these will be read from ENV
8. Create script in a way where a “Stage” parameter will be passed, like “Dev”, “Prod” and it should pick a config file
accordingly, like dev_config, prod_config
Make instance type, dependencies, and repo configurable, use defaults if not available.
