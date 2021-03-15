package main

import (
	"fmt"
	"math"
)

func main() {
	f := 1.235441232341e8
	fmt.Printf("%.6f\n", f) // 123544123.234100

	fmt.Printf("%.0f\n", math.Floor(f)) // 123544123

	fmt.Printf("%.0f\n", math.Round(f)) // 123544123

	fmt.Printf("%.0f\n", math.Trunc(f)) // 123544123

	fmt.Printf("%.6f\n", f-math.Trunc(f)) // 0.234100
}
