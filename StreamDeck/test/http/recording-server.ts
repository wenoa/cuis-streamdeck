import { createServer } from "node:http";
import { AddressInfo } from "node:net";

export class RecordingServer {
  private lastReceived = {};
  private server = createServer(async (request, response) => {
    let body = "";
    for await (const chunk of request) {
      body += chunk;
    }
    this.lastReceived = {
      method: request.method,
      url: request.url,
      body,
      authorization: request.headers.authorization,
    };
    response.end();
  });

  start() {
    return new Promise<void>(resolve => this.server.listen(0, "127.0.0.1", resolve));
  }

  url(path: string) {
    return `http://127.0.0.1:${(this.server.address() as AddressInfo).port}${path}`;
  }

  lastRequest() {
    return this.lastReceived;
  }

  stop() {
    this.server.closeAllConnections();

    return new Promise(resolve => this.server.close(resolve));
  }
}
