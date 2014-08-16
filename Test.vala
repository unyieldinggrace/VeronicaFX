
namespace Veronica {

	public class Test : GLib.Object {
		
		private scgi.Server server;
		private uint16 port = 4000;
		private int max_threads = 8;
		
		private const string RESPONSE_STATUS_OK = "200 OK";
		private const string RESPONSE_STATUS_ERROR = "500 Internal Server Error";
		private const string RESPONSE_STATUS_NOT_FOUND = "404 Resource Not Found";
		
		private const string CONTENT_TYPE_TEXT_HTML = "text/html";
		private const string CONTENT_TYPE_TEXT_JSON = "text/json";
		private const string CONTENT_TYPE_TEXT_PLAIN = "text/plain";
		
		public static void main() {
			Test app = new Test();
			app.run();
		}
		
		public void run() {
			this.server = new scgi.Server(this.port, this.max_threads, this.handleRequest);
		}
		
		private void handleRequest(scgi.Request request) {
			var response = this.getResponse(request);
			this.writeResponseHeaders(request, Test.RESPONSE_STATUS_OK, Test.CONTENT_TYPE_TEXT_PLAIN, response.length);
			
			stdout.printf(response);
			request.output.write(response.data);
		}
		
		private string getResponse(scgi.Request request) {
			string response = "Hello from VeronicaFX :)\n\n";
			
			var keys = request.params.get_keys();
			
			foreach (var key in keys) {
				string line = "Key: " + key + " Value: " + request.params[key] + "\n";
				response += line;
			}
			
			return response;
		}
		
		private void writeResponseHeaders(scgi.Request request, string status_code, string content_type, int content_length) {
			string headers = "Status: " + status_code + "\n"
				+ "Content-Type: " + content_type + "\n"
				+ "Content-Length: " + content_length.to_string() + "\n\n";
			
			stdout.printf(headers);
			request.output.write(headers.data);
		}

	}

}
