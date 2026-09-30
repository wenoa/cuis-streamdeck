import { action, KeyDownEvent, SingletonAction } from "@elgato/streamdeck";
import { Cuis } from "../cuis/cuis";

@action({ UUID: "studio.wenoa.cuis.full-screen-off" })
export class FullScreenOffAction extends SingletonAction {
  constructor(private cuis: Cuis) {
    super();
  }

  override async onKeyDown({ action }: KeyDownEvent) {
    const evaluation = await this.cuis.evaluate("Display fullScreenMode: false");

    await evaluation.showOn(action);
  }
}
