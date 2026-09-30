import { action, KeyDownEvent, SingletonAction } from "@elgato/streamdeck";
import { Cuis } from "../model/cuis";

@action({ UUID: "studio.wenoa.cuis.quit-without-saving" })
export class QuitWithoutSavingAction extends SingletonAction {
  constructor(private cuis: Cuis) {
    super();
  }

  override async onKeyDown({ action }: KeyDownEvent) {
    const evaluation = await this.cuis.evaluate("TheWorldMenu quit");

    await evaluation.showOn(action);
  }
}
