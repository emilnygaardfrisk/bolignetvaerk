import { Server, IncomingMessage, ServerResponse } from "http";
import { URL } from "url";
import * as path from "path";
import * as fs from "fs";
import { route } from "./api";

const port = 8000;
const rootDirectory = __dirname + "/public";

const server = new Server();
server.listen(port);
console.log("listening on port", port);

server.on("request", (request: IncomingMessage, response: ServerResponse) => {
  const url: URL = new URL(request.url, "http://localhost:8080/");
  const endpoint = url.pathname;

  if (endpoint === "/") {
    // redirect to index.html
    response.writeHead(308, { Location: "index.html" });
    response.end();
  } else if (endpoint.startsWith("/api/")) {
    // api endpoints
    const apiEndpoint = endpoint.substring(5);
    const res = route(apiEndpoint);
    response.setHeader("Content-type", "application/json");
    response.writeHead(200);
    response.end(res);
  } else {
    // files
    let filenameRelative = endpoint.substring(1).replace(/\.\.\//g, "");
    const filenameAbsolute = path.resolve(rootDirectory, filenameRelative);
    const mimeType = guessMimeType(filenameRelative);
    const stream = fs.createReadStream(filenameAbsolute);

    stream.once("readable", () => {
      response.setHeader("Content-Type", mimeType);
      response.writeHead(200);
      stream.pipe(response);
    });

    stream.on("error", (error) => {
      response.setHeader("Content-Type", "text/plain; charset=UTF-8");
      response.writeHead(404);
      response.end(error.message);
    });
  }
});

function guessMimeType(filename: string): string {
  switch (path.extname(filename)) {
    case ".html":
    case ".htm":
      return "text/html";
    case ".js":
      return "text/javascript";
    case ".css":
      return "text/css";
    case ".png":
      return "image/png";
    case ".txt":
      return "text/plain";
    default:
      return "application/octet-stream";
  }
}
