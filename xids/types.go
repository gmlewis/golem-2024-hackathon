package xids

import (
	"fmt"

	"github.com/rs/xid"
)

type tweet struct{}

func (u tweet) Prefix() string { return "tweet" }

type user struct{}

func (u user) Prefix() string { return "user" }

type resourceType interface{ Prefix() string }

func new[T resourceType]() id[T] { return id[T](xid.New()) }

type id[T resourceType] xid.ID

// String generates a string representation (suitable for transmission
// over the wire) of the golbally-unique identifier.
func (idt id[T]) String() string {
	var resType T // default value

	return fmt.Sprintf("%s_%s", resType.Prefix(), xid.ID(idt).String())
}
