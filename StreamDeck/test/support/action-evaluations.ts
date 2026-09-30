import { BrowserAction } from "../../src/actions/browser";
import { ChangeSorterAction } from "../../src/actions/change-sorter";
import { DecreaseGuiSizeAction } from "../../src/actions/decrease-gui-size";
import { FullScreenOffAction } from "../../src/actions/full-screen-off";
import { FullScreenOnAction } from "../../src/actions/full-screen-on";
import { IncreaseGuiSizeAction } from "../../src/actions/increase-gui-size";
import { InstalledPackagesAction } from "../../src/actions/installed-packages";
import { MessageNamesAction } from "../../src/actions/message-names";
import { ProcessBrowserAction } from "../../src/actions/process-browser";
import { QuitWithoutSavingAction } from "../../src/actions/quit-without-saving";
import { SaveImageAction } from "../../src/actions/save-image";
import { SaveImageAndQuitAction } from "../../src/actions/save-image-and-quit";
import { SaveImageAsAction } from "../../src/actions/save-image-as";
import { SetCodeAuthorAction } from "../../src/actions/set-code-author";
import { TestRunnerAction } from "../../src/actions/test-runner";
import { TextEditorAction } from "../../src/actions/text-editor";
import { TranscriptAction } from "../../src/actions/transcript";
import { WorkspaceAction } from "../../src/actions/workspace";

// The @action decorator answers an anonymous subclass, so the name is taken from the decorated class.
export const actionEvaluations = [
  {
    actionClass: BrowserAction,
    source: "Smalltalk browse",
  },
  {
    actionClass: WorkspaceAction,
    source: "Workspace open",
  },
  {
    actionClass: TextEditorAction,
    source: "TextEditor open",
  },
  {
    actionClass: MessageNamesAction,
    source: "MessageNames open",
  },
  {
    actionClass: TranscriptAction,
    source: "Transcript open",
  },
  {
    actionClass: TestRunnerAction,
    source: "TestRunner open",
  },
  {
    actionClass: ProcessBrowserAction,
    source: "ProcessBrowser open",
  },
  {
    actionClass: ChangeSorterAction,
    source: "ChangeSorter open",
  },
  {
    actionClass: InstalledPackagesAction,
    source: "CodePackageList open",
  },
  {
    actionClass: IncreaseGuiSizeAction,
    source: "Theme setDefaultFontSize: (FontFamily defaultPointSize + 5 min: 40)",
  },
  {
    actionClass: DecreaseGuiSizeAction,
    source: "Theme setDefaultFontSize: (FontFamily defaultPointSize - 5 max: 6)",
  },
  {
    actionClass: FullScreenOnAction,
    source: "Display fullScreenMode: true",
  },
  {
    actionClass: FullScreenOffAction,
    source: "Display fullScreenMode: false",
  },
  {
    actionClass: SetCodeAuthorAction,
    source: "Utilities setAuthor",
  },
  {
    actionClass: SaveImageAction,
    source: "Smalltalk saveImage",
  },
  {
    actionClass: SaveImageAsAction,
    source: "Smalltalk saveAs",
  },
  {
    actionClass: SaveImageAndQuitAction,
    source: "Smalltalk saveAndQuit",
  },
  {
    actionClass: QuitWithoutSavingAction,
    source: "TheWorldMenu quit",
  },
].map(evaluation => ({
  ...evaluation,
  name: Object.getPrototypeOf(evaluation.actionClass).name,
}));
