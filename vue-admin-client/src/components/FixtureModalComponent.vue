<template>
  <!-- TODO:ADD RESULT -->
  <!-- Modal -->
  <main class="fixture-modal-main-container">
    <!-- Top Close Button -->
    <div
      class="fixture-modal-close"
      v-on="
        isEditMode === true
          ? { click: modalEditCancel }
          : { click: modalCancel }
      "
    >
      X
    </div>
    <!-- Top Close Button -->

    <!-- Main Section -->
    <div
      v-if="isTeamComplete && !isGameWeekComplete"
      class="fixture-modal-content-container"
    >
      <div class="fixture-modal-content">
        <!-- Content -->
        <div class="fixture-modal-scroller" v-if="homeTeams">
          <!-- Home team info -->
          <div class="fixture-home-team-section">
            <!-- Previous button -->
            <!-- Previous button -->

            <div
              class="fixture-home-team-previous"
              v-on="
                isEditMode === true ? { click: '' } : { click: prevHomeTeam }
              "
            >
              <img
                :src="previousSmallIcon.path"
                :alt="previousSmallIcon.alt"
                class="small-icon"
              />
            </div>
            <div class="fixture-team-selector">
              <!-- Image -->
              <div
                class="fixture-team-logo"
                :style="{
                  'background-image': 'url(' + getHomeTeamImage + ')',
                }"
              ></div>

              <!-- Team title -->
              <div class="fixture-team-name">
                {{ homeTeams[homeTeamIndex].teamName }}
              </div>
              <!-- Team title -->
            </div>

            <!-- Next Button -->
            <div
              class="fixture-home-team-next"
              v-on="
                isEditMode === true ? { click: '' } : { click: nextHomeTeam }
              "
            >
              <img
                :src="nextSmallIcon.path"
                :alt="nextSmallIcon.alt"
                class="small-icon"
              />
            </div>
            <!-- Next Button -->
          </div>
          <!-- Home team info -->

          <!-- Time and Date info -->
          <div>
            <!-- Date -->
            <div class="fixture-date-container">
              <!-- Label -->
              <label for="Date"
                >{{ $t("Date") }} <span>({{ $t("DD/MM/YY") }})</span>
              </label>
              <div>
                <div class="date">
                  <input
                    ref="date"
                    type="date"
                    :value="fixtureDate"
                    @change="changeValue"
                    :min="new Date().toISOString().split('T')[0]"
                    :max="
                      new Date(
                        new Date().setFullYear(new Date().getFullYear() + 1)
                      )
                        .toISOString()
                        .split('T')[0]
                    "
                  />
                </div>
              </div>
            </div>
            <!-- Date -->

            <!-- Time -->
            <div class="fixture-time-container">
              <!-- Label -->
              <label for="Time">{{ $t("Time") }}</label>
              <div>
                <div class="fixture-time-hour">
                  <select
                    name="hour"
                    id="hour"
                    ref="hour"
                    :value="fixtureHours"
                  >
                    <option v-for="n in 9" :key="n + 9" :value="n + 9">
                      {{ n + 9 }}
                    </option>
                  </select>
                </div>
                <div class="fixture-time-minute">
                  <select
                    name="minutes"
                    id="minutes"
                    ref="minutes"
                    :value="fixtureMinutes"
                  >
                    <option
                      v-for="n in [
                        '00',
                        10,
                        15,
                        20,
                        25,
                        30,
                        35,
                        40,
                        45,
                        50,
                        55,
                      ]"
                      :key="n"
                      :value="n"
                    >
                      {{ n }}
                    </option>
                  </select>
                </div>
              </div>
            </div>
            <!-- Time -->
          </div>
          <!-- Time and Date info -->

          <!-- Away Team info -->
          <div
            class="fixture-away-team-section"
            :class="awayTeamIndex === homeTeamIndex ? 'disabled' : ''"
          >
            <div
              class="fixture-away-team-previous"
              v-on="
                isEditMode === true ? { click: '' } : { click: prevAwayTeam }
              "
            >
              <img
                :src="previousSmallIcon.path"
                :alt="previousSmallIcon.alt"
                class="small-icon"
              />
            </div>

            <div class="fixture-team-selector">
              <div
                class="fixture-team-logo"
                :style="{
                  'background-image': 'url(' + getAwayTeamImage + ')',
                }"
              ></div>
              <div class="fixture-team-name">
                {{ awayTeams[awayTeamIndex].teamName }}
              </div>
            </div>
            <div
              class="fixture-away-team-next"
              v-on="
                isEditMode === true ? { click: '' } : { click: nextAwayTeam }
              "
            >
              <img
                :src="nextSmallIcon.path"
                :alt="nextSmallIcon.alt"
                class="small-icon"
              />
            </div>
          </div>
          <!-- Away Team Info -->

          <!-- Buttons Container -->
        </div>
        <!-- Content -->
      </div>
      <!-- Buttons -->
      <div class="fixture-modal-buttons-container">
        <!-- Cancel button *2 modes -->
        <div
          class="fixture-modal-cancel-button"
          v-on="
            isEditMode === true
              ? { click: modalEditCancel }
              : { click: modalCancel }
          "
        >
          {{ $t("Cancel") }}
        </div>
        <!-- Cancel button *2 modes -->

        <!-- Save Button *2 modes -->
        <div
          class="fixture-modal-save-button"
          v-on="
            isEditMode === true
              ? { click: updateFixture }
              : { click: addNewFixture }
          "
        >
          {{ $t("Save") }}
        </div>
        <!-- Save Button *2 modes -->
      </div>
      <!-- Buttons -->
    </div>
    <!-- Main Section -->

    <!-- all teams have matches -->
    <div v-else-if="isGameWeekComplete" class="fixture-modal-incomplete">
      {{ $t("all teams have games in game week") }} {{ this.currentGameWeek }}
    </div>
    <!-- all teams have matches -->

    <div v-else-if="getTeamCount == 0" class="fixture-modal-incomplete">
      {{ $t("no teams added") }}

      <div class="fixture-add-new-team" @click="addNewTeam">
        <div>
          <img :src="addIcon.path" :alt="addIcon.alt" class="small-icon" />
        </div>
        {{ $t("Add") }}
      </div>
    </div>

    <div v-else-if="getTeamCount % 2 !== 0" class="fixture-modal-incomplete">
      {{ $t("incomplete team") }}

      <div class="fixture-add-new-team" @click="addNewTeam">
        <div>
          <img :src="addIcon.path" :alt="addIcon.alt" class="small-icon" />
        </div>
        {{ $t("Add") }}
      </div>
    </div>
  </main>
  <!-- Modal -->
