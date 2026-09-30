import { Http } from "../../src/http/http";

export class FakeHttp implements Http {
  private lastSent = {};

  async send(url: string, options: RequestInit) {
    this.lastSent = {
      url,
      options,
    };
  }

  lastRequest() {
    return this.lastSent;
  }
}
