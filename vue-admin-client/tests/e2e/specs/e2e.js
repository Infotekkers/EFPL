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

  it("Visits teams", () => {
    cy.get('[href="/admin/teams"]').click();
    cy.get('[class="teams-container"]')
      .wait(3000)
      .children()
      .should("have.length", 16);
  });

  it("Adds team", () => {
    cy.get(".teams-add-new").click();

    // Invalid team name
    cy.get('input[name="teamName"]').clear().type("Sebeta City F.C");
    cy.get('input[name="teamNameAmh"]').clear().type("ፈታኞቹ");
    cy.get('input[name="teamCity"]').clear().type("Skypeia");
    cy.get('input[name="teamStadium"]')
      .clear({ force: true })
      .type("Wellness Center", {
        force: true,
      });
    cy.get('input[name="teamCoach"]').clear().type("Coach Margaret");
    cy.get('input[name="stadiumCapacity"]').clear().type("200");
    cy.get('input[name="foundedIn"]').clear().type("2022");
    cy.get('input[name="teamLogo"]').attachFile("wellness_center_logo.png");
    cy.get(".main-button-primary").click();
    cy.get(".error-fill").should("exist");

    // Empty logo
    cy.get('input[name="teamName"]').clear().type("Testers");
    cy.get('input[name="teamNameAmh"]').clear().type("ፈታኞቹ");
    cy.get('input[name="teamCity"]').clear().type("Skypeia");
    cy.get('input[name="teamStadium"]')
      .clear({ force: true })
      .type("Wellness Center", {
        force: true,
      });
    cy.get('input[name="teamCoach"]').clear().type("Coach Margaret");
    cy.get('input[name="stadiumCapacity"]').clear().type("200");
    cy.get('input[name="foundedIn"]').clear().type("2022");
    cy.get(".main-button-primary").click();
    cy.get("input:invalid").should("have.length", 1);

    // Valid data
    cy.get('input[name="teamName"]').clear().type("Testers");
    cy.get('input[name="teamNameAmh"]').clear().type("ፈታኞቹ");
    cy.get('input[name="teamCity"]').clear().type("Skypeia");
    cy.get('input[name="teamStadium"]')
      .clear({ force: true })
      .type("Wellness Center", {
        force: true,
      });
    cy.get('input[name="teamCoach"]').clear().type("Coach Margaret");
    cy.get('input[name="stadiumCapacity"]').clear().type("200");
    cy.get('input[name="foundedIn"]').clear().type("2022");
    cy.get('input[name="teamLogo"]').attachFile("wellness_center_logo.png");
    cy.get(".main-button-primary").click();
    cy.get(".main-modal-close").click();
  });

  it("Edits team", () => {
    cy.get('[class="teams-container"]')
      .contains("Testers")
      .parent()
      .find('[data-cp="edit-team"]')
      .click();

    // Invalid team name
    cy.get('input[name="teamName"]').clear().type("Sebeta City F.C");
    cy.get(".error-fill").should("exist");

    // Empty logo
    cy.get('input[name="teamName"]').clear().type("Testers");
    cy.get(".team-modal-image-remove").click();
    cy.get("input:invalid").should("have.length", 1);

    // Valid data
    cy.get('input[name="teamStadium"]')
      .clear({ force: true })
      .type("Legit Big Awesome Stadium");
    cy.get('input[name="teamLogo"]').attachFile("wellness_center_logo.png");
    cy.get(".main-button-primary").click();
    cy.get(".main-modal-close").click();
  });

  it("Removes team", () => {
    cy.get('[class="teams-container"]')
      .contains("Testers")
      .parent()
      .find('[data-cp="delete-team"]')
      .click();
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

  it("Updates fixture", () => {
    cy.get('[class="fixture-main-container"]')
      .contains("Fasil Kenema S.C")
      .parentsUntil('[class="fixture-main-container"]')
      .find('[data-cp="edit-match"]')
      .click();

    // // Invalid away team
    // cy.get(".fixture-away-team-next > .small-icon").click();
    // cy.get('[class="fixture-modal-save-button"]').click();
    // cy.get(".message-container").contains(
    //   "Both home and away team are the same.(Adama City S.C)"
    // );
    // cy.get(".fixture-away-team-next > .small-icon").click();

    // // Invalid home team
    // cy.get(".fixture-home-team-next > .small-icon").click();
    // cy.get('[class="fixture-modal-save-button"]').click();
    // cy.get(".message-container").contains(
    //   "Both home and away team are the same.(Saint George S.C)"
    // );
    // cy.get(".fixture-home-team-next > .small-icon").click();

    // // Valid update
    cy.get("#hour").select("16");
    cy.get('[class="fixture-modal-save-button"]').click();
    cy.get('[class="fixture-modal-close"]').click();
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

  it("Visits players", () => {
    cy.get('[href="/admin/players"]').click();
    cy.get('[class="players-container"]')
      // .wait(3000)
      .children()
      .should("have.length", 432);
  });

  it("Adds player", () => {
    cy.get(".players-add-new").click();

    // Invalid / Empty name
    cy.get('input[name="playerName"]').clear();
    cy.get('input[name="playerNameAmh"]').clear().type("ፈታኝ");
    cy.get('select[name="PlayerTeam"]')
      .last()
      .select("Adama City S.C", { force: true });
    cy.get('select[name="PlayerPosition"]').select("GoalKeepers", {
      force: true,
    });
    cy.get('input[name="currentPrice"]').clear().type("5.5");
    cy.get('select[name="injuryStatus"]').select("Available");
    cy.get('input[name="injuryMessage"]').clear().type("Fit to play");
    cy.get(".main-button-primary").click();
    cy.get(".error-fill").should("exist");

    // Invalid price
    cy.get('input[name="playerName"]').clear().type("Tester");
    cy.get('input[name="playerNameAmh"]').clear().type("ፈታኝ");
    cy.get('select[name="PlayerTeam"]')
      .last()
      .select("Adama City S.C", { force: true });
    cy.get('select[name="PlayerPosition"]').select("GoalKeepers", {
      force: true,
    });
    cy.get('input[name="currentPrice"]').clear().type("1");
    cy.get('select[name="injuryStatus"]').select("Available");
    cy.get('input[name="injuryMessage"]').clear().type("Fit to play");
    cy.get(".main-button-primary").click();
    cy.get(".error-fill").should("exist");

    // Valid data
    cy.get('input[name="playerName"]').clear().type("Tester");
    cy.get('input[name="playerNameAmh"]').clear().type("ፈታኝ");
    cy.get('select[name="PlayerTeam"]')
      .last()
      .select("Adama City S.C", { force: true });
    cy.get('select[name="PlayerPosition"]').select("GoalKeepers", {
      force: true,
    });
    cy.get('input[name="currentPrice"]').clear().type("5.5");
    cy.get('select[name="injuryStatus"]').select("Available");
    cy.get('input[name="injuryMessage"]').clear().type("Fit to play");
    cy.get(".main-button-primary").click();
    cy.get(".main-modal-close").click();
  });

  it("Removes Player", () => {});

  it("Visits fixture details", () => {
    cy.get('[href="/admin/fixtures"]').click();
    cy.get('[class="fixture-main-container"]')
      .contains("Adama City S.C")
      .click();
  });

  it("Adds player lineup", () => {
    cy.get(".locker-room")
      .children()
      // .its("length")
      .then((players) => {
        // let noOfPlayersInLineup = 0;
        let positionCount = {
          gk: 0,
          def: 0,
          mid: 0,
          att: 0,
          sub: 0,
        };
        let index = 1;

        for (const player of players) {
          const position = player.children[1].innerText.toLowerCase();
          if (Object.values(positionCount).reduce((a, b) => a + b) < 18) {
            if (position === "gk" && positionCount.gk < 1) {
              cy.get(`.locker-room > :nth-child(${index})`).drag(
                "#goalkeepers"
              );
              positionCount.gk++;
              index--;
            } else if (position === "def" && positionCount.def < 4) {
              cy.get(`.locker-room > :nth-child(${index})`).drag("#defenders");
              positionCount.def++;
              index--;
            } else if (position === "mid" && positionCount.mid < 4) {
              cy.get(`.locker-room > :nth-child(${index})`).drag(
                "#midfielders"
              );
              positionCount.mid++;
              index--;
            } else if (position === "att" && positionCount.att < 2) {
              cy.get(`.locker-room > :nth-child(${index})`).drag("#strikers");
              positionCount.att++;
              console.log(player.innerHTML);
              index--;
            } else if (positionCount.sub < 7) {
              cy.get(`.locker-room > :nth-child(${index})`).drag("#bench");
              positionCount.sub++;
              index--;
            }
          }
          index++;
        }
      });
    cy.get(".locker-room").children().should("have.length.below", 30);
    cy.get(".actions > button").click();
  });

  it("Updates player stats", () => {
    cy.visit("/admin/fixtures");

    // Invalid match status
    cy.get('[class="fixture-main-container"]')
      .contains("Adama City S.C")
      .click();
    cy.get("#goalkeepers > .field-player").click();
    cy.get(".error-fill").should("exist");
    cy.get('[href="/admin/fixtures"]').click();

    // Valid data
    cy.reload();
    cy.get('[class="fixture-main-container"]')
      .contains("Adama City S.C")
      .parentsUntil('[class="fixture-main-container"]')
      .find('[data-cp="start-match"]')
      .wait(2000)
      .click();

    cy.get('[class="fixture-main-container"]')
      .contains("Adama City S.C")
      .parentsUntil('[class="fixture-main-container"]')
      .find('[data-cp="pause-match"]')
      .wait(2000)
      .click();

    cy.get('[class="fixture-main-container"]')
      .contains("Adama City S.C")
      .click();

    cy.get("#goalkeepers > .field-player").wait(1000).click();
    cy.get("#goals > :nth-child(4)").click();
    cy.get(".action-primary").click();
    cy.get("#close > button").wait(1000).click();
  });

  it("Logs out", () => {
    cy.get('[href="/admin/settings"]').click();
    cy.get('button[class="collapseAcc"]').click();
    cy.get(".accLink-2").click();
  });
});
