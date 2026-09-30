import { Cuis } from "../../src/cuis/cuis";
import { FailedEvaluation } from "../../src/cuis/evaluation";

export class UnreachableCuis implements Cuis {
  async evaluate() {
    return new FailedEvaluation();
  }
}
