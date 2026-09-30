import { KeyDownEvent } from "@elgato/streamdeck";

type KeySettings = KeyDownEvent["payload"]["settings"];

export class FakeKeyAction<TSettings extends KeySettings> implements Partial<KeyDownEvent<TSettings>["action"]> {
  private lastShownFeedback = "";

  constructor(private settings = {} as TSettings) {
  }

  async showAlert() {
    await new Promise(resolve => setTimeout(resolve));
    this.lastShownFeedback = "alert";
  }

  lastFeedback() {
    return this.lastShownFeedback;
  }

  pressed() {
    return {
      action: this,
      payload: { settings: this.settings },
    } as unknown as KeyDownEvent<TSettings>;
  }
}
