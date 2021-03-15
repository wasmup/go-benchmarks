
## Go Benchmarks
```sh
go version
# go1.16.2
go test -benchtime=20000x -benchmem -run=^$ -bench .

BenchmarkZero1-8           20000             57577 ns/op               0 B/op          0 allocs/op
BenchmarkZero2-8           20000             67706 ns/op               0 B/op          0 allocs/op

```
