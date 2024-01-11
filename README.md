# Hamclock Docker

"HamClock is a kiosk-style application that provides real time space weather, radio propagation models, operating events and other information particularly useful to the radio amateur." (Source: Hamclock Website)

Goal of this repository is to build and run Hamclock inside Docker for ease of use.
Hamclock will be exposed as a webservice on [http://localhost:8081/live.html](http://localhost:8081/live.html)

This repository does NOT contain any Hamclock source files as it's neither neccessary nor is the licensing clear. The files will be downloaded and compiled during `docker build`.

More information and documentation on the Hamclock Website:
[https://www.clearskyinstitute.com/ham/HamClock/](https://www.clearskyinstitute.com/ham/HamClock/)

## How to use
### Prerequisites
I assume that you're on some form of Linux/Unix system.
Docker and (optionally) Docker Compose are installed.
This may or may not work inside Windows WSL2 environment. I've not tested it and most likley will. Please give feedback if you tested this. :)

As of now, i don't have a raspbery Pi. WB0OEW gave me the feedback, that the `docker-compose` variant doesn't work on his Pi4, we're going to work that out.

### Install/Usage
#### Docker (Hard mode)
1. Check out this repository and change into it
2. Copy the `config_example.env` to `config.env` and edit to your liking
3. Inside the repository, run `docker build -t hamclock .`
4. Run Hamclock using `docker run --rm --name hamclock -d -it -p 8081:8081 -p 8080:8080  --env-file config.env hamclock`
5. Enjoy WB0OEW's hard work on [http://localhost:8081/live.html](http://localhost:8081/live.html)
6. To stop Hamclock, run `docker stop hamclock`

#### Docker Compose (Easy mode)
1. Check out this repository and change into it
2. Copy the `config_example.env` to `config.env` and edit to your liking
3. Inside the repository, run `docker-compose up -d`
4. Enjoy WB0OEW's hard work on [http://localhost:8081/live.html](http://localhost:8081/live.html)
5. To stop Hamclock, simply run `docker-compose down`

#### Docker Compose Hybrid (Build Docker image then use it in Docker Compose)
1. Clone this repo
    ``` cmd
    git clone https://github.com/zeidlos/hamclock-docker.git
    ```
2. Change directory into the repo
    ``` cmd
    cd hamclock-docker
    ```
3. Copy the `config_example.env` to `config.env` and edit to your liking
4. Build the Docker image for the Dockerfile with this commad
    ``` cmd
    docker build -t hamclock:latest
    ```
5. Run the container with this command
    ``` cmd
    docker-compose -f docker-compose.hybrid.yml up -d
    ```
    ##### you can change the ports, docker network, and other things you may need by editing the docker-compose.hybrid.yml file #####
    ##### Also note that if you change the port that the container is using you will need to change the address to access Hamclock 
    ex: with the port changed to 9500 the address to access hamclock will be  http://localhost:9500/live.html

### Advanced (Server/Cloud) usage
At this point I assume you have deeper knowledge on how to use Docker and potentially Kubernetes as well as reverse proxies, so I won't bother to explain the myriad of options on how to get it to run on remote infrastructure.

## Compatibility
(x) Intel based MacOS
(x) Silicon based MacOS
(x) Intel based Linux (Debian)
(?) Rasbian
(?) Windows WSL2

## Issues and problems
Please let me know if you encounter any issues or problems. Ideally you include your operating system, architecture (Intel, AMD, Atom, Apple Silicon M1/2) as well as the software versions of docker and docker compose in your ticket. I'll gladly assist in any issues. You can also email me, using the email address on my QRZ-page (DO7JZ).

## Contributing
If you're interested in advancing this, please use the usual workflow of forking and creating a pullrequest.

## Similar projects
Chris thought this project is not maintained anymore and did want to try a different approach. If this doesn't work for you maybe give his project a try:
https://github.com/ChrisRomp/hamclock-docker
## Changelog
### v0.01
Customize Hamclock configuration via config file
### v0.00
Initial release.

## Future Plans
* Make it work on Raspbian as well.
* Customize target resolution in build process.

Thanks to WB0OEW for his great ham radio tool!
73

