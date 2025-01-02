import os
import sys
import http.server

class CustomHTTPRequestHandler(http.server.SimpleHTTPRequestHandler):
    def do_GET(self):
        if self.path == '/':
            self.path = '/huts.xml'
        return super().do_GET()


def render_html(xml_file):
    if not os.path.exists(xml_file):
        print(f"File {xml_file} does not exist.")
        exit(1)
    xml_filename = xml_file.split(".")[0]
    if not os.path.exists(f"{xml_filename}.xsl"):
        print(f"File {xml_filename}.xsl does not exist.")
        exit(1)
        
    print(f"Rendering {xml_file} to {xml_filename}.html...")
    os.system(f"xsltproc {xml_filename}.xsl {xml_file} > {xml_filename}.html")
    print("Done.")
    return f"{xml_filename}.html"


def html_to_pdf(html_file):
    if not os.path.exists(html_file):
        print(f"File {html_file} does not exist.")
        exit(1)
    pdf_file = html_file.split(".")[0] + ".pdf"
    print(f"Rendering {html_file} to {pdf_file}...")
    os.system(f"wkhtmltopdf --encoding utf-8 --enable-local-file-access {html_file} {pdf_file}")
    print("Done.")
    return pdf_file


def print_usage():
    print("Usage: python render.py <serve | render>")
    exit(1)


if __name__ == "__main__":
    if len(sys.argv) < 2:
        print_usage()
    if sys.argv[1] == "serve":
        print("Starting http server so rendering xsl is possible on every browser. To exit Ctr + C...")
        print("Go to http://localhost:8000.")
        http.server.test(HandlerClass=CustomHTTPRequestHandler, port=8000, bind="localhost")
    elif sys.argv[1] == "render":
        if not len(sys.argv) == 4:
            print_usage()
        xml_file = sys.argv[3]

        if sys.argv[2] == "html":
            render_html(xml_file)
        elif sys.argv[2] == "pdf":
            html_to_pdf(render_html(xml_file))
        else:
            print_usage()

    else:
        print_usage()
