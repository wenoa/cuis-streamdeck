import { Cuis } from "../../src/cuis/cuis";
import { SuccessfulEvaluation } from "../../src/cuis/evaluation";

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
