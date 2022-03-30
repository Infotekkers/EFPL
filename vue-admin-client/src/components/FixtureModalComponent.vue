<template>
  <!-- Modal -->
  <div ref="modal" class="modal-show">
    <!-- Top Close Button -->
    <div
      class="close-button"
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
    <div class="main-section" v-if="homeTeams.length > 0">
      <!-- Title for add mode-->
      <div class="title" v-show="isEditMode === false">
        Add new fixture for Game week {{ currentGameWeek }}
      </div>

      <!-- Title for edit mode -->
      <div class="title" v-show="isEditMode === true">
        Editing fixture for Game week {{ currentGameWeek }}
      </div>
      <!-- Title for edit mode -->

      <!-- Content -->
      <div class="content-section" v-if="homeTeams">
        <!-- Home team info -->
        <div class="homeTeam">
          <!-- Previous button -->
          <div class="prev" @click="prevHomeTeam">Prev</div>
          <!-- Previous button -->

          <div class="content">
            <!-- Image -->
            <div
              class="logo"
              :style="{
                'background-image': 'url(' + getHomeTeamImage + ')',
              }"
            ></div>

            <!-- Team title -->
            <div class="name">{{ homeTeams[homeTeamIndex].teamName }}</div>
            <!-- Team title -->
          </div>

          <!-- Next Button -->
          <div class="next" @click="nextHomeTeam">Next</div>
          <!-- Next Button -->
        </div>
        <!-- Home team info -->

        <!-- Time and Date info -->
        <div>
          <!-- Date -->
          <div class="date">
            <!-- Label -->
            <label for="Date">Date <span>(DD/MM/YY)</span> : </label>
            <div>
              <div class="date">
                <input
                  ref="date"
                  type="date"
                  id="birthday"
                  name="birthday"
                  :value="new Date().toISOString().split('T')[0]"
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
          <div class="time">
            <!-- Label -->
            <label for="Time">Time :</label>
            <div>
              <div class="hour">
                <select name="hour" id="hour" ref="hour">
                  <option v-for="n in 13" :key="n" :value="n + 9">
                    {{ n + 9 }}
                  </option>
                </select>
              </div>
              <div class="minutes">
                <select name="minutes" id="minutes" ref="minutes">
                  <option
                    v-for="n in ['00', 10, 15, 20, 25, 30, 35, 40, 45, 50, 55]"
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
          class="awayTeam"
          :class="awayTeamIndex === homeTeamIndex ? 'disabled' : ''"
        >
          <div class="prev" @click="prevAwayTeam">Prev</div>
          <div class="content">
            <div
              class="logo"
              :style="{
                'background-image': 'url(' + getAwayTeamImage + ')',
              }"
            ></div>
            <div class="name">
              {{ awayTeams[awayTeamIndex].teamName }}
            </div>
          </div>
          <div class="next" @click="nextAwayTeam">Next</div>
        </div>
        <!-- Away Team Info -->

        <!-- Buttons Container -->
      </div>
      <!-- Content -->

      <!-- Buttons -->
      <div class="buttons-container">
        <!-- Cancel button *2 modes -->
        <div
          v-on="
            isEditMode === true
              ? { click: modalEditCancel }
              : { click: modalCancel }
          "
        >
          Cancel
        </div>
        <!-- Cancel button *2 modes -->

        <!-- Save Button *2 modes -->
        <div
          v-on="
            isEditMode === true
              ? { click: updateFixture }
              : { click: addNewFixture }
          "
        >
          Save
        </div>
        <!-- Save Button *2 modes -->
      </div>
      <!-- Buttons -->
    </div>
    <!-- Main Section -->

    <!-- all teams have matches -->
    <div v-else class="container">All Teams have matches</div>
    <!-- all teams have matches -->
  </div>
  <!-- Modal -->
</template>

<style scoped>
.container {
  width: 60%;
  height: 600px;
  background: white;
  margin-left: 20%;
  text-align: center;
  display: grid;
  place-items: center;
  font-size: 32px;
}
.container-col,
.container-row {
  display: flex;
}
.form-container {
  width: 30%;
}
.container-col {
  flex-direction: column;
}
.container-row {
  flex-direction: row;
}
.text-input {
  height: 28px;
}
.modal-show {
  width: 100%;
  height: 100vh;
  background: rgba(0, 0, 0, 0.65);
  position: absolute;
  top: 0;
  left: 0;
  z-index: 1;
}
.modal-hide {
  display: none;
}
.close-button {
  margin-left: 95%;
  margin-top: 32px;
  border-radius: 50%;
  width: 40px;
  height: 40px;
  display: grid;
  place-items: center;
}
.main-section {
  width: 60%;
  margin-left: 20%;
  background: white;
}

.content-section {
  width: calc(100% - 120px);
  height: 450px;
  background: teal;
  margin-top: 20px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 0 60px;
}
.title {
  text-align: center;
  padding-top: 16px;
  font-size: 20px;
  font-weight: bold;
}
.homeTeam,
.awayTeam {
  width: 300px;
  height: 300px;
  display: flex;
  align-items: center;
  justify-content: space-between;
}
.time {
  margin-top: 36px;
}
.time > div,
.date > div {
  display: flex;
}
.logo {
  width: 190px;
  height: 190px;
  object-fit: contain;
  /* background: aliceblue; */
}
.name {
  margin-top: 30px;
  font-size: 26px;
}
.disabled {
  opacity: 0.5;
}
.buttons-container {
  display: flex;
  flex-direction: row;
  width: 25%;
  margin-left: 75%;
  background: teal;
  justify-content: space-between;
}
.buttons-container > div {
  border: 1px solid black;
  padding: 5px 22px;
}
.buttons-container > div:nth-of-type(1) {
  background: red;
}
.buttons-container > div:nth-of-type(2) {
  background: green;
}
</style>

<script>
// Utils
import store from "../store/index";

export default {
  name: "FixtureModalComponent",
  props: {
    isEditMode: Boolean,
  },
  data() {
    return {
      homeIconError: false,
    };
  },
  computed: {
    // gets current gameweek
    currentGameWeek() {
      return store.state.Fixture.showingGameWeek;
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
      // TODO: Make Server Image
      const homeTeam = this.homeTeams[this.homeTeamIndex].teamName;
      let path;
      try {
        path = require(`@/assets/teams/${homeTeam}.png`);
      } catch (err) {
        path = require("@/assets/teams/NoImage.png");
      }
      const placerHolder = require("@/assets/teams/NoImage.png");
      return homeTeam ? path : placerHolder;
    },

    // get away team image
    getAwayTeamImage() {
      // TODO: Make Server Image
      const awayTeam = this.awayTeams[this.awayTeamIndex].teamName;
      let path;
      try {
        path = require(`@/assets/teams/${awayTeam}.png`);
      } catch (err) {
        path = require("@/assets/teams/NoImage.png");
      }
      const placerHolder = require("@/assets/teams/NoImage.png");
      return awayTeam ? path : placerHolder;
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
  },
};
</script>
