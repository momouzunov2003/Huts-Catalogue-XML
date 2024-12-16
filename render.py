import os
import http.server

class CustomHTTPRequestHandler(http.server.SimpleHTTPRequestHandler):
    def do_GET(self):
        if self.path == '/':
            self.path = '/huts.xml'
        return super().do_GET()


if __name__ == "__main__":
    print("Starting http server so rendering xsl is possible on every browser. To exit Ctr + C...")
    print("Go to http://localhost:8000.")
    http.server.test(HandlerClass=CustomHTTPRequestHandler, port=8000, bind="localhost")