</template>

<style scoped>
.small-icon {
  width: 15px;
  height: 15px;
}

.fixture-modal-main-container {
  height: 100vh;
  width: 100%;
  display: grid;
  place-items: center;
  position: fixed;
  top: 0;
  left: 0;
  background: rgba(0, 0, 0, 0.65);
  z-index: 2;
  overflow: hidden;
  color: var(--neutral-900);
}
.fixture-modal-close {
  position: absolute;
  top: 40px;
  right: 32px;
  width: 30px;
  height: 30px;
  background: var(--neutral-100);
  color: var(--primary-900);
  font-size: 20px;
  display: grid;
  place-items: center;
  border-radius: 50%;
  font-weight: bold;
  cursor: pointer;
}
.fixture-modal-content-container {
  width: 60%;
  min-height: 300px;
  background: var(--neutral-100);
  padding: 42px 0 24px 0;
}
.fixture-modal-content {
  display: flex;
  align-items: flex-start;
  padding: 0 16px;
  /* position: relative; */
}
.fixture-modal-scroller {
  width: 100%;
  display: flex;
  justify-content: space-between;
  align-items: center;

  display: flex;
  flex-direction: row;
  justify-content: center;
}
.fixture-home-team-section,
.fixture-away-team-section {
  width: 280px;
  min-height: 240px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 0 32px;
}
.fixture-team-selector {
  width: 90%;
  display: flex;
  flex-direction: column;
  align-items: center;
}

.fixture-team-logo {
  width: 160px;
  height: 160px;
  background: url("../assets/img/Team_Logo_Placeholder.jpg");

  background-size: contain;
  background-position: center;
  background-repeat: no-repeat;
}

.fixture-team-name {
  margin-top: 30px;
  font-size: 18px;
}

