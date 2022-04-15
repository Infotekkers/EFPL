<template>
  <section>
    <div class="season-import-team-selector-team-section">
      <input type="checkbox" @click="addTeamToImportList()" />
      <div>{{ legacyTeam.teamName }}</div>
    </div>

    <div
      class="season-import-team-selector-players-section"
      :ref="legacyTeam.teamName.split(' ').join('')"
    >
      <div
        v-for="player in getAllTeamPlayers"
        :key="player.playerId"
        class="season-import-team-selector-player-container"
      >
        <input type="checkbox" checked @click="addPlayer" />
        <h1>{{ player.playerName }}</h1>
      </div>
    </div>
  </section>
</template>

<style scoped>
.season-import-team-selector-team-section {
  display: flex;
  align-items: center;
}
.season-import-team-selector-players-section {
  margin-top: 32px;
  min-height: 500px;
  max-height: 500px;
  overflow-y: scroll;
  display: none;

  background: pink;
  padding: 10px;
}
.season-import-team-selector-player-container {
  min-height: 60px;
  background: tomato;
  margin-top: 32px;
  display: flex;
  align-items: center;
}
</style>

<script>
import store from "../store/index";
export default {
  name: "TeamImportComponent",
  methods: {
    addTeamToImportList() {
      const x = this.legacyTeam.teamName.split(" ").join("");
      this.$refs[x].style.display == "block"
        ? (this.$refs[x].style.display = "none")
        : (this.$refs[x].style.display = "block");
      // save to list

      store.dispatch("Season/addImportTeam", [
        this.legacyTeam.teamId,
        this.legacyTeam.teamName,
      ]);
      //   get team players

      store.dispatch("Season/getLegacyPlayerByTeam", this.legacyTeam.teamId);
    },
  },
  props: {
    legacyTeam: Object,
  },
  computed: {
    getAllTeamPlayers() {
      //   console.log(legacyTeamId, "A");
      const allPlayers = store.state.Season.allLegacyPlayers;

      const selectedPlayers = allPlayers.filter((player) => {
        return player.eplTeamId == this.legacyTeam.teamId;
      });

      //   console.log(selectedPlayers);

      if (
        store.state.Season.importSelectedTeams.includes(this.legacyTeam.teamId)
      ) {
        selectedPlayers.forEach((player) => {
          store.dispatch("Season/addImportPlayer", [
            player.playerId,
            this.legacyTeam.teamId,
          ]);
        });
      }

      //   return selectedPlayers[0];
      return selectedPlayers;
    },
  },
};
</script>
