import { describe, expect, it } from "vitest";
import { BrowserAction } from "../../src/actions/browser";
import { WorkspaceAction } from "../../src/actions/workspace";
import { HttpCuis } from "../../src/cuis/http-cuis";
import { FakeHttp } from "../http/fake-http";
import { UnreachableHttp } from "../http/unreachable-http";
import { FakeKeyAction } from "../stream-deck/fake-key-action";

describe("HttpCuis", () => {
  it("pressing a key shows an alert when Cuis is not listening", async () => {
    const key = new FakeKeyAction();
    const workspace = new WorkspaceAction(new HttpCuis(2847, "secret", new UnreachableHttp()));

    await workspace.onKeyDown(key.pressed());

    expect(key.lastFeedback()).toBe("alert");
  });

  it("pressing a key doesn't show an alert when Cuis answers", async () => {
    const key = new FakeKeyAction();
    const workspace = new WorkspaceAction(new HttpCuis(2847, "secret", new FakeHttp()));

    await workspace.onKeyDown(key.pressed());

    expect(key.lastFeedback()).toBe("");
  });

  it("pressing a key sends its source to Cuis", async () => {
    const http = new FakeHttp();
    const workspace = new WorkspaceAction(new HttpCuis(2847, "secret", http));

    await workspace.onKeyDown(new FakeKeyAction().pressed());

    expect(http.lastRequest()).toEqual({
      url: "http://127.0.0.1:2847/evaluations",
      options: {
        method: "POST",
        body: "Workspace open",
        headers: { Authorization: "Bearer secret" },
      },
    });
  });

  it("pressing another key sends its own source to Cuis", async () => {
    const http = new FakeHttp();
    const browser = new BrowserAction(new HttpCuis(2847, "secret", http));

    await browser.onKeyDown(new FakeKeyAction().pressed());

    expect(http.lastRequest()).toMatchObject({ options: { body: "Smalltalk browse" } });
  });
});
