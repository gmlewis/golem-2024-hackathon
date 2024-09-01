// Package xids creates globally-unique and strongly-typed
// identifiers that are chronologically sortable and have
// many other excellent qualities.
// https://encore.dev/blog/go-1.18-generic-identifiers
package xids

import (
	"fmt"
	"strings"
	"time"

	"github.com/rs/xid"
)

// New returns a globally-unique XID for the given `typeName`.
func New(typeName string) (string, error) {
	switch typeName {
	case "Tweet":
		return NewTweet(), nil
	case "User":
		return NewUser(), nil
	default:
		return "", fmt.Errorf("xids.New: unknown typeName %q", typeName)
	}
}

// NewTweet generates a globally-unique XID for a Tweet.
func NewTweet() string { return new[tweet]().String() }

// NewUser generates a globally-unique XID for a User.
func NewUser() string { return new[user]().String() }

// Time returns the time (with 1-second precision) when this XID was created.
func Time(xid string) (time.Time, error) {
	v, err := parse(xid)
	if err != nil {
		return time.Time{}, err
	}

	return v.Time(), nil
}

func parse(id string) (xid.ID, error) {
	parts := strings.Split(id, "_")
	if len(parts) != 2 {
		return xid.ID{}, fmt.Errorf("bad xid: %q", id)
	}

	v, err := xid.FromString(parts[1])
	if err != nil {
		return xid.ID{}, err
	}

	return v, nil
}
