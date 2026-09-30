import { SingletonAction } from "@elgato/streamdeck";
import { Cuis } from "../cuis/cuis";
import { BrowserAction } from "./browser";
import { ChangeSorterAction } from "./change-sorter";
import { DecreaseGuiSizeAction } from "./decrease-gui-size";
import { EvaluateAction } from "./evaluate";
import { FullScreenOffAction } from "./full-screen-off";
import { FullScreenOnAction } from "./full-screen-on";
import { IncreaseGuiSizeAction } from "./increase-gui-size";
import { InstalledPackagesAction } from "./installed-packages";
import { MessageNamesAction } from "./message-names";
import { ProcessBrowserAction } from "./process-browser";
import { QuitWithoutSavingAction } from "./quit-without-saving";
import { SaveImageAction } from "./save-image";
import { SaveImageAndQuitAction } from "./save-image-and-quit";
import { SaveImageAsAction } from "./save-image-as";
import { SetCodeAuthorAction } from "./set-code-author";
import { TestRunnerAction } from "./test-runner";
import { TextEditorAction } from "./text-editor";
import { TranscriptAction } from "./transcript";
import { WorkspaceAction } from "./workspace";

export class CuisActions {
  constructor(private cuis: Cuis) {
  }

  forEach(closure: (action: SingletonAction) => void) {
    [
      new BrowserAction(this.cuis),
      new WorkspaceAction(this.cuis),
      new TextEditorAction(this.cuis),
      new MessageNamesAction(this.cuis),
      new TranscriptAction(this.cuis),
      new TestRunnerAction(this.cuis),
      new ProcessBrowserAction(this.cuis),
      new ChangeSorterAction(this.cuis),
      new InstalledPackagesAction(this.cuis),
      new IncreaseGuiSizeAction(this.cuis),
      new DecreaseGuiSizeAction(this.cuis),
      new FullScreenOnAction(this.cuis),
      new FullScreenOffAction(this.cuis),
      new SetCodeAuthorAction(this.cuis),
      new SaveImageAction(this.cuis),
      new SaveImageAsAction(this.cuis),
      new SaveImageAndQuitAction(this.cuis),
      new QuitWithoutSavingAction(this.cuis),
      new EvaluateAction(this.cuis),
    ].forEach(closure);
  }
}
