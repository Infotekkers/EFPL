<template>
  <div class="container">
    <div class="number">{{ team.teamId }}</div>
    <div
      class="logo"
      :style="{
        'background-image': 'url(' + getTeamLogo + ')',
      }"
    ></div>

    <div class="team">{{ team.teamName }}</div>
    <div>{{ team.teamCity }}</div>
    <div>{{ team.teamStadium }}</div>
    <div class="controls">
      <div @click="editTeam">Edit</div>
      <div @click="deleteTeam">Delete</div>
    </div>
  </div>
</template>

<style scoped>
.container {
  display: flex;
  justify-content: space-between;
}
.logo {
  min-width: 100px;
  min-height: 100px;
  background-size: cover;
  background-position: center;
  background-repeat: no-repeat;
  /* background: yellow; */
}
.controls {
  display: flex;
}
.controls > div:nth-of-type(1) {
  margin-right: 8px;
}
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
