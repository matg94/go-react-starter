FROM golang:1.19-alpine AS go-build

WORKDIR /app

COPY src/go.mod .
COPY src/go.sum .
RUN go mod download

COPY ./src .

RUN go build

FROM node:19.2.0 AS node-build

WORKDIR /app
COPY --from=go-build /app ./

WORKDIR /app/frontend

RUN npm install && npm run build

FROM golang:1.19-alpine

WORKDIR /app

COPY --from=go-build \
    /app \
    /app

COPY --from=node-build \
    /app/build \
    /app/build/

CMD ["/app//app"]