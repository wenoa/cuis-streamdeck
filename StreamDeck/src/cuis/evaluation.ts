import { KeyDownEvent } from "@elgato/streamdeck";

export interface Evaluation {
  showOn(key: KeyDownEvent["action"]): Promise<void>;
}

export class SuccessfulEvaluation implements Evaluation {
  async showOn() {
  }
}

export class FailedEvaluation implements Evaluation {
  async showOn(key: KeyDownEvent["action"]) {
    await key.showAlert();
  }
}
