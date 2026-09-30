import { KeyAction } from "@elgato/streamdeck";

export interface Evaluation {
  showOn(key: KeyAction): Promise<void>;
}

export class SuccessfulEvaluation implements Evaluation {
  async showOn() {
  }
}

export class FailedEvaluation implements Evaluation {
  async showOn(key: KeyAction) {
    await key.showAlert();
  }
}
