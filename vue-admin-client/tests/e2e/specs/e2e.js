// https://docs.cypress.io/api/table-of-contents
import "cypress-localstorage-commands";

describe("E2E Test", () => {
  beforeEach(() => {
    cy.restoreLocalStorage();
  });
  afterEach(() => {
    cy.saveLocalStorage();
  });

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
    cy.get('[class="fixture-main-container"]').should("have.length", 8);
  });
  it("Removes fixture", () => {
    cy.get('[class="fixture-main-container"]')
      .contains("Adama City S.C")
      .parentsUntil('[class="fixture-main-container"]')
      .find('[data-cp="delete-match"]')
      .click();
  });
  it("Adds new fixture", () => {
    cy.get('[data-cp="add-gw"]').click();
    cy.get('[class="fixture-modal-save-button"]').click();
    cy.get('[class="fixture-modal-close"]').click();
    cy.get('[class="fixture-main-container"]')
      // .wait(2000)
      .should("have.length", 8);
  });
  it("Visit fixture details", () => {
    cy.get('[class="fixture-main-container"]')
      .contains("Adama City S.C")
      .click();
  });
});
