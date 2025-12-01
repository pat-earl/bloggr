FROM golang:alpine

RUN adduser -h /bloggr -S bloggr bloggr

WORKDIR /bloggr

COPY --chown=bloggr:bloggr . .

RUN go build .

USER 1000
EXPOSE 8080

ENTRYPOINT ["/bloggr/bloggr"]