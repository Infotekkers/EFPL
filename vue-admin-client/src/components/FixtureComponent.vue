<template>
  <!-- TODO:Add Result Display -->
  <main class="fixture-main-container">
    <!-- teams loading -->
    <div v-if="isTeamLoading == true">Loading</div>
    <!-- teams loading -->

    <!-- Container -->
    <div
      v-if="fixture && isTeamLoading == false"
      class="fixture-content-container"
    >
      <!-- Fixture Main Info -->
      <div
        class="fixture-info"
        @click="goToDetailPage"
        v-if="getTeams.length !== 0"
      >
        <!-- Home team -->
        <div class="fixture-container home-container">
          <!-- Team Name -->
          <div class="fixture-home-team">
            {{ fixture.homeTeam }}
          </div>
          <!-- Team Name -->

          <!-- Team Icon -->
          <div
            class="fixture-logo"
            :style="{
              'background-image': 'url(' + getHomeTeamImage + ')',
            }"
          ></div>
          <!-- Team Icon -->
        </div>
        <!-- Home team -->

        <!-- Game Time - formatted -->
        <div class="fixture-game-time">{{ formatTime }}</div>
        <!-- Game Time - formatted -->

        <!-- Away Team -->
        <div class="fixture-container away-container">
          <!-- Team Logo -->
          <div
            class="fixture-logo"
            :style="{
              'background-image': 'url(' + getAwayTeamImage + ')',
            }"
          ></div>
          <!-- Team Logo -->

          <!-- Team Name -->
          <div class="fixture-away-team">{{ fixture.awayTeam }}</div>
          <!-- Team Name -->
        </div>
        <!-- Away Team -->
      </div>
      <!-- Fixture Main Info -->

      <!-- TODO:Filter Controls by match status -->

      <!-- Control Center -->
      <div class="fixture-controls">
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
  </main>
</template>

<style scoped>
.fixture-main-container {
  width: 100%;
  border-bottom: 2px solid var(--neutral-200);
  color: var(--neutral-900);
}
.fixture-main-container:nth-of-type(odd) {
  background: var(--neutral-100);
}
.fixture-main-container:nth-of-type(1) {
  margin-top: 16px;
}
.fixture-content-container {
  display: flex;
  align-items: center;
  width: 100%;
  position: relative;
}
.fixture-info {
  width: 100%;
  display: flex;
  flex-direction: row;
  align-items: center;
}
.fixture-container {
  display: flex;
  align-items: center;
  width: 46%;
  padding: 8px 0;
}
.home-container {
  justify-content: flex-end;
  padding-right: 20px;
}
.away-container {
  justify-content: flex-start;
  padding-left: 20px;
}
.fixture-home-team,
.fixture-away-team {
  min-width: 220px;
  font-size: 18px;
}
.fixture-home-team {
  text-align: end;
  margin-right: 16px;
}
.fixture-away-team {
  text-align: start;
  margin-left: 16px;
}
.fixture-logo {
  width: 40px;
  height: 40px;
  background-size: cover;
  background-repeat: no-repeat;
}
.fixture-game-time {
  width: 8%;
  text-align: center;
}
.fixture-controls {
  position: absolute;
  right: 0;
  display: flex;
  width: fit-content;
  margin-left: auto;
  font-size: 12px;
  /* margin-left: 100%; */
}
.fixture-controls > div {
  margin-left: 4px;
}
/*  */
</style>

<script>
// Utils
import router from "../router/index";
import store from "../store/index";
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
      const baseUrl = process.env.VUE_APP_API_BASE_URL;

      const homeTeam = store.state.Fixture.allTeams.filter((team) => {
        return team.teamName == this.fixture.homeTeam;
      });
      return `${baseUrl}${homeTeam[0].teamLogo}`;
    },

    getTeams() {
      return store.state.Fixture.allTeams;
    },

    // get away team image
    getAwayTeamImage() {
      const baseUrl = process.env.VUE_APP_API_BASE_URL;

      const awayTeam = store.state.Fixture.allTeams.filter((team) => {
        return team.teamName == this.fixture.awayTeam;
      });

      return `${baseUrl}${awayTeam[0].teamLogo}`;
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
