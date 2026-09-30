import { describe, expect, it } from "vitest";
import { actionEvaluations } from "./support/action-evaluations";
import { FakeCuis } from "./support/fake-cuis";
import { FakeKeyAction } from "./support/fake-key-action";
import { UnreachableCuis } from "./support/unreachable-cuis";

describe.each(actionEvaluations)("$name", ({ actionClass, source }) => {
  it(`pressing it asks Cuis to evaluate ${source}`, async () => {
    const cuis = new FakeCuis();
    const action = new actionClass(cuis);

    await action.onKeyDown(new FakeKeyAction().pressed());

    expect(cuis.lastEvaluation()).toBe(source);
  });

  it("pressing it shows an alert when Cuis is unreachable", async () => {
    const key = new FakeKeyAction();
    const action = new actionClass(new UnreachableCuis());

    await action.onKeyDown(key.pressed());

    expect(key.lastFeedback()).toBe("alert");
  });

  it("pressing it doesn't show an alert when Cuis evaluates it", async () => {
    const key = new FakeKeyAction();
    const action = new actionClass(new FakeCuis());

    await action.onKeyDown(key.pressed());

    expect(key.lastFeedback()).toBe("");
  });
});
