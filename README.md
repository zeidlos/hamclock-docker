# Hamclock Docker

"HamClock is a kiosk-style application that provides real time space weather, radio propagation models, operating events and other information particularly useful to the radio amateur." (Source: Hamclock Website)

Goal of this repository is to build and run Hamclock inside Docker for ease of use.
Hamclock will be exposed as a webservice on [http://localhost:8081](http://localhost:8081)

This repository does NOT contain any Hamclock source files as it's neither neccessary nor is the licensing clear. The files will be downloaded and compiled during `docker build`.

More information and documentation on the Hamclock Website:
[https://www.clearskyinstitute.com/ham/HamClock/](https://www.clearskyinstitute.com/ham/HamClock/)

## How to use
### Prerequisites
I assume that you're on some form of Linux/Unix system.
Docker and (optionally) Docker Compose are installed.
This may or may not work inside Windows WSL2 environment. I've not tested it and most likley wont. Please give feedback if you tested this. :)

As of now, i don't have a raspbery Pi. WB0OEW gave me the feedback, that the `docker-compose` variant doesn't work on his Pi4, we're going to work that out.

### Install/Usage
#### Docker (Hard mode)
1. Check out this repository
2. Inside the repository, run `docker build -t hamclock .`
3. Run Hamclock using `docker run --rm --name -d -it -p 8081:8081 -p 8080:8080 hamclock`
4. Quickly open [http://localhost:8081](http://localhost:8081) and set up hamclock
5. Enjoy WB0OEW's hard work
6. To stop Hamclock, run `docker stop hamclock`

#### Docker Compose (Easy mode)
1. Check out this repository
2. Inside the repository, run `docker-compose up -d`
3. Quickly open [http://localhost:8081](http://localhost:8081) and set up hamclock
4. Enjoy WB0OEW's hard work
5. To stop Hamclock, simply run `docker-compose down`

### Advanced (Server/Cloud) usage
At this point I assume you have deeper knowledge on how to use Docker and potentially Kubernetes as well as reverse proxies, so I won't bother to explain the myriad of options on how to get it to run on remote infrastructure.

## Contributing
If you're interested in advancing this, please use the usual workflow of forking and creating a pullrequest.

## Future Plans
* Make it work on Raspbian as well.
* Customize Hamclock configuration via config file and writing the eeprom file as detailed on the website>user contrib>5.
* Customize target resolution in build process.

Thanks to WB0OEW for his great ham radio tool!
73

