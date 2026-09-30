import { action, KeyDownEvent, SingletonAction } from "@elgato/streamdeck";
import { Cuis } from "../cuis/cuis";

@action({ UUID: "studio.wenoa.cuis.process-browser" })
export class ProcessBrowserAction extends SingletonAction {
  constructor(private cuis: Cuis) {
    super();
  }

  override async onKeyDown({ action }: KeyDownEvent) {
    const evaluation = await this.cuis.evaluate("ProcessBrowser open");

    await evaluation.showOn(action);
  }
}