label {
  margin-bottom: 8px;
  font-size: 15px;
  color: var(--neutral-800);
}
label > span {
  font-size: 10px;
  margin-left: 3px;
}
input,
select {
  outline: none;
  height: 30px;
  border: none;
  padding: 0 3.5px;
}
.fixture-time-container,
.fixture-date-container {
  padding: 0 16px;
}
.fixture-time-container {
  margin-top: 24px;
}
.fixture-time-container > div {
  display: flex;
}
.fixture-time-hour,
.fixture-time-minute {
  width: 50%;
}
.fixture-time-hour > select,
.fixture-time-minute > select {
  width: 100%;
}
.fixture-modal-buttons-container {
  display: flex;
  width: fit-content;
  margin-right: 5%;
  margin-left: auto;
  margin-top: 32px;
  align-items: center;
}
.fixture-modal-save-button {
  background: var(--primary-900);
  color: var(--neutral-100);
  font-size: 15px;
}
.fixture-modal-cancel-button {
  margin-right: 4px;
}

.fixture-modal-cancel-button,
.fixture-modal-save-button {
  padding: 5px 22px;
  cursor: pointer;
}

/*  */

.disabled {
  opacity: 0.5;
}
.fixture-modal-incomplete {
  width: 60%;
  min-height: 300px;
  background: var(--neutral-100);
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
}
.fixture-add-new-team {
  font-size: 16px;
  /* position: absolute; */
  /* right: 0; */
  background: var(--primary-900);
  padding: 5px 22px 5px 16px;

  width: fit-content;
  color: var(--neutral-100);
  display: flex;
  margin-top: 32px;
}
.fixture-add-new-team > div {
  width: 20px;
  height: 20px;
  background: var(--primary-800);
  border-radius: 50%;
  display: grid;
  place-items: center;
  margin-right: 6px;
}
</style>

<script>
// Utils
import store from "../store/index";
import router from "../router/index";

import { nextSmallIcon, previousSmallIcon, addIcon } from "@/utils/Icons";

