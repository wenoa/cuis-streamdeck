import { action, KeyDownEvent, SingletonAction } from "@elgato/streamdeck";
import { Cuis } from "../model/cuis";

@action({ UUID: "studio.wenoa.cuis.save-image-as" })
export class SaveImageAsAction extends SingletonAction {
  constructor(private cuis: Cuis) {
    super();
  }

  override async onKeyDown({ action }: KeyDownEvent) {
    const evaluation = await this.cuis.evaluate("Smalltalk saveAs");

    await evaluation.showOn(action);
  }
}
