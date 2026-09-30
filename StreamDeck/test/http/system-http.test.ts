import { afterEach, beforeEach, describe, expect, it } from "vitest";
import { SystemHttp } from "../../src/http/system-http";
import { RecordingServer } from "./recording-server";

describe("SystemHttp", () => {
  const request = {
    method: "POST",
    body: "Workspace open",
    headers: { Authorization: "Bearer secret" },
  };
  let server: RecordingServer;

  beforeEach(async () => {
    server = new RecordingServer();
    await server.start();
  });

  afterEach(async () => {
    await server.stop();
  });

  it("delivers the request to the server listening at the url", async () => {
    await new SystemHttp().send(server.url("/evaluations"), request);

    expect(server.lastRequest()).toEqual({
      method: "POST",
      url: "/evaluations",
      body: "Workspace open",
      authorization: "Bearer secret",
    });
  });

  it("fails when nobody is listening at the url", async () => {
    const url = server.url("/evaluations");
    await server.stop();

    await expect(new SystemHttp().send(url, request)).rejects.toThrow("fetch failed");
  });
});
