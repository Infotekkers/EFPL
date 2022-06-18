<template>
  <div class="team-container">
    <div class="team-id-container">{{ team.relative_id }}</div>
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
      <div @click="editTeam" data-cp="edit-team">
        <img :src="editIcon.path" :alt="editIcon.alt" class="small-icon" />
      </div>
      <div @click="deleteTeam" data-cp="delete-team">
        <img :src="deleteIcon.path" :alt="deleteIcon.alt" class="small-icon" />
      </div>
    </div>
  </div>
</template>

<style scoped>
/* Icons */
.extra-small-icon {
  width: 7px;
  height: fit-content;
  object-fit: contain;
}

.small-icon {
  width: 15px;
  height: fit-content;
  object-fit: contain;
}
.team-container {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 0 16px;
  min-height: 110px;
  border-bottom: 2px solid var(--neutral-200);
  font-size: 16px;
  color: var(--neutral-900);
}
.team-container:nth-of-type(odd) {
  background: var(--neutral-200);
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
  background-size: contain;
  background-position: center;
  background-repeat: no-repeat;
}

.team-name-container {
  width: 20%;
  min-width: 130px;
  display: flex;
}
.team-container-colored {
  background: var(--primary-100);
}

.team-city-container {
  min-width: 100px;
  width: 17%;
  display: flex;
}

.team-stadium-container {
  display: flex;
  flex-direction: column;
  align-items: flex-start;
  width: 18%;
}
.team-capacity-container {
  font-size: var(--spacing-small);
}
.team-year-container {
  display: flex;
  width: 8%;
}
.team-controls-container {
  width: 10%;
  display: flex;
  justify-content: space-between;
  padding: 0 24px;
}
.team-controls-container > div:nth-of-type(1) {
  margin-right: 8px;
}
</style>

<script>
import store from "../store/index";

import { editIcon, deleteIcon } from "@/utils/Icons";
export default {
  name: "TeamComponent",
  props: {
    team: Object,
  },
  data() {
    return {
      editIcon: editIcon,
      deleteIcon: deleteIcon,
    };
  },

  methods: {
    // Event handlers
    editTeam() {
      store.dispatch("Team/setEditTeamId", this.team.teamId);
      this.$emit("activateModalEdit");
    },
    deleteTeam() {
      store.dispatch("Team/deleteTeam", this.team.teamId);
      store.dispatch("Fixture/setAllTeams");
      setTimeout(() => {
        store.dispatch("Fixture/setAllFixtures");
        store.dispatch("Player/setAllPlayers");
      }, 200);

      // refresh all values
    },
  },
  computed: {
    getTeamLogo() {
      const baseUrl = process.env.VUE_APP_API_BASE_URL;
      const team = this.team.teamLogo;
      return baseUrl + team;
    },
  },
};
</script>
