import { action, KeyDownEvent, SingletonAction } from "@elgato/streamdeck";
import { Cuis } from "../cuis/cuis";

@action({ UUID: "studio.wenoa.cuis.save-image" })
export class SaveImageAction extends SingletonAction {
  constructor(private cuis: Cuis) {
    super();
  }

  override async onKeyDown({ action }: KeyDownEvent) {
    const evaluation = await this.cuis.evaluate("Smalltalk saveImage");

    await evaluation.showOn(action);
  }
}
