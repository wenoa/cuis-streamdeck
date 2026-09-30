import { action, KeyDownEvent, SingletonAction } from "@elgato/streamdeck";
import { Cuis } from "../model/cuis";

@action({ UUID: "studio.wenoa.cuis.increase-gui-size" })
export class IncreaseGuiSizeAction extends SingletonAction {
  constructor(private cuis: Cuis) {
    super();
  }

  override async onKeyDown({ action }: KeyDownEvent) {
    const evaluation = await this.cuis.evaluate("Theme setDefaultFontSize: (FontFamily defaultPointSize + 5 min: 40)");

    await evaluation.showOn(action);
  }
}
