import { Evaluation } from "./evaluation";

export interface Cuis {
  evaluate(source: string): Promise<Evaluation>;
}
