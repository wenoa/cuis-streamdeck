import { action, KeyDownEvent, SingletonAction } from "@elgato/streamdeck";
import { Cuis } from "../cuis/cuis";

type EvaluateSettings = {
  source?: string;
};

@action({ UUID: "studio.wenoa.cuis.evaluate" })
export class EvaluateAction extends SingletonAction<EvaluateSettings> {
  constructor(private cuis: Cuis) {
    super();
  }

  override async onKeyDown({ action, payload }: KeyDownEvent<EvaluateSettings>) {
    const { source = "" } = payload.settings;

    if (source === "") {
      await action.showAlert();
    } else {
      const evaluation = await this.cuis.evaluate(source);

      await evaluation.showOn(action);
    }
  }
}
