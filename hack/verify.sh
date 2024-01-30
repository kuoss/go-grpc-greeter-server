#!/bin/bash
echo $1

cd $(dirname $0)/../

case $1 in

misspell)
    [ -f ./bin/misspell ] || curl -L https://git.io/misspell | bash
    find . -type f -name '*.*' | xargs ./bin/misspell -error
    ;;

gocyclo)
    which gocyclo || go install github.com/fzipp/gocyclo/cmd/gocyclo@latest
    gocyclo -over 15 .
    ;;

gofmt)
    gofmt -l .
    test -z "$(gofmt -l .)"
    ;;

goimports)
    which goimports || go install golang.org/x/tools/cmd/goimports@latest
    goimports -local -v -w .
    ;;

golangci-lint)
    which golangci-lint || go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
    golangci-lint run --timeout 5m
    ;;

go-licenses)
    which go-licenses || go install github.com/google/go-licenses@v1.6.0
    go-licenses check .
    ;;

go-vet)
    go vet ./...
    ;;

go-test)
    go test ./... -race
    ;;

staticcheck)
    which staticcheck || go install honnef.co/go/tools/cmd/staticcheck@latest
    staticcheck ./...
    ;;

*)
    echo "Invalid command. Exiting."
    exit 1
    ;;
esac

if [[ $? != 0 ]]; then
    echo "❌ FAIL ($1)"
    exit 1
fi
echo "✔️ OK ($1)"