package common

import (
	"crypto/hmac"
	"crypto/sha256"
	"encoding/base64"
)

// GenHMACHash generates a SHA256 has of the provided message using
// the provided secret.
func GenHMACHash(message string, clientSecret string) string {
	h := hmac.New(sha256.New, []byte(clientSecret))
	h.Write([]byte(message))
	buf := h.Sum(nil)
	return base64.URLEncoding.EncodeToString(buf)
}
