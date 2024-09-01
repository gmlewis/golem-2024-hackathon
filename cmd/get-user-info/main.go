// get-user-info returns information from the JWT-protected
// API endpoint. It requires enviroment variables to be set.
// See README.md for details.
//
// Usage:
//
//	source .env.development.local
//	go run cmd/get-user-info/main.go [-debug] -user 'user-1' -xid 'user1-xid' -handle 'user-2'
package main

import (
	"encoding/base64"
	"flag"
	"fmt"
	"io"
	"log"
	"net/http"
	"net/url"
	"strings"

	"github.com/gmlewis/go-httpdebug/httpdebug"
	"github.com/gmlewis/golem-2024-hackathon/common"
)

const (
	baseURLEnvVar    = "GOLEM_2024_HACKATHON_BASE_URL"
	privateKeyEnvVar = "GOLEM_2024_HACKATHON_PRIVATE_KEY"
)

var (
	debug     = flag.Bool("debug", false, "Enable debug messages")
	otherUser = flag.String("handle", "", "User handle to get")
	thisUser  = flag.String("user", "", "The user that is making the call")
	thisXID   = flag.String("xid", "", "The user's XID that is making the call")
)

func main() {
	flag.Parse()

	if *thisUser == "" {
		log.Fatalf("missing -user 'this-user-handle' flag")
	}
	if *thisXID == "" {
		log.Fatalf("missing -xid 'this-user-xid' flag")
	}
	if *otherUser == "" {
		log.Fatalf("missing -handle 'other-user-handle' flag")
	}

	baseURL := common.MustGetenv(baseURLEnvVar)
	privateKey := common.MustGetenv(privateKeyEnvVar)

	url := fmt.Sprintf("%v/v1/users/%v", baseURL, url.QueryEscape(*otherUser))

	c := &http.Client{}
	if *debug {
		ct := httpdebug.New(httpdebug.WithTransport(c.Transport))
		c = ct.Client()
	}

	req, err := http.NewRequest("GET", url, nil)
	must(err)

	jwt, err := common.GenUserJWT(*thisUser, *thisXID, privateKey)
	must(err)

	// debug
	parts := strings.Split(jwt, ".")
	alg, err := base64.RawStdEncoding.DecodeString(parts[0])
	must(err)
	log.Printf("alg:\n%s", alg)
	payload, err := base64.RawStdEncoding.DecodeString(parts[1])
	must(err)
	log.Printf("payload:\n%s", payload)

	// TODO: put back the "Bearer " prefix.
	// req.Header.Set("Authorization", fmt.Sprintf("Bearer %v", jwt))
	req.Header.Set("Authorization", jwt)
	req.Header.Set("Accept", "application/json")

	resp, err := c.Do(req)
	must(err)
	defer resp.Body.Close()

	buf, err := io.ReadAll(resp.Body)
	must(err)

	fmt.Printf("response (status code=%v):\n%s\n", resp.StatusCode, buf)

	log.Printf("Done.")
}

func must(err error) {
	if err != nil {
		log.Fatal(err)
	}
}
