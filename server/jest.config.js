module.exports = {
  setupFiles: ["<rootDir>/.jest/setEnvVars.js"],
  testMatch: ["<rootDir>/src/**/*.unit.(ts|js)"],
  testEnvironment: "node",
  coveragePathIgnorePatterns: ["/node_modules/"],
};
