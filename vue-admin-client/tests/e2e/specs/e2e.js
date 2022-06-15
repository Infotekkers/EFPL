// https://docs.cypress.io/api/table-of-contents

describe("E2E Test", () => {
  it("Logs in", () => {
    cy.visit("/");
    cy.get('input[name="email"]').type("admin@admin.com");
    cy.get('input[name="password"]').type("StrongPass@123");
    cy.get('button[name="submit"]').click();
  });
  it("Visits dashboard", () => {
    cy.get('[href="/admin/fixtures"]').click();
  });
  it("Visits fixtures", () => {
    cy.get('[class="fixture-main-container"]').its("length").should("eq", 8);
  });
});
