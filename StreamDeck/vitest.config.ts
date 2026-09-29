import swc from "@rollup/plugin-swc";
import { withFilter } from "vite";
import { defineConfig } from "vitest/config";

export default defineConfig({
  plugins: [
    // Oxc doesn't lower standard decorators yet, and the actions are declared with @action.
    withFilter(
      swc({
        swc: {
          jsc: {
            parser: {
              decorators: true,
              decoratorsBeforeExport: true,
            },
            transform: {
              decoratorVersion: "2023-11",
            },
          },
        },
      }),
      { transform: { code: "@" } },
    ),
  ],
  test: {
    globals: true,
    environment: "node",
    passWithNoTests: true,
    coverage: {
      provider: "v8",
      reporter: ["text", "json", "html"],
      exclude: [
        "node_modules/",
        "test/",
        "**/*.config.*",
        "studio.wenoa.cuis.sdPlugin/",
      ],
      thresholds: {
        lines: 100,
        functions: 100,
        branches: 100,
        statements: 100,
      },
    },
  },
});
