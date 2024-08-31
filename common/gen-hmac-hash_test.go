package common

import "testing"

func TestGenHMACHash(t *testing.T) {
	clientSecret := "key"
	data := "message-to-be-authenticated"
	got := GenHMACHash(data, clientSecret)
	want := "zdsNsj9GnIvwcrIf2DcUm9as6at3HM7vFMnlF8yTKC4="
	if got != want {
		t.Errorf("GenHMACHash = '%v' want '%v", got, want)
	}
}
