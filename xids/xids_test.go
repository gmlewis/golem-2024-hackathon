package xids

import (
	"testing"
	"time"

	"github.com/google/go-cmp/cmp"
)

func TestTime(t *testing.T) {
	t.Parallel()
	tests := []struct {
		name    string
		xid     string
		want    time.Time
		wantErr bool
	}{
		{
			name:    "no xid",
			wantErr: true,
		},
		{
			name:    "bogus xid",
			xid:     "cr9fh2jfulevgfa3urhg",
			wantErr: true,
		},
		{
			name: "valid user xid",
			xid:  "user_cr9fh2jfulevgfa3urhg",
			want: time.Date(2024, 8, 31, 11, 3, 38, 0, time.UTC),
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			got, err := Time(tt.xid)
			if tt.wantErr {
				if err == nil {
					t.Fatal("Time error = nil, wantErr true")
				}
				return
			} else if err != nil {
				t.Fatalf("Time error = %v, want nil", err)
			}

			if !cmp.Equal(got, tt.want) {
				t.Errorf("Time = %v, want %v", got, tt.want)
			}
		})
	}
}
