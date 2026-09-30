// Configuration point: it only wires the real collaborators, so no test exercises it.
/* v8 ignore file -- @preserve */
import streamDeck from "@elgato/streamdeck";
import { homedir } from "node:os";
import { CuisActions } from "./actions/cuis-actions";
import { CuisDeckFile } from "./cuis/cuis-deck-file";
import { SystemHttp } from "./http/system-http";

const cuis = CuisDeckFile.inFolder(homedir()).cuis(new SystemHttp());

new CuisActions(cuis).forEach(action => streamDeck.actions.registerAction(action));

await streamDeck.connect();
