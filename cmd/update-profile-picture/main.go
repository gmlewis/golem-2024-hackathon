// update-profile-picture updates a user's profile picture using the JWT-protected
// API endpoint. It requires enviroment variables to be set.
// See README.md for details.
//
// Usage:
//
//	source .env.development.local
//	go run cmd/update-profile-picture/main.go [-debug] -user 'user-1' -filename picture.jpg
package main

import (
	"bytes"
	"encoding/base64"
	"encoding/json"
	"flag"
	"fmt"
	"io"
	"log"
	"net/http"
	"net/url"
	"os"

	"github.com/gmlewis/go-httpdebug/httpdebug"
	"github.com/gmlewis/golem-2024-hackathon/common"
)

const (
	baseURLEnvVar    = "GOLEM_2024_HACKATHON_BASE_URL"
	privateKeyEnvVar = "GOLEM_2024_HACKATHON_PRIVATE_KEY"
)

var (
	debug    = flag.Bool("debug", false, "Enable debug messages")
	filename = flag.String("filename", "", "The JPEG filename to upload")
	thisUser = flag.String("user", "", "The user that is making the call")
	thisXID  = flag.String("xid", "", "The user's XID that is making the call")
)

func main() {
	flag.Parse()

	if *thisUser == "" {
		log.Fatalf("missing -user 'this-user-handle' flag")
	}
	if *thisXID == "" {
		log.Fatalf("missing -xid 'this-user-xid' flag")
	}
	if *filename == "" {
		log.Fatalf("missing -filename flag")
	}

	baseURL := common.MustGetenv(baseURLEnvVar)
	privateKey := common.MustGetenv(privateKeyEnvVar)

	url := fmt.Sprintf("%v/v1/users/%v/profile-picture", baseURL, url.QueryEscape(*thisUser))

	buf, err := os.ReadFile(*filename)
	must(err)
	b64 := base64.StdEncoding.EncodeToString(buf)

	c := &http.Client{}
	if *debug {
		ct := httpdebug.New(httpdebug.WithTransport(c.Transport))
		c = ct.Client()
	}

	body := PutBody{
		Base64ProfileJPG: b64,
	}
	buf, err = json.Marshal(body)
	must(err)

	req, err := http.NewRequest("PUT", url, bytes.NewReader(buf))
	must(err)

	jwt, err := common.GenUserJWT(*thisUser, *thisXID, privateKey)
	must(err)

	// TODO: put back the "Bearer " prefix.
	// req.Header.Set("Authorization", fmt.Sprintf("Bearer %v", jwt))
	req.Header.Set("Authorization", jwt)

	resp, err := c.Do(req)
	must(err)
	defer resp.Body.Close()

	buf, err = io.ReadAll(resp.Body)
	must(err)

	fmt.Printf("response (status code=%v):\n%s\n", resp.StatusCode, buf)

	log.Printf("Done.")
}

type PutBody struct {
	Base64ProfileJPG string `json:"base64_profile_jpg"`
}

func must(err error) {
	if err != nil {
		log.Fatal(err)
	}
}
