import { action, KeyDownEvent, SingletonAction } from "@elgato/streamdeck";
import { Cuis } from "../cuis/cuis";

@action({ UUID: "studio.wenoa.cuis.decrease-gui-size" })
export class DecreaseGuiSizeAction extends SingletonAction {
  constructor(private cuis: Cuis) {
    super();
  }

  override async onKeyDown({ action }: KeyDownEvent) {
    const evaluation = await this.cuis.evaluate("Theme setDefaultFontSize: (FontFamily defaultPointSize - 5 max: 6)");

    await evaluation.showOn(action);
  }
}
