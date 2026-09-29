import js from "@eslint/js";
import { defineConfig } from "eslint/config";
import tseslint from "typescript-eslint";

export default defineConfig([
  {
    ignores: [
      "node_modules/",
      "coverage/",
      "studio.wenoa.cuis.sdPlugin/",
      "*.config.*",
    ],
  },
  {
    files: ["src/**/*.ts", "test/**/*.ts"],

    extends: [
      js.configs.recommended,
      tseslint.configs.recommended,
    ],

    rules: {
      "@typescript-eslint/member-ordering": "off",
      "@typescript-eslint/no-explicit-any": "off",
      "@typescript-eslint/no-unused-expressions": "error",
      "@typescript-eslint/no-unused-vars": "error",
      "array-bracket-newline": ["error", "consistent"],
      "array-bracket-spacing": ["error", "never"],
      "array-element-newline": ["error", "consistent"],
      "arrow-body-style": "off",
      "arrow-parens": ["error", "as-needed"],

      "arrow-spacing": ["error", {
        before: true,
        after: true,
      }],

      "block-spacing": "error",
      "brace-style": ["error", "1tbs"],
      "comma-dangle": ["error", "always-multiline"],
      "comma-spacing": "error",
      "computed-property-spacing": "error",
      curly: ["error", "all"],
      "eol-last": ["error", "always"],

      indent: ["error", 2, {
        SwitchCase: 1,
      }],

      "key-spacing": "error",

      "keyword-spacing": ["error", {
        before: true,
        after: true,
      }],

      "lines-around-directive": ["error", "always"],

      "lines-between-class-members": ["error", {
        enforce: [{
          blankLine: "always",
          prev: "*",
          next: "method",
        }, {
          blankLine: "always",
          prev: "method",
          next: "*",
        }],
      }],

      "multiline-ternary": ["error", "never"],
      "new-parens": ["error", "always"],
      "no-extra-boolean-cast": "error",
      "no-extra-parens": "error",
      "no-floating-decimal": "error",
      "no-irregular-whitespace": "error",
      "no-multi-assign": "off",
      "no-multi-spaces": "error",
      "no-multi-str": "error",

      "no-multiple-empty-lines": ["error", {
        max: 1,
        maxBOF: 0,
        maxEOF: 0,
      }],

      "no-regex-spaces": "error",
      "no-spaced-func": "error",
      "no-trailing-spaces": "error",
      "no-unexpected-multiline": "error",
      "no-unused-expressions": "off",
      "no-unused-labels": "error",
      "no-unused-vars": "off",
      "no-whitespace-before-property": "error",

      "object-curly-newline": ["error", {
        ObjectExpression: {
          consistent: true,
          multiline: true,
        },

        ObjectPattern: {
          multiline: true,
          consistent: true,
        },

        ExportDeclaration: "always",
      }],

      "object-curly-spacing": ["error", "always"],

      "object-property-newline": ["error", {
        allowAllPropertiesOnSameLine: false,
      }],

      "operator-assignment": ["error", "always"],
      "padded-blocks": ["error", "never"],

      "padding-line-between-statements": ["error", {
        blankLine: "never",
        prev: "import",
        next: "import",
      }, {
        blankLine: "always",
        prev: "*",
        next: "return",
      }],

      quotes: ["error", "double", {
        avoidEscape: true,
      }],

      semi: ["error", "always"],
      "space-before-blocks": ["error", "always"],
      "space-in-parens": ["error", "never"],

      "space-infix-ops": ["error", {
        int32Hint: false,
      }],

      "space-unary-ops": "error",
      "switch-colon-spacing": "error",
      "template-curly-spacing": "error",
    },
  },
]);
