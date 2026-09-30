import { Http } from "./http";

export class SystemHttp implements Http {
  send(url: string, options: RequestInit) {
    return fetch(url, options);
  }
}
