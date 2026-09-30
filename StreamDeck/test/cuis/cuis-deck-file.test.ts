import { afterEach, beforeEach, describe, expect, it } from "vitest";
import { WorkspaceAction } from "../../src/actions/workspace";
import { CuisDeckFile } from "../../src/cuis/cuis-deck-file";
import { FakeHttp } from "../http/fake-http";
import { FakeKeyAction } from "../stream-deck/fake-key-action";
import { TemporaryDirectory } from "./temporary-directory";

describe("CuisDeckFile", () => {
  let directory: TemporaryDirectory;

  beforeEach(() => {
    directory = new TemporaryDirectory();
  });

  afterEach(() => {
    directory.remove();
  });

  it("creates a missing file with the default port, readable only by its owner", () => {
    CuisDeckFile.inFolder(directory.path).cuis(new FakeHttp());

    expect(directory.storedPort()).toBe(2847);
    expect(directory.settingsFilePermissions()).toBe("600");
  });

  it("creates each file with its own token", () => {
    const anotherDirectory = new TemporaryDirectory();
    CuisDeckFile.inFolder(directory.path).cuis(new FakeHttp());
    CuisDeckFile.inFolder(anotherDirectory.path).cuis(new FakeHttp());
    const anotherToken = anotherDirectory.storedToken();
    anotherDirectory.remove();

    expect(directory.storedToken()).not.toBe(anotherToken);
  });

  it("reaches Cuis at the port and with the token of an existing file", async () => {
    directory.storeSettings(50001, "file-secret");
    const http = new FakeHttp();
    const workspace = new WorkspaceAction(CuisDeckFile.inFolder(directory.path).cuis(http));

    await workspace.onKeyDown(new FakeKeyAction().pressed());

    expect(http.lastRequest()).toMatchObject({
      url: "http://127.0.0.1:50001/evaluations",
      options: { headers: { Authorization: "Bearer file-secret" } },
    });
  });
});
