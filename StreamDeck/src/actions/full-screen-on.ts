import { action, KeyDownEvent, SingletonAction } from "@elgato/streamdeck";
import { Cuis } from "../model/cuis";

@action({ UUID: "studio.wenoa.cuis.full-screen-on" })
export class FullScreenOnAction extends SingletonAction {
  constructor(private cuis: Cuis) {
    super();
  }

  override async onKeyDown({ action }: KeyDownEvent) {
    const evaluation = await this.cuis.evaluate("Display fullScreenMode: true");

    await evaluation.showOn(action);
  }
}
