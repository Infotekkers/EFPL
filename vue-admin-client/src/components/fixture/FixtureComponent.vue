<template>
  <div class="fixture">
    <!-- teams loading -->
    <div v-if="isTeamLoading == true">Loading</div>
    <!-- teams loading -->

    <!-- Container -->
    <div v-if="fixture && isTeamLoading == false" class="main-container">
      <!-- Fixture Main Info -->
      <div class="fixture-info" @click="goToDetailPage">
        <!-- Home team -->
        <div class="fixture-container">
          <!-- Team Name -->
          <div class="homeTeam">
            {{ fixture.homeTeam }}
          </div>
          <!-- Team Name -->

          <!-- Team Icon -->
          <div
            class="logo"
            :style="{
              'background-image': 'url(' + getHomeTeamImage + ')',
            }"
          ></div>
          <!-- Team Icon -->
        </div>
        <!-- Home team -->

        <!-- Game Time - formatted -->
        <span class="gameTime">{{ formatTime }}</span>
        <!-- Game Time - formatted -->

        <!-- Away Team -->
        <div class="fixture-container">
          <!-- Team Logo -->
          <div
            class="logo"
            :style="{
              'background-image': 'url(' + getAwayTeamImage + ')',
            }"
          ></div>
          <!-- Team Logo -->

          <!-- Team Name -->
          <div class="awayTeam">{{ fixture.awayTeam }}</div>
          <!-- Team Name -->
        </div>
        <!-- Away Team -->
      </div>
      <!-- Fixture Main Info -->

      <!-- TODO:Filter Controls by match status -->

      <!-- Control Center -->
      <div class="controls">
        <div @click="startMatch">Play</div>
        <div @click="pauseMatch">Pause</div>
        <div @click="resumeMatch">Resume</div>
        <div @click="stopMatch">Stop</div>
        <div @click="editMatch">Edit</div>
        <div @click="deleteMatch">Delete</div>
      </div>
      <!-- Control Center -->
    </div>
    <!-- Container -->
  </div>
</template>

<style scoped>
.fixture {
  margin-top: 36px;
}
.fixture-container {
  display: flex;
  align-items: center;
  width: 50%;
}
.fixture-container:nth-of-type(odd) {
  justify-content: flex-end;
}
.fixture-container:nth-of-type(even) {
  justify-content: flex-start;
}
.main-container {
  width: 950px;
  display: flex;
  flex-direction: row;
  align-items: center;
  background: teal;
}
.fixture-info {
  width: 750px;
  display: flex;
  flex-direction: row;
  align-items: center;
  background: yellow;
}
.logo {
  width: 40px;
  height: 40px;
}
.fixture-container:nth-of-type(odd) .logo {
  margin-left: 16px;
}
.fixture-container:nth-of-type(even) .logo {
  margin-right: 16px;
}
.grey {
  background: grey;
}

.date-info {
  text-align: center;
  margin-bottom: 4px;
}
.homeTeam,
.awayTeam {
  font-size: 24px;
}

.gameTime {
  margin: 0 24px;
  border: 1px solid black;
  padding: 4px 20px;
}
.controls {
  display: flex;
  flex-direction: row;
}
.controls > div {
  margin-left: 15px;
}
</style>

<script>
// Utils
import router from "../../router/index";
import store from "../../store/index";
export default {
  name: "FixtureComponent",
  props: {
    fixture: Object,
    index: Number,
    isTeamLoading: Boolean,
  },

  computed: {
    // Match ID
    getMatchKey() {
      return this.$.vnode.key;
    },

    // Format game time
    formatTime() {
      const value = new Date(this.fixture.schedule);
      let hour =
        value.getHours() < 9 ? `0${value.getHours()}` : value.getHours();
      let minute =
        value.getMinutes() < 9 ? `0${value.getMinutes()}` : value.getMinutes();

      return `${hour}:${minute}`;
    },

    // get home image
    getHomeTeamImage() {
      let path;
      try {
        path = require(`@/assets/teams/${this.fixture.homeTeam}.png`);
      } catch (err) {
        path = require("@/assets/teams/NoImage.png");
      }
      const placerHolder = require("@/assets/teams/NoImage.png");
      return this.fixture.homeTeam ? path : placerHolder;
    },

    // get away team image
    getAwayTeamImage() {
      let path;
      try {
        path = require(`@/assets/teams/${this.fixture.awayTeam}.png`);
      } catch (err) {
        path = require("@/assets/teams/NoImage.png");
      }
      const placerHolder = require("@/assets/teams/NoImage.png");
      return this.fixture.awayTeam ? path : placerHolder;
    },
  },

  methods: {
    // Route to details page
    goToDetailPage() {
      router.push({
        path: "/fixture/detail",
        query: { id: this.fixture.matchId },
      });
    },

    // Start match event handler
    startMatch() {
      store.dispatch("Fixture/startMatch", this.getMatchKey);
    },

    // pause match event handler
    pauseMatch() {
      store.dispatch("Fixture/pauseMatch", this.getMatchKey);
    },

    // resume match event handler
    resumeMatch() {
      store.dispatch("Fixture/resumeMatch", this.getMatchKey);
      console.log("Res");
    },

    // Stop match event handler
    stopMatch() {
      store.dispatch("Fixture/endMatch", this.getMatchKey);
    },

    // Delete match event handler
    deleteMatch() {
      store.dispatch("Fixture/deleteMatch", this.getMatchKey);
    },
    // edit match event handler
    editMatch() {
      store.dispatch("Fixture/setEditFixtureId", this.getMatchKey);
      this.$emit("activateModal");
    },
  },
};
</script>
