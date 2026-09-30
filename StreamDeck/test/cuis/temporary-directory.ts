import { existsSync, mkdtempSync, readFileSync, rmSync, statSync, writeFileSync } from "node:fs";
import { tmpdir } from "node:os";
import { join } from "node:path";

export class TemporaryDirectory {
  readonly path = mkdtempSync(join(tmpdir(), "cuisdeck-"));

  private settingsFile() {
    return join(this.path, ".cuisdeck.json");
  }

  storeSettings(port: number, token: string) {
    writeFileSync(this.settingsFile(), JSON.stringify({
      port,
      token,
    }));
  }

  storedPort() {
    return this.storedSettings().port;
  }

  storedToken() {
    return this.storedSettings().token;
  }

  settingsFilePermissions() {
    return (statSync(this.settingsFile()).mode & 0o777).toString(8);
  }

  remove() {
    rmSync(this.path, {
      recursive: true,
      force: true,
    });
  }

  private storedSettings() {
    return {
      port: 0,
      token: "",
      ...existsSync(this.settingsFile()) ? JSON.parse(readFileSync(this.settingsFile(), "utf8")) : {},
    };
  }
}
