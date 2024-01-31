package main

import (
	"context"
	"flag"
	"fmt"
	"log"

	"github.com/quic-go/webtransport-go"
)

func main() {
	connectAddr := flag.String("listen_addr", "", "Server listen port (example: \"localhost:4433\")")
	flag.Parse()

	ctx, _ := context.WithCancel(context.Background())

	var d webtransport.Dialer
	rsp, conn, err := d.Dial(ctx, *connectAddr, nil)
	// err is only nil if rsp.StatusCode is a 2xx
	// Handle the connection. Here goes the application logic.

	if err != nil {
		log.Printf(fmt.Sprintf("Error connecting WT to: %s. Err %v", *connectAddr, err))
		return
	}
	log.Printf("Connected WT, rsp: %v, conn: %v", rsp, conn)
}
