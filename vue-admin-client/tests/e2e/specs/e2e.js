// https://docs.cypress.io/api/table-of-contents
import "cypress-localstorage-commands";

describe("E2E Test", () => {
  before(() => {
    cy.clearLocalStorageSnapshot();
  });
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
    // * DASHBOARD TESTS
  });

  it("Visits fixtures", () => {
    cy.get('[href="/admin/fixtures"]').click();
    cy.get('[class="fixture-main-container"]')
      .wait(3000)
      .should("have.length", 8);
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

  it("Visits fixture details", () => {
    cy.get('[class="fixture-main-container"]')
      .contains("Adama City S.C")
      .click();
  });

  it("Adds player lineup", () => {
    var player = cy.get(".locker-room").first();
    console.log(player);
    // cy.get(".locker-room").debug();
    cy.get(".locker-room").children().first().trigger("mousedown");
    cy.get(".locker-room")
      .children()
      .first()
      .trigger("mousemove", -100, 0, { force: true });
    cy.get(".locker-room").children().first().trigger("mouseup");
  });

  it("Visits players", () => {
    cy.get('[href="/admin/players"]').click();
    cy.get('[class="players-container"]')
      .wait(3000)
      .children()
      .should("have.length", 454);
  });

  it("Visits teams", () => {
    cy.get('[href="/admin/teams"]').click();
    cy.get('[class="teams-container"]')
      .wait(3000)
      .children()
      .should("have.length", 16);
  });

  it("Edits team", () => {
    cy.get('[class="teams-container"]')
      .contains("Addis Ababa City F.C")
      .parent()
      .find('[data-cp="edit-team"]')
      .click();
    cy.get('input[name="teamStadium"]').clear().type("Abebe Bikila Stadium");
    cy.get(".main-button-primary").click();
    cy.get(".main-modal-close").click();

    cy.get('[class="teams-container"]')
      .contains("Addis Ababa City F.C")
      .parent()
      .find('[data-cp="edit-team"]')
      .click();
    cy.get('input[name="teamStadium"]').clear().type("Addis Ababa Stadium");
    cy.get(".main-button-primary").click();
    cy.get(".main-modal-close").click();
  });

  it("Logs out", () => {
    cy.get('[href="/admin/settings"]').click();
    cy.get('button[class="collapseAcc"]').click();
    cy.get('button[class="accLink-2 "]').click();
  });
});
