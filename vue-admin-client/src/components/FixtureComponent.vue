<template>
  <div class="fixture">
    <div
      v-if="fixture"
      :class="index % 2 == 0 ? 'grey' : 'white'"
      class="main-container"
    >
      <div class="fixture-info" @click="goToDetailPage">
        <!-- Home team -->
        <div class="fixture-container">
          <!-- Team -->
          <div class="homeTeam">{{ fixture.homeTeam }}</div>
          <!-- Icon -->
          <div
            class="logo"
            :style="{
              'background-image': 'url(' + getHomeTeamImage + ')',
            }"
          ></div>
        </div>

        <!-- Time -->
        <span class="gameTime">{{ formatTime }}</span>

        <!-- Away Team -->
        <div class="fixture-container">
          <div
            class="logo"
            :style="{
              'background-image': 'url(' + getAwayTeamImage + ')',
            }"
          ></div>
          <div class="awayTeam">{{ fixture.awayTeam }}</div>
        </div>
      </div>

      <!-- Controls -->
      <div class="controls">
        <div @click="startMatch">Play</div>
        <div @click="pauseMatch">Pause</div>
        <div @click="stopMatch">Stop</div>
      </div>
    </div>
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
  width: 850px;
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
  margin-left: 3px;
}
</style>

<script>
import router from "../router/index";
export default {
  name: "FixtureComponent",
  props: {
    fixture: Object,
    index: Number,
  },

  computed: {
    getMatchKey() {
      return this.$.vnode.key;
    },
    formatTime() {
      const value = new Date(this.fixture.schedule);
      let hour =
        value.getHours() < 9 ? `0${value.getHours()}` : value.getHours();
      let minute =
        value.getMinutes() < 9 ? `0${value.getMinutes()}` : value.getMinutes();

      return `${hour}:${minute}`;
    },
    // image methods
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
    goToDetailPage() {
      router.push({
        path: "/fixture/detail",
        query: { id: this.fixture.matchId },
      });
    },

    startMatch() {
      console.log("Starting", this.getMatchKey);
    },

    pauseMatch() {
      console.log("Pausing", this.getMatchKey);
    },
    stopMatch() {
      console.log("Ending Match", this.getMatchKey);
    },
  },
};
</script>
