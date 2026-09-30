import { action, KeyDownEvent, SingletonAction } from "@elgato/streamdeck";
import { Cuis } from "../model/cuis";

@action({ UUID: "studio.wenoa.cuis.change-sorter" })
export class ChangeSorterAction extends SingletonAction {
  constructor(private cuis: Cuis) {
    super();
  }

  override async onKeyDown({ action }: KeyDownEvent) {
    const evaluation = await this.cuis.evaluate("ChangeSorter open");

    await evaluation.showOn(action);
  }
}