export default {
  name: "FixtureModalComponent",
  props: {
    isEditMode: Boolean,
  },
  data() {
    return {
      homeIconError: false,
      fixtureDataChanged: true,
      loadFromDBDate: true,
      loadFromDBHour: true,
      loadFromDBMinute: true,
      fixtureDate: new Date().toISOString().split("T")[0],
      fixtureHours: "10",
      fixtureMinutes: "00",

      // Icons
      nextSmallIcon: nextSmallIcon,
      previousSmallIcon: previousSmallIcon,
      addIcon: addIcon,
    };
  },
  computed: {
    // gets current gameweek
    currentGameWeek() {
      return store.state.Fixture.showingGameWeek;
    },

    isGameWeekComplete() {
      if (this.isEditMode) {
        return false;
      } else {
        // get number of teams
        const teamCount = store.state.Fixture.allTeams.length;

        // count gameweek for current GW
        const fixtures = JSON.parse(
          JSON.stringify(store.state.Fixture.allFixturesUnfiltered)
        );

        const fixturesCount = fixtures.filter((fixture) => {
          return fixture.gameweekId == this.currentGameWeek;
        }).length;

        // number of fixtures should be more than 0 and 2 * number of teams
        return teamCount === fixturesCount * 2 && fixturesCount > 0
          ? true
          : false;
      }
    },

    getTeamCount() {
      const teamCount = store.state.Fixture.allTeams.length;

      return teamCount;
    },

    isTeamComplete() {
      if (this.isEditMode) {
        return true;
      } else {
        const teamCount = store.state.Fixture.allTeams.length;

        return teamCount >= 2 && teamCount % 2 == 0;
      }
    },

    // gets all possible home teams
    homeTeams() {
      // If not edit mode , remove all played teams
      if (!this.isEditMode) {
        // get all current gw matches
        const allGwMatches = store.state.Fixture.allFixtures.filter((match) => {
          return match.gameweekId == this.currentGameWeek;
        });

        let allUnplayedTeams = [];
        // get all teams
        const allTeams = store.state.Fixture.allTeams;

        // if no fixture this gw use all teams as possible
        if (allGwMatches.length == 0) {
          allUnplayedTeams = Array.from(allTeams);
        }
        // if teams have fixtures
        else {
          // filter played teams
          let allPlayedTeams = [];
          allGwMatches.forEach((match) => {
            allPlayedTeams.push(match.homeTeam);
            allPlayedTeams.push(match.awayTeam);
          });

          // filter unplayed teams
          allUnplayedTeams = allTeams.filter((team) => {
            return !allPlayedTeams.includes(team.teamName);
          });
        }

        // Dispatch Store Action
        store.dispatch("Fixture/setHomeTeams", allUnplayedTeams);
        store.dispatch("Fixture/setHomeTeamIndex", 0);
        store.dispatch("Fixture/setAwayTeams", allUnplayedTeams);
        store.dispatch("Fixture/setAwayTeamIndex", 1);
      }
      // If edit mode
      else {
        // get edit fixture teams
        const teamIds = store.state.Fixture.editFixtureId.split("|");
        const allTeams = store.state.Fixture.allTeams;
        const homeTeam = JSON.parse(
          JSON.stringify(
            allTeams.filter((team) => {
              return team.teamId == parseInt(teamIds[0]);
            })
          )
        )[0];
        const awayTeam = JSON.parse(
          JSON.stringify(
            allTeams.filter((team) => {
              return team.teamId == parseInt(teamIds[1]);
            })
          )
        )[0];

        // get teams with no match if any
        const existingTeams = JSON.parse(
          JSON.stringify(store.state.Fixture.homeTeams)
        );

        // existing teams added as options during edit
        let allPossibleTeams = Array.from(existingTeams);
        allPossibleTeams.push(homeTeam);
        allPossibleTeams.push(awayTeam);

        // get edit fixture team's index to start at those index
        let editHomeTeamIndex, editAwayTeamIndex;

        for (let i = 0; i < allPossibleTeams.length; i++) {
          if (allPossibleTeams[i].teamName == homeTeam.teamName) {
            editHomeTeamIndex = i;
          } else if (allPossibleTeams[i].teamName == awayTeam.teamName) {
            editAwayTeamIndex = i;
          }
        }

        // dispatch store actions
        store.dispatch("Fixture/setHomeTeams", allPossibleTeams);
        store.dispatch(
          "Fixture/setHomeTeamIndex",
          editHomeTeamIndex ? editHomeTeamIndex : 0
        );

        store.dispatch("Fixture/setAwayTeams", allPossibleTeams);
        store.dispatch(
          "Fixture/setAwayTeamIndex",
          editAwayTeamIndex ? editAwayTeamIndex : 1
        );
      }
      return store.state.Fixture.homeTeams;
    },

    // gets home team index
    homeTeamIndex() {
      return store.state.Fixture.currentHomeTeamIndex;
    },

    // gets possible away teams
    awayTeams() {
      return store.state.Fixture.awayTeams;
    },

    // gets away team index
    awayTeamIndex() {
      return store.state.Fixture.currentAwayTeamIndex;
    },

    // get home team image
    getHomeTeamImage() {
      const baseURL = process.env.VUE_APP_API_BASE_URL;
      return baseURL + this.homeTeams[this.homeTeamIndex].teamLogo;
    },

    // get away team image
    getAwayTeamImage() {
      const baseURL = process.env.VUE_APP_API_BASE_URL;
      return baseURL + this.awayTeams[this.awayTeamIndex].teamLogo;
    },

    getFixtureDate() {
      const homeTeam = this.homeTeams[this.homeTeamIndex].teamName;
      const awayTeam = this.awayTeams[this.awayTeamIndex].teamName;

      const gw = this.currentGameWeek;

      const fixture = store.state.Fixture.allFixturesUnfiltered.filter(
        (fixture) => {
          return (
            fixture.homeTeam == homeTeam &&
            fixture.awayTeam == awayTeam &&
            fixture.gameweekId == gw
          );
        }
      );

      return fixture;
    },
  },

  methods: {
    // Scroller methods
    nextHomeTeam() {
      const index = store.state.Fixture.currentHomeTeamIndex;

      index < store.state.Fixture.homeTeams.length - 1
        ? store.dispatch("Fixture/setHomeTeamIndex", index + 1)
        : store.dispatch("Fixture/setHomeTeamIndex", 0);
    },
    prevHomeTeam() {
      const index = store.state.Fixture.currentHomeTeamIndex;

      index > 0
        ? store.dispatch("Fixture/setHomeTeamIndex", index - 1)
        : store.dispatch(
            "Fixture/setHomeTeamIndex",
            store.state.Fixture.homeTeams.length - 1
          );
    },
    nextAwayTeam() {
      const index = store.state.Fixture.currentAwayTeamIndex;

      index < store.state.Fixture.awayTeams.length - 1
        ? store.dispatch("Fixture/setAwayTeamIndex", index + 1)
        : store.dispatch("Fixture/setAwayTeamIndex", 0);
    },
    prevAwayTeam() {
      const index = store.state.Fixture.currentAwayTeamIndex;

      index == 0
        ? store.dispatch(
            "Fixture/setAwayTeamIndex",
            store.state.Fixture.awayTeams.length - 1
          )
        : store.dispatch("Fixture/setAwayTeamIndex", index - 1);
    },

    // add new fixture event handler - add mode
    addNewFixture() {
      // If same team warn
      if (this.awayTeamIndex === this.homeTeamIndex) {
        store.dispatch("Global/setNotificationInfo", {
          showNotification: true,
          notificationType: "warning",
          notificationMessage: `Both home and away team are the same.(${
            this.homeTeams[this.homeTeamIndex].teamName
          })`,
        });
      } else {
        const schedule = `${this.$refs.date.value}T${this.$refs.hour.value}:${this.$refs.minutes.value}`;

        const newFixture = {
          gameweekId: this.currentGameWeek,
          schedule: schedule,
          homeTeam: this.homeTeams[this.homeTeamIndex].teamName,
          awayTeam: this.awayTeams[this.awayTeamIndex].teamName,
        };
        store.dispatch("Fixture/saveNewFixture", newFixture);
      }
    },

    // update fixture event handler - edit mode
    updateFixture() {
      // If same team warn
      if (
        this.awayTeamIndex === this.homeTeamIndex &&
        this.fixtureDataChanged == false
      ) {
        store.dispatch("Global/setNotificationInfo", {
          showNotification: true,
          notificationType: "warning",
          notificationMessage: `Both home and away team are the same.(${
            this.homeTeams[this.homeTeamIndex].teamName
          })`,
        });
      } else {
        const dateValue = this.$refs.date.value;
        let hourValue = "";
        if (this.$refs.hour.value > 13) {
          hourValue = this.$refs.hour.value - 3;
          this.$refs.hour.value > 13;
        } else {
          hourValue = "0" + (this.$refs.hour.value - 3).toString();
        }

        const schedule = `${dateValue}T${hourValue}:${this.$refs.minutes.value}:00.000+00:00`;

        const newFixture = {
          gameweekId: this.currentGameWeek,
          schedule: schedule,
          homeTeam: this.homeTeams[this.homeTeamIndex].teamName,
          awayTeam: this.awayTeams[this.awayTeamIndex].teamName,
        };
        store.dispatch("Fixture/updateFixture", newFixture);
      }
    },

    // close modal event handler - add mode
    modalCancel() {
      this.$emit("closeModal");
    },

    // close modal event handler - edit mode
    modalEditCancel() {
      /*
        ==================================
        Remove Teams in the edit fixture
        ==================================
      */
      // All GW Matches
      const allGwMatches = store.state.Fixture.allFixtures.filter((match) => {
        return match.gameweekId == this.currentGameWeek;
      });

      let allUnplayedTeams = [];
      const allTeams = store.state.Fixture.allTeams;

      if (allGwMatches.length == 0) {
        allUnplayedTeams = Array.from(allTeams);
      } else {
        // All Teams

        let allPlayedTeams = [];
        allGwMatches.forEach((match) => {
          allPlayedTeams.push(match.homeTeam);
          allPlayedTeams.push(match.awayTeam);
        });

        allUnplayedTeams = allTeams.filter((team) => {
          return !allPlayedTeams.includes(team.teamName);
        });
      }

      store.dispatch("Fixture/setHomeTeams", allUnplayedTeams);
      store.dispatch("Fixture/setHomeTeamIndex", 0);
      store.dispatch("Fixture/setAwayTeams", allUnplayedTeams);
      store.dispatch("Fixture/setAwayTeamIndex", 1);

      /*
        ==================================
        Close Modal
        ==================================
      */
      this.$emit("closeModal");
    },

    addNewTeam() {
      // pass modal 1 to activate modal auto
      router.push({
        path: "/admin/teams",
        query: { modal: 1 },
      });
    },
  },

  updated() {
    if (this.isEditMode) {
      this.fixtureDate = this.getFixtureDate[0].schedule.split("T")[0];

      const time = new Date(this.getFixtureDate[0].schedule);
      const hours = time.getHours();
      const minutes =
        time.getMinutes() == 0 ? "0" + time.getMinutes() : time.getMinutes();

      this.fixtureHours = hours;
      this.fixtureMinutes = minutes;
    }
  },
};
</script>
