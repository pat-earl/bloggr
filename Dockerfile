FROM golang:alpine

RUN addgroup bloggr && adduser -h /bloggr -S bloggr bloggr

WORKDIR /bloggr

COPY --chown=bloggr:bloggr --exclude=.git*/ . .

RUN go build . && rm -rf /cache

USER 1000
EXPOSE 8080

ENTRYPOINT ["/bloggr/bloggr"]