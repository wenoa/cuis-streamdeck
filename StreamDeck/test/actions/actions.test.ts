import { describe, expect, it } from "vitest";
import { FakeCuis } from "../cuis/fake-cuis";
import { UnreachableCuis } from "../cuis/unreachable-cuis";
import { FakeKeyAction } from "../stream-deck/fake-key-action";
import { actionEvaluations } from "./action-evaluations";

describe.each(actionEvaluations)("$name", ({ actionClass, settings, source }) => {
  it(`pressing it asks Cuis to evaluate ${source}`, async () => {
    const cuis = new FakeCuis();
    const action = new actionClass(cuis);

    await action.onKeyDown(new FakeKeyAction(settings).pressed());

    expect(cuis.lastEvaluation()).toBe(source);
  });

  it("pressing it shows an alert when Cuis is unreachable", async () => {
    const key = new FakeKeyAction(settings);
    const action = new actionClass(new UnreachableCuis());

    await action.onKeyDown(key.pressed());

    expect(key.lastFeedback()).toBe("alert");
  });

  it("pressing it doesn't show an alert when Cuis evaluates it", async () => {
    const key = new FakeKeyAction(settings);
    const action = new actionClass(new FakeCuis());

    await action.onKeyDown(key.pressed());

    expect(key.lastFeedback()).toBe("");
  });
});
