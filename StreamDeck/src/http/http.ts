export interface Http {
  send(url: string, options: RequestInit): Promise<unknown>;
}
