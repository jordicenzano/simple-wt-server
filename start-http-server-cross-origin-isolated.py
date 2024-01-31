#!/usr/bin/env python3

# Copyright (c) Meta Platforms, Inc. and affiliates.
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.

from http.server import HTTPServer, BaseHTTPRequestHandler, SimpleHTTPRequestHandler
import ssl

class CORSRequestHandler (SimpleHTTPRequestHandler):
    def end_headers (self):
        self.send_header('Access-Control-Allow-Origin', '*')
        self.send_header('Cross-Origin-Opener-Policy', 'same-origin')
        self.send_header('Cross-Origin-Embedder-Policy', 'require-corp')
        SimpleHTTPRequestHandler.end_headers(self)

httpd = HTTPServer(('localhost', 4443), CORSRequestHandler)

httpd.socket = ssl.wrap_socket (httpd.socket, 
        keyfile="/Users/jcenzano/.ssh/localhost-key.pem", 
        certfile='/Users/jcenzano/.ssh/localhost.pem', server_side=True)

httpd.serve_forever()