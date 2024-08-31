package common

import (
	"errors"
	"fmt"
	"strings"
	"time"

	"github.com/golang-jwt/jwt/v5"
)

const (
	jwtExpiration = time.Duration(4 * time.Hour)
)

// GenUserJWT generates a user JWT with the "username" and "xid" claims
// using the provided private key.
func GenUserJWT(userHandle, userXID, privateKeyStr string) (string, error) {
	if privateKeyStr == "" {
		return "", errors.New("missing privateKeyStr")
	}
	if !strings.HasSuffix(privateKeyStr, "\n") {
		privateKeyStr += "\n"
	}

	privateKey, err := jwt.ParseRSAPrivateKeyFromPEM([]byte(privateKeyStr))
	if err != nil {
		return "", fmt.Errorf("jwt.ParseRSAPrivateKeyFromPEM: %v", err)
	}

	// Create claims with multiple fields populated
	now := time.Now()
	claims := UserClaims{
		userHandle,
		jwt.RegisteredClaims{
			ExpiresAt: jwt.NewNumericDate(now.Add(jwtExpiration)),
			IssuedAt:  jwt.NewNumericDate(now),
			NotBefore: jwt.NewNumericDate(now),
			Issuer:    "gen-user-jwt",
			Subject:   userXID,
		},
	}

	token := jwt.NewWithClaims(jwt.SigningMethodRS256, claims)
	ss, err := token.SignedString(privateKey)
	if err != nil {
		return "", fmt.Errorf("token.SignedString: %v", err)
	}

	return ss, nil
}

// UserClaims represents claims for a JWT.
type UserClaims struct {
	UserHandle string `json:"user_handle"`
	jwt.RegisteredClaims
}
