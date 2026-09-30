import { Cuis } from "./cuis";
import { FailedEvaluation, SuccessfulEvaluation } from "./evaluation";
import { Http } from "../http/http";

export class HttpCuis implements Cuis {
  constructor(private port: number, private token: string, private http: Http) {
  }

  evaluate(source: string) {
    return this.http
      .send(`http://127.0.0.1:${this.port}/evaluations`, {
        method: "POST",
        body: source,
        headers: { Authorization: `Bearer ${this.token}` },
      })
      .then(() => new SuccessfulEvaluation(), () => new FailedEvaluation());
  }
}
