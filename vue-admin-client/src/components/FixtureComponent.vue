<template>
  <div class="fixture-main-container">
    <!-- teams loading -->
    <div v-if="isTeamLoading == true" class="main-spinner-container">
      <SpinnerComponent />
    </div>
    <!-- teams loading -->

    <!-- Container -->
    <div
      v-if="fixture && isTeamLoading == false"
      class="fixture-content-container"
    >
      <!-- First Half -->
      <div class="fixture-live-status" v-if="fixture.status == 'liveFH'">
        FH
      </div>
      <!-- First Half -->

      <!-- Half Time -->
      <div class="fixture-live-status" v-else-if="fixture.status == 'HT'">
        HT
      </div>
      <!-- Half Time -->

      <!-- Second Half -->
      <div class="fixture-live-status" v-else-if="fixture.status == 'liveSH'">
        SH
      </div>
      <!-- Second Half -->

      <!-- Full Time -->
      <div class="fixture-live-status" v-else-if="fixture.status == 'FT'">
        FT
      </div>
      <!-- Full Time -->
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
        <div class="fixture-game-time">
          <div v-if="fixture.status == 'scheduled'">{{ formatTime }}</div>

          <div v-else class="score-info">
            {{ fixture.score.split("v")[0] }} -
            {{ fixture.score.split("v")[1] }}
          </div>
        </div>
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

      <!-- Control Center -->
      <div class="fixture-controls">
        <div @click="startMatch" data-cp="start-match">
          <img :src="playIcon.path" :alt="playIcon.alt" class="small-icon" />
        </div>
        <div @click="pauseMatch" data-cp="pause-match">
          <img :src="pauseIcon.path" :alt="pauseIcon.alt" class="small-icon" />
        </div>
        <div @click="resumeMatch">
          <img
            :src="restartIcon.path"
            :alt="restartIcon.alt"
            class="small-icon"
          />
        </div>
        <div @click="stopMatch">
          <img :src="stopIcon.path" :alt="stopIcon.alt" class="small-icon" />
        </div>
        <div @click="editMatch" data-cp="edit-match">
          <img :src="editIcon.path" :alt="editIcon.alt" class="small-icon" />
        </div>
        <div @click="deleteMatch" data-cp="delete-match">
          <img
            :src="deleteIcon.path"
            :alt="deleteIcon.alt"
            class="small-icon"
          />
        </div>
      </div>
      <!-- Control Center -->
    </div>
    <!-- Container -->
  </div>
</template>

<style scoped>
/* Icons */
.extra-small-icon {
  width: 7px;

  height: 7px;
  object-fit: contain;
}

.small-icon {
  width: 15px;
  height: 15px;
  object-fit: contain;
  margin-left: 3px;
}

.fixture-main-container {
  width: 100%;
  border-bottom: 2px solid var(--neutral-200);
  color: var(--neutral-900);
  padding-right: 12px;
}
.fixture-main-container:nth-of-type(odd) {
  background: var(--neutral-200);
  /* background: red; */
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
.fixture-live-status {
  height: 100%;
  width: 50px;
  position: absolute;
  display: grid;
  place-items: center;
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
  background-size: contain;
  background-repeat: no-repeat;
}
.fixture-game-time {
  width: 8%;
  text-align: center;
}
.score-info {
  letter-spacing: 3px;
  font-weight: bold;
  font-size: 18px;
}
.fixture-controls {
  position: absolute;
  right: 0;
  display: flex;
  align-items: center;
  width: fit-content;
  margin-left: auto;
  font-size: 12px;
  height: 100%;
  /* min-height: 15px; */

  /* margin-left: 100%; */
}
.fixture-controls > div {
  margin-left: 8px;
  height: 15px;
}

/* * Super Small Screen */
@media screen and (max-width: 400px) {
  .fixture-main-container {
    display: none;
  }
}

/* Small Screens */
@media screen and (min-width: 401px) and (max-width: 1400px) {
  .fixture-content-container {
    flex-wrap: wrap;
  }
  .fixture-controls {
    position: inherit;
    margin-bottom: 16px;
  }
}

/*  */
</style>

<script>
// Utils
import router from "../router/index";
import store from "../store/index";

// Components
import SpinnerComponent from "@/components/SpinnerComponent.vue";
import {
  playIcon,
  pauseIcon,
  restartIcon,
  stopIcon,
  editIcon,
  deleteIcon,
} from "@/utils/Icons";

export default {
  name: "FixtureComponent",
  props: {
    fixture: Object,
    index: Number,
    isTeamLoading: Boolean,
  },

  components: {
    SpinnerComponent,
  },

  data() {
    return {
      playIcon: playIcon,
      pauseIcon: pauseIcon,
      restartIcon: restartIcon,
      stopIcon: stopIcon,
      editIcon: editIcon,
      deleteIcon: deleteIcon,
    };
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
      store.dispatch("Fixture/setFixtureDetailId", this.fixture.matchId);
      router.push({
        path: "fixture/detail",
        query: { id: this.fixture.matchId },
      });
    },

    validateLineup() {
      let validation = false;
      if (this.fixture.awayTeamLineUp && this.fixture.homeTeamLineUp) {
        // home team lineup
        if (
          this.fixture.homeTeamLineUp.lineup &&
          this.fixture.awayTeamLineUp.lineup
        ) {
          validation = true;
        } else {
          validation = false;
        }
      } else {
        validation = false;
      }
      return validation;
    },
    // Start match event handler
    startMatch() {
      // check lineup
      // if (this.validateLineup()) {
      store.dispatch("Fixture/startMatch", this.getMatchKey);
      // }

      // if no lineup
      // else {
      // store.dispatch("Global/setNotificationInfo", {
      //   showNotification: true,
      //   notificationType: "warning",
      //   notificationMessage: `Fixture lineup is required before starting it.`,
      // });
      // }
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
      if (this.fixture.status == "scheduled") {
        store.dispatch("Fixture/deleteMatch", this.getMatchKey);
      } else {
        store.dispatch("Global/setNotificationInfo", {
          showNotification: true,
          notificationType: "error",
          notificationMessage: `Match is already live.`,
        });
      }
    },
    // edit match event handler
    editMatch() {
      if (this.fixture.status == "scheduled") {
        store.dispatch("Fixture/setEditFixtureId", this.getMatchKey);
        this.$emit("activateModal");
      } else {
        store.dispatch("Global/setNotificationInfo", {
          showNotification: true,
          notificationType: "error",
          notificationMessage: `Match is already live.`,
        });
      }
    },
  },
  beforeMount() {
    console.log(this.fixture);
  },
};
</script>
