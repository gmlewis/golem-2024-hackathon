// register-new-user registers a new user using the HMAC-protected
// API endpoint. It requires enviroment variables to be set.
// See README.md for details.
//
// Usage:
//
//	source .env.development.local
//	go run cmd/register-new-user/main.go ...
package main

import (
	"bytes"
	"encoding/json"
	"flag"
	"fmt"
	"io"
	"log"
	"net/http"
	"time"

	"github.com/gmlewis/go-httpdebug/httpdebug"
	"github.com/gmlewis/golem-2024-hackathon/common"
	"github.com/gmlewis/golem-2024-hackathon/xids"
)

const (
	baseURLEnvVar      = "GOLEM_2024_HACKATHON_BASE_URL"
	clientIDEnvVar     = "GOLEM_2024_HACKATHON_CLIENT_ID"
	clientSecretEnvVar = "GOLEM_2024_HACKATHON_CLIENT_SECRET"
)

var (
	debug        = flag.Bool("debug", false, "Enable debug messages")
	userHandle   = flag.String("handle", "", "User handle to create")
	userPassword = flag.String("password", "", "User password to create")
)

func main() {
	flag.Parse()

	baseURL := common.MustGetenv(baseURLEnvVar)
	clientID := common.MustGetenv(clientIDEnvVar)
	clientSecret := common.MustGetenv(clientSecretEnvVar)

	userXID, err := xids.New("User")
	must(err)

	url := fmt.Sprintf("%v/v1/register-new-user", baseURL)
	timestampMillis := time.Now().UnixMilli()
	messageToHash := fmt.Sprintf("%v-%v-%v-%v-%v", *userHandle, *userPassword, userXID, clientID, timestampMillis)
	hmacHash := common.GenHMACHash(messageToHash, clientSecret)

	req := RegisterNewUser{
		UserHandle:      *userHandle,
		UserPassword:    *userPassword,
		UserXID:         userXID,
		ClientID:        clientID,
		TimestampMillis: uint64(timestampMillis),
		HMACHash:        hmacHash,
	}

	body, err := json.Marshal(req)
	must(err)

	c := &http.Client{}
	if *debug {
		ct := httpdebug.New(httpdebug.WithTransport(c.Transport))
		c = ct.Client()
	}

	resp, err := c.Post(url, "application/json", bytes.NewReader(body))
	must(err)
	defer resp.Body.Close()

	buf, err := io.ReadAll(resp.Body)
	must(err)

	fmt.Printf("response (status code=%v):\n%s\n", resp.StatusCode, buf)

	log.Printf("Done.")
}

type RegisterNewUser struct {
	UserHandle      string `json:"user_handle"`
	UserPassword    string `json:"user_password"`
	UserXID         string `json:"user_xid"`
	ClientID        string `json:"client_id"`
	TimestampMillis uint64 `json:"timestamp_millis"`
	HMACHash        string `json:"hmac_hash"`
}

func must(err error) {
	if err != nil {
		log.Fatal(err)
	}
}
