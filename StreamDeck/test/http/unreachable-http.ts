import { Http } from "../../src/http/http";

export class UnreachableHttp implements Http {
  async send() {
    throw new Error("Nobody is listening");
  }
}
