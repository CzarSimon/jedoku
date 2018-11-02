FROM golang:1.11.1-stretch as go-build

# Install appv
RUN go get -u github.com/CzarSimon/appv
RUN go install github.com/CzarSimon/appv

FROM jenkins/jenkins:2.149

# Switch to root user for binary installations.
USER root

WORKDIR /opt/jenkins

# Copy appv
COPY --from=go-build /go/bin/appv /usr/local/bin/appv

# Install docker
RUN apt-get update && apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common

RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -

RUN add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/debian \
    $(lsb_release -cs) stable"
RUN apt-get update && apt-get install -y docker-ce
RUN usermod -aG docker jenkins

# Installing kubectl
COPY download-kubectl.sh .
RUN sh download-kubectl.sh
RUN chmod +x ./kubectl
RUN mv kubectl /usr/local/bin/kubectl

# Switching back to jenkins user.
USER jenkins

