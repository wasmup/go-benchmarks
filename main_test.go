package main

import (
	"testing"
)

var a = [1024 * 1024]byte{}

func BenchmarkZero1(b *testing.B) {
	a[len(a)-1] = 100
	for i := 0; i < b.N; i++ {
		for j := range a {
			a[j] = 0
		}
	}
	a[0] = 100
}

func BenchmarkZero2(b *testing.B) {
	a[len(a)-1] = 100
	for i := 0; i < b.N; i++ {
		a = [1024 * 1024]byte{}
	}
	a[0] = 100
}
