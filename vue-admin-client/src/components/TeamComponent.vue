<template>
  <div class="team-container">
    <div class="team-id-container">{{ team.teamId + 1 }}</div>
    <div
      class="team-logo-container"
      :style="{
        'background-image': 'url(' + getTeamLogo + ')',
      }"
    ></div>

    <div class="team-name-container">{{ team.teamName }}</div>
    <div class="team-city-container">{{ team.teamCity }}</div>
    <div class="team-stadium-container">
      <div>
        {{ team.teamStadium }}
      </div>
      <div class="team-capacity-container">{{ team.stadiumCapacity }}</div>
    </div>
    <div class="team-year-container">
      <span v-if="team.foundedIn">{{ team.foundedIn }}</span>
      <span v-else>-</span>
    </div>
    <div class="team-controls-container">
      <div @click="editTeam">Edit</div>
      <div @click="deleteTeam">Delete</div>
    </div>
  </div>
</template>

<style scoped>
.team-container {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 0 16px;
  /* margin-top: var(--spacing-large); */
  min-height: 110px;
  border-bottom: 2px solid var(--neutral-200);
  font-size: 18px;
  color: var(--neutral-900);
}
.team-container:nth-of-type(odd) {
  background: var(--neutral-100);
}
.team-id-container {
  width: 5%;
  min-width: 45px;
}
.team-logo-container {
  text-align: start;
  width: 60px;
  min-width: 60px;
  min-height: 60px;
  background-size: cover;
  background-position: center;
  background-repeat: no-repeat;
}

.team-name-container {
  width: 20%;
  min-width: 130px;
}
.team-container-colored {
  background: var(--primary-100);
}

.team-city-container {
  min-width: 100px;
  width: 17%;
}

.team-stadium-container {
  width: 16%;
}
.team-capacity-container {
  font-size: var(--spacing-small);
}
.team-year-container {
  width: 8%;
}
.team-controls-container {
  width: 10%;
  display: flex;
  justify-content: space-between;
}
.team-controls-container > div:nth-of-type(1) {
  margin-right: 8px;
}
/*  */
/* .logo {
  min-width: 100px;
  min-height: 100px;
  background-size: cover;
  background-position: center;
  background-repeat: no-repeat; */
/* background: yellow; */
/* }
.controls {
  display: flex;
}
.controls > div:nth-of-type(1) {
  margin-right: 8px;
} */
</style>

<script>
import store from "../store/index";
export default {
  name: "TeamComponent",
  props: {
    team: Object,
  },

  methods: {
    // Event handlers
    editTeam() {
      store.dispatch("Team/setEditTeamId", this.team.teamId);
      this.$emit("activateModalEdit");
    },
    deleteTeam() {
      store.dispatch("Team/deleteTeam", this.team.teamId);
    },
  },
  computed: {
    getTeamId() {
      return this.$.vnode.key;
    },
    getTeamLogo() {
      const baseUrl = process.env.VUE_APP_API_BASE_URL;
      const team = this.team.teamLogo;

      // let path;
      // try {
      //   path = require(`@/assets/teams/${homeTeam}.png`);
      // } catch (err) {
      //   path = require("@/assets/teams/NoImage.png");
      // }
      // const placerHolder = require("@/assets/teams/NoImage.png");
      // return homeTeam ? path : placerHolder;
      return baseUrl + team;
    },
  },
};
</script>
