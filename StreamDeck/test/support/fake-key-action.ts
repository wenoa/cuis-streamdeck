import { KeyAction, KeyDownEvent } from "@elgato/streamdeck";

export class FakeKeyAction implements Partial<KeyAction> {
  private lastShownFeedback = "";

  async showAlert() {
    await new Promise(resolve => setTimeout(resolve));
    this.lastShownFeedback = "alert";
  }

  lastFeedback() {
    return this.lastShownFeedback;
  }

  pressed() {
    return { action: this } as unknown as KeyDownEvent;
  }
}
