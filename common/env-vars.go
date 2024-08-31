package common

import (
	"log"
	"os"
	"strings"
)

// MustGetenv returns the value of the named environment variable
// or crashes the program with an error message.
func MustGetenv(name string) string {
	v := strings.TrimSpace(os.Getenv(name))
	if v == "" {
		log.Fatalf("Missing env var '%q' - aborting.", name)
	}
	return v
}
