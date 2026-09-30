import { randomUUID } from "node:crypto";
import { existsSync, readFileSync, writeFileSync } from "node:fs";
import { join } from "node:path";
import { Http } from "../http/http";
import { HttpCuis } from "./http-cuis";

export class CuisDeckFile {
  static inFolder(folder: string) {
    return new CuisDeckFile(join(folder, ".cuisdeck.json"));
  }

  private constructor(private path: string) {
  }

  cuis(http: Http) {
    if (!existsSync(this.path)) {
      writeFileSync(this.path, JSON.stringify({
        port: 2847,
        token: randomUUID(),
      }), { mode: 0o600 });
    }

    const { port, token } = JSON.parse(readFileSync(this.path, "utf8"));

    return new HttpCuis(port, token, http);
  }
}
