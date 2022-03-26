<template>
  <div ref="modal" class="modal-show">
    <div class="close-button" @click="$emit('closeModal')">X</div>

    <div class="main-section" v-if="homeTeams">
      <h6>Add New Fixture for Game week {{ currentGameweek }}</h6>
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

          <div class="name">{{ homeTeams[homeTeamIndex] }}</div>
        </div>
        <div class="next" @click="nextHomeTeam">Next</div>
      </div>

      <!-- Time and Date info -->
      <div>
        <div class="date">
          <label for="Date">Date <span>(DD/MM/YY)</span> : </label>
          <div>
            <div class="date">
              <input
                type="date"
                id="birthday"
                name="birthday"
                :min="new Date().toISOString().split('T')[0]"
                :max="
                  new Date(new Date().setFullYear(new Date().getFullYear() + 1))
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
              <select name="hour" id="hour">
                <option v-for="n in 13" :key="n" :value="n + 9">
                  {{ n + 9 }}
                </option>
              </select>
            </div>
            <div class="minutes">
              <select name="minutes" id="minutes">
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
            {{ awayTeams[awayTeamIndex] }}
          </div>
        </div>
        <div class="next" @click="nextAwayTeam">Next</div>
      </div>
    </div>
  </div>
</template>

<style scoped>
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
  height: 450px;
  background: white;
  margin-top: 50px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 0 60px;
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
</style>

<script>
import store from "../store/index";
export default {
  name: "FixtureModalComponent",
  data() {
    return {
      homeIconError: false,
    };
  },

  computed: {
    // Game week
    currentGameweek() {
      return store.state.Fixture.showingGameWeek;
    },
    // Scroller methods
    homeTeams() {
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
      const homeTeam = this.homeTeams[this.homeTeamIndex];
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
      const awayTeam = this.awayTeams[this.awayTeamIndex];
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

      index < 0
        ? store.dispatch("Fixture/setAwayTeamIndex", index + 1)
        : store.dispatch("Fixture/setAwayTeamIndex", 0);
    },

    //
    demo() {
      console.log(store.state.Fixture);
    },
  },
};
</script>
