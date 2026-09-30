import { readFileSync } from "node:fs";
import { describe, expect, it } from "vitest";
import { CuisActions } from "../../src/actions/cuis-actions";
import { FakeCuis } from "../cuis/fake-cuis";

describe("CuisActions", () => {
  it("has an action for every action of the manifest", () => {
    const manifest = JSON.parse(readFileSync(new URL("../../studio.wenoa.cuis.sdPlugin/manifest.json", import.meta.url), "utf8"));
    const manifestActionIds = manifest.Actions.map((action: { UUID: string }) => action.UUID);
    const actionIds: (string | undefined)[] = [];

    new CuisActions(new FakeCuis()).forEach(action => actionIds.push(action.manifestId));

    expect(actionIds.sort()).toEqual(manifestActionIds.sort());
  });
});
