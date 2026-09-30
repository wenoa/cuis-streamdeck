import { Cuis } from "../../src/model/cuis";
import { SuccessfulEvaluation } from "../../src/model/evaluation";

export class FakeCuis implements Cuis {
  private lastEvaluatedSource = "";

  async evaluate(source: string) {
    this.lastEvaluatedSource = source;

    return new SuccessfulEvaluation();
  }

  lastEvaluation() {
    return this.lastEvaluatedSource;
  }
}
