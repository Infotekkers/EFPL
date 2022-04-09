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
        <div @click="resumeMatch">Resume</div>
        <div @click="stopMatch">Stop</div>
        <div @click="editMatch">Edit</div>
        <div @click="deleteMatch">Delete</div>
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
import router from "../router/index";

// Components
import store from "../store";
import { mapActions } from "vuex";

export default {
  name: "FixtureComponent",

  props: {
    fixture: Object,
    index: Number,
  },

  computed: {
    showNotification() {
      console.log(store.state.Fixture.showNotification);
      return store.state.Fixture.showNotification;
    },
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
    ...mapActions("Fixture", ["setFixtureDetailId"]),
    goToDetailPage() {
      this.setFixtureDetailId(this.fixture.matchId);
      router.push({
        path: "/fixture/detail",
        query: { id: this.fixture.matchId },
      });
    },

    startMatch() {
      store.dispatch("Fixture/startMatch", this.getMatchKey);
    },

    pauseMatch() {
      store.dispatch("Fixture/pauseMatch", this.getMatchKey);
    },
    resumeMatch() {
      store.dispatch("Fixture/resumeMatch", this.getMatchKey);
      console.log("Res");
    },
    stopMatch() {
      store.dispatch("Fixture/endMatch", this.getMatchKey);
    },
    deleteMatch() {
      store.dispatch("Fixture/deleteMatch", this.getMatchKey);
    },
    editMatch() {
      // TODO: Hook to api
      // TODO: Improve response messages
      const teamIds = this.getMatchKey.split("|");

      const allTeams = store.state.Fixture.allTeams;

      const homeTeam = allTeams.filter((team) => {
        return team.teamId == parseInt(teamIds[0]);
      });

      const awayTeam = allTeams.filter((team) => {
        return team.teamId == parseInt(teamIds[1]);
      });

      store.dispatch("Fixture/setHomeTeams", [homeTeam, awayTeam]);
      store.dispatch("Fixture/setHomeTeamIndex", 0);

      console.log(store.state.Fixture.homeTeams);

      store.dispatch("Fixture/setAwayTeams", [homeTeam, awayTeam]);
      store.dispatch("Fixture/setAwayTeamIndex", 1);

      this.$emit("activateModal");

      // TODO: Hook to api
      console.log("Editing Match", this.getMatchKey);
    },
  },
};
</script>
