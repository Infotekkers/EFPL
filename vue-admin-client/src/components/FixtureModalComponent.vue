<template>
  <div ref="modal" class="modal-show">
    <div
      class="close-button"
      v-on="
        isEditMode === true
          ? { click: modalEditCancel }
          : { click: modalCancel }
      "
    >
      X {{ isEditMode }}
    </div>

    <div class="main-section" v-if="homeTeams.length > 0">
      <!-- Title -->
      <div class="title" v-show="isEditMode === false">
        Add new fixture for Game week {{ currentGameWeek }}
      </div>

      <div class="title" v-show="isEditMode === true">
        Editing fixture for Game week {{ currentGameWeek }}
      </div>

      <div class="content-section" v-if="homeTeams">
        <!-- Home team info -->
        <div class="homeTeam">
          <div class="prev" @click="prevHomeTeam">Prev</div>
          <div class="content">
            <!-- Image -->
            <div
              class="logo"
              :style="{
                'background-image': 'url(' + getHomeTeamImage + ')',
              }"
            ></div>

            <div class="name">{{ homeTeams[homeTeamIndex].teamName }}</div>
          </div>
          <div class="next" @click="nextHomeTeam">Next</div>
        </div>
        <!-- Home team info -->

        <!-- Time and Date info -->
        <div>
          <div class="date">
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
          <div class="time">
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
      <div class="buttons-container">
        <div
          v-on="
            isEditMode === true
              ? { click: modalEditCancel }
              : { click: modalCancel }
          "
        >
          Cancel
        </div>
        <div
          v-on="
            isEditMode === true
              ? { click: updateFixture }
              : { click: addNewFixture }
          "
        >
          Save
        </div>
      </div>
    </div>

    <div v-else class="container">All Teams have matches</div>
  </div>
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
    modalMode() {
      return this.isEditMode;
    },
    currentGameWeek() {
      return store.state.Fixture.showingGameWeek;
    },
    // Scroller methods
    homeTeams() {
      if (!this.isEditMode) {
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
      }
      return store.state.Fixture.homeTeams;
    },
    homeTeamIndex() {
      return store.state.Fixture.currentHomeTeamIndex;
    },

    awayTeams() {
      return store.state.Fixture.awayTeams;
    },
    awayTeamIndex() {
      return store.state.Fixture.currentAwayTeamIndex;
    },

    // image methods
    getHomeTeamImage() {
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

    getAwayTeamImage() {
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
        : store.dispatch("Fixture/setHomeTeamIndex", index);
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

    //
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

    modalCancel() {
      this.$emit("closeModal");
    },

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
