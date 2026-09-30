import { Cuis } from "../../src/model/cuis";
import { FailedEvaluation } from "../../src/model/evaluation";

export class UnreachableCuis implements Cuis {
  async evaluate() {
    return new FailedEvaluation();
  }
}
