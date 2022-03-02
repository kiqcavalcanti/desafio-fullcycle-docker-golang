FROM golang as golang

WORKDIR /app

COPY hello.go .
RUN go mod init example/hello && \
    go build -o hello-app

FROM scratch

WORKDIR /app

COPY --from=golang /app/hello-app /app/

CMD ["./hello-app"]