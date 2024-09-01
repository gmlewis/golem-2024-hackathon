// gen-tweet-xid generates a new Tweet XID and prints it to stdout
// which is handy for bash scripting.
package main

import (
	"fmt"
	"log"

	"github.com/gmlewis/golem-2024-hackathon/xids"
)

func main() {
	xid, err := xids.New("Tweet")
	if err != nil {
		log.Fatal(err)
	}
	fmt.Printf("%v\n", xid)
}
