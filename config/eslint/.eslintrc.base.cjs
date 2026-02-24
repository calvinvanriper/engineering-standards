/**
 * ESLint baseline (general-purpose)
 * - Works for Node and browser JS projects
 * - Keep this dependency-light: "eslint" only is required for the base rules
 *
 * Repos may extend this config but must not weaken REQUIRED standards.
 */
module.exports = {
  root: true,

  env: {
    es2022: true,
    node: true,
    browser: true,
  },

  parserOptions: {
    ecmaVersion: "latest",
    sourceType: "module",
  },

  ignorePatterns: [
    "node_modules/",
    "dist/",
    "build/",
    "out/",
    "coverage/",
    ".next/",
    ".nuxt/",
    ".svelte-kit/",
    ".vercel/",
    ".cache/",
    ".parcel-cache/",
    ".turbo/",
  ],

  extends: ["eslint:recommended"],

  rules: {
    /**
     * Consistency + clarity
     */
    semi: ["error", "always"],
    quotes: [
      "error",
      "single",
      { avoidEscape: true, allowTemplateLiterals: true },
    ],
    eqeqeq: ["error", "always"],
    curly: ["error", "all"],
    "no-var": "error",
    "prefer-const": "error",

    /**
     * Safety
     */
    "no-undef": "error",
    "no-unreachable": "error",
    "no-throw-literal": "error",

    /**
     * Noise control
     * NOTE: Some repos (learning labs) may allow console usage in specific files.
     * Repo-level extensions may tighten this rule, but should not weaken it.
     */
    "no-console": ["warn", { allow: ["warn", "error"] }],

    /**
     * Maintainability
     */
    "no-unused-vars": [
      "error",
      { argsIgnorePattern: "^_", varsIgnorePattern: "^_" },
    ],
  },

  overrides: [
    /**
     * CommonJS configs and tooling files
     */
    {
      files: ["*.cjs", "*.config.js", "*.config.cjs"],
      parserOptions: {
        sourceType: "script",
      },
    },

    /**
     * Markdown code blocks are handled via prettier/markdown tooling,
     * not ESLint (kept dependency-light here).
     */
  ],
};
