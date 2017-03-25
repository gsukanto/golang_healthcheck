# We base our image on the super lean and clean Alpine distro with Golang.
FROM golang:1.7-alpine

RUN mkdir -p /app/healthcheck
WORKDIR /app/healthcheck

ADD . .

# Always EXPOSE the ports you will use, otherwise platforms like OpenShift
# will not be able to propose the correct ports to connect to.
EXPOSE 8080

# Most Dockerfiles really should only run a single process...
CMD ["go", "run", "main.go"]
