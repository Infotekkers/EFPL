// https://docs.cypress.io/api/table-of-contents
import "cypress-localstorage-commands";
import "@4tw/cypress-drag-drop";

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

  it("Logs in with invalid credentials", () => {
    cy.visit("/");

    // Empty username
    cy.get("input:invalid").should("have.length", 2);
    cy.get('input[name="password"]').type("StrongPass@123");
    cy.get("input:invalid").should("have.length", 1);

    // Invalid username
    cy.get('input[name="email"]').clear();
    cy.get('input[name="password"]').clear();
    cy.get("input:invalid").should("have.length", 2);
    cy.get('input[name="email"]').type("1");
    cy.get('input[name="password"]').type("StrongPass@123");
    cy.get("input:invalid").should("have.length", 1);

    // Empty password
    cy.get('input[name="email"]').clear();
    cy.get('input[name="password"]').clear();
    cy.get("input:invalid").should("have.length", 2);
    cy.get('input[name="email"]').type("admin@admin.com");
    cy.get("input:invalid").should("have.length", 1);

    // // Invalid password
    // cy.get('input[name="email"]').clear();
    // cy.get('input[name="password"]').clear();
    // cy.get("input:invalid").should("have.length", 2);
    // cy.get('input[name="email"]').type("admin@admin.com");
    // cy.get('input[name="password"]').type("1");
    // cy.get("input:invalid").should("have.length", 1);

    // Empty username and empty password
    cy.get('input[name="email"]').clear();
    cy.get('input[name="password"]').clear();
    cy.get("input:invalid").should("have.length", 2);
  });

  it("Logs in successfully", () => {
    cy.visit("/");
    cy.get('input[name="email"]').type("admin@admin.com");
    cy.get('input[name="password"]').type("StrongPass@123");
    cy.get('button[name="submit"]').click();
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

    // Invalid away team
    cy.get(".fixture-away-team-next > .small-icon").click();
    cy.get('[class="fixture-modal-save-button"]').click();
    cy.get(".message-container").contains(
      "Both home and away team are the same.(Adama City S.C)"
    );
    cy.get(".fixture-away-team-next > .small-icon").click();

    // Invalid home team
    cy.get(".fixture-home-team-next > .small-icon").click();
    cy.get('[class="fixture-modal-save-button"]').click();
    cy.get(".message-container").contains(
      "Both home and away team are the same.(Saint George S.C)"
    );
    cy.get(".fixture-home-team-next > .small-icon").click();

    // Valid home and away team
    cy.get('[class="fixture-modal-save-button"]').click();
    cy.get('[class="fixture-modal-close"]').click();
    cy.get('[class="fixture-main-container"]')
      // .wait(2000)
      .should("have.length", 8);
  });

  // it("Visits fixture details", () => {
  //   cy.get('[class="fixture-main-container"]')
  //     .contains("Adama City S.C")
  //     .click();
  // });

  // it("Adds player lineup", () => {
  //   cy.get(".locker-room")
  //     .children()
  //     // .its("length")
  //     .then((players) => {
  //       // let noOfPlayersInLineup = 0;
  //       let positionCount = {
  //         gk: 0,
  //         def: 0,
  //         mid: 0,
  //         att: 0,
  //         sub: 0,
  //       };
  //       let index = 1;

  //       for (const player of players) {
  //         const position = player.children[1].innerText.toLowerCase();
  //         if (Object.values(positionCount).reduce((a, b) => a + b) < 18) {
  //           if (position === "gk" && positionCount.gk < 1) {
  //             cy.get(`.locker-room > :nth-child(${index})`).drag(
  //               "#goalkeepers"
  //             );
  //             positionCount.gk++;
  //             index--;
  //           } else if (position === "def" && positionCount.def < 4) {
  //             cy.get(`.locker-room > :nth-child(${index})`).drag("#defenders");
  //             positionCount.def++;
  //             index--;
  //           } else if (position === "mid" && positionCount.mid < 4) {
  //             cy.get(`.locker-room > :nth-child(${index})`).drag(
  //               "#midfielders"
  //             );
  //             positionCount.mid++;
  //             index--;
  //           } else if (position === "att" && positionCount.att < 2) {
  //             cy.get(`.locker-room > :nth-child(${index})`).drag("#strikers");
  //             positionCount.att++;
  //             console.log(player.innerHTML);
  //             index--;
  //           } else if (positionCount.sub < 7) {
  //             cy.get(`.locker-room > :nth-child(${index})`).drag("#bench");
  //             positionCount.sub++;
  //             index--;
  //           }
  //         }
  //         index++;
  //       }
  //     });
  //   cy.get(".locker-room").children().should("have.length.below", 30);
  //   cy.get(".actions > button").click();
  // });

  // it("Updates player stats", () => {
  //   cy.visit("/admin/fixtures");

  //   cy.get('[class="fixture-main-container"]')
  //     .contains("Adama City S.C")
  //     .parentsUntil('[class="fixture-main-container"]')
  //     .find('[data-cp="start-match"]')
  //     .wait(2000)
  //     .click();

  //   cy.get('[class="fixture-main-container"]')
  //     .contains("Adama City S.C")
  //     .parentsUntil('[class="fixture-main-container"]')
  //     .find('[data-cp="pause-match"]')
  //     .wait(2000)
  //     .click();

  //   cy.get('[class="fixture-main-container"]')
  //     .contains("Adama City S.C")
  //     .click();

  //   cy.get("#goalkeepers > .field-player").click();
  //   cy.get("#goals > :nth-child(4)").click();
  //   cy.get(".action-primary").click();
  //   cy.get("#close > button").wait(1000).click();
  // });

  // it("Visits players", () => {
  //   cy.get('[href="/admin/players"]').click();
  //   cy.get('[class="players-container"]')
  //     .wait(3000)
  //     .children()
  //     .should("have.length", 454);
  // });

  // it("Visits teams", () => {
  //   cy.get('[href="/admin/teams"]').click();
  //   cy.get('[class="teams-container"]')
  //     .wait(3000)
  //     .children()
  //     .should("have.length", 16);
  // });

  // it("Edits team", () => {
  //   cy.get('[class="teams-container"]')
  //     .contains("Addis Ababa City F.C")
  //     .parent()
  //     .find('[data-cp="edit-team"]')
  //     .click();
  //   cy.get('input[name="teamStadium"]')
  //     .clear({ force: true })
  //     .type("Abebe Bikila Stadium");
  //   cy.get(".main-button-primary").click();
  //   cy.get(".main-modal-close").click();

  //   cy.get('[class="teams-container"]')
  //     .contains("Addis Ababa City F.C")
  //     .parent()
  //     .find('[data-cp="edit-team"]')
  //     .click();
  //   cy.get('input[name="teamStadium"]')
  //     .clear({ force: true })
  //     .type("Addis Ababa Stadium");
  //   cy.get(".main-button-primary").click();
  //   cy.get(".main-modal-close").click();
  // });

  it("Logs out", () => {
    cy.get('[href="/admin/settings"]').click();
    cy.get('button[class="collapseAcc"]').click();
    cy.get(".accLink-2").click();
  });
});
