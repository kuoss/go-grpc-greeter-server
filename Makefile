

checks: misspell go-licenses go-test go-vet gocyclo gofmt goimports golangci-lint staticcheck

misspell:
	hack/verify.sh misspell
go-licenses:
	hack/verify.sh go-licenses
go-test:
	hack/verify.sh go-test
go-vet:
	hack/verify.sh go-vet
gocyclo:
	hack/verify.sh gocyclo
gofmt:
	hack/verify.sh gofmt
goimports:
	hack/verify.sh goimports
golangci-lint:
	hack/verify.sh golangci-lint
staticcheck:
	hack/verify.sh staticcheck
