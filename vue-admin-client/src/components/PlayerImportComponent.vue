<template>
  <div class="player-import-container" v-if="show">
    <div class="player-import-loading" v-if="loading">Loading</div>
    <div v-else class="player-import-content-container">
      <div
        class="player-import-content"
        v-for="legacyPlayer in getAllLegacyPlayers"
        :key="legacyPlayer.playerId"
      >
        <input
          type="checkbox"
          checked
          @change="playerCheckboxClicked(legacyPlayer.playerId)"
          :ref="'playerCheckbox' + legacyPlayer.playerId"
        />

        <div>{{ legacyPlayer.playerId }}</div>

        <div class="player-import-position">{{ legacyPlayer.position }}</div>

        <div class="player-import-name">{{ legacyPlayer.playerName }}</div>
      </div>
    </div>
  </div>
</template>

<script>
import store from "@/store";
export default {
  name: "PlayerImportComponent",
  props: {
    teamId: Number,
    show: Boolean,
  },
  computed: {
    getAllLegacyPlayers() {
      const allLegacyPlayers = store.state.Season.allLegacyPlayers;

      const filteredLegacyPlayers = allLegacyPlayers.filter((player) => {
        return player.eplTeamId == this.teamId;
      });

      return filteredLegacyPlayers;
    },
  },
  methods: {
    playerCheckboxClicked(playerId) {
      const checkstatus = this.$refs[`playerCheckbox${playerId}`][0].checked;
      if (checkstatus) {
        store.dispatch("Season/setImportSelectedPlayer", {
          playerId: playerId,
          teamId: this.teamId,
        });
      } else {
        const allImportPlayers = store.state.Season.importSelectedPlayers;

        const filtered = allImportPlayers.filter((importPlayer) => {
          return importPlayer.playerId != playerId;
        });

        store.dispatch("Season/replaceImportSelectedPlayer", filtered);
      }
    },
  },
  data() {
    return {
      loading: true,
    };
  },
  mounted() {
    const allPlayers = store.state.Season.allLegacyPlayers;

    if (allPlayers) {
      this.loading = false;
    }
  },
};
</script>

<style scoped>
.player-import-content {
  min-height: 60px;
  width: 100%;
  background: pink;
  margin-top: 32px;

  display: flex;
  align-items: center;
  padding: 0 40px;
}
.player-import-content > input {
  margin-right: 12px;
  width: 15px;
  height: 15px;
}
.player-import-position {
  min-width: 50px;
  background: red;

  margin-right: 32px;
}
</style>
