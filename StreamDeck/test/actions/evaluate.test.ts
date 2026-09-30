import { describe, expect, it } from "vitest";
import { EvaluateAction } from "../../src/actions/evaluate";
import { FakeCuis } from "../cuis/fake-cuis";
import { FakeKeyAction } from "../stream-deck/fake-key-action";

describe("EvaluateAction", () => {
  it("pressing each key asks Cuis to evaluate the code of that key", async () => {
    const cuis = new FakeCuis();
    const evaluate = new EvaluateAction(cuis);
    await evaluate.onKeyDown(new FakeKeyAction({ source: "3 + 4" }).pressed());

    await evaluate.onKeyDown(new FakeKeyAction({ source: "Smalltalk version" }).pressed());

    expect(cuis.lastEvaluation()).toBe("Smalltalk version");
  });

  it("pressing a key without code shows an alert", async () => {
    const key = new FakeKeyAction({});
    const evaluate = new EvaluateAction(new FakeCuis());

    await evaluate.onKeyDown(key.pressed());

    expect(key.lastFeedback()).toBe("alert");
  });

  it("pressing a key whose code was erased shows an alert", async () => {
    const key = new FakeKeyAction({ source: "" });
    const evaluate = new EvaluateAction(new FakeCuis());

    await evaluate.onKeyDown(key.pressed());

    expect(key.lastFeedback()).toBe("alert");
  });
});
