<template>
  <div class="player-import-container" v-if="show">
    <!-- Loading -->
    <div class="player-import-loading" v-if="loading">Loading</div>
    <!-- Loading -->

    <div v-else>
      <!-- Content -->
      <div
        class="player-import-content-container"
        v-if="getAllLegacyPlayers.length > 0"
      >
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

          <div class="player-import-position">{{ legacyPlayer.position }}</div>

          <div class="player-import-name">{{ legacyPlayer.playerName }}</div>
        </div>
      </div>
      <!-- Content -->

      <!-- No Players -->
      <div v-else class="player-import-loading">
        No Players. Select Team to get players
      </div>
      <!-- No Players -->
    </div>
  </div>
</template>

<script>
import store from "@/store";
export default {
  name: "PlayerImportComponent",
  props: {
    teamName: String,
    show: Boolean,
    check: Boolean,
  },
  data() {
    return {
      loading: true,
    };
  },

  computed: {
    getAllLegacyPlayers() {
      const allLegacyPlayers = store.state.Season.allLegacyPlayers;

      const filteredLegacyPlayers = allLegacyPlayers.filter((player) => {
        return player.eplTeamId == this.teamName;
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

  mounted() {
    const allPlayers = store.state.Season.allLegacyPlayers;
    if (allPlayers) {
      this.loading = false;
    }
  },
};
</script>

<style scoped>
.player-import-loading {
  width: 100%;
  min-height: 120px;
  display: flex;
  align-items: center;
  justify-content: center;
  border-top: 2px solid var(--neutral-200);
}

.player-import-content {
  min-height: 60px;
  width: 100%;

  display: flex;
  align-items: center;
  padding: 8px 40px;
  border-bottom: 2px solid var(--neutral-200);
}
.player-import-content:nth-of-type(odd) {
  background: white;
}

.player-import-content:nth-of-type(1) {
  border-top: 2px solid var(--neutral-200);
  margin-top: 32px;
}
.player-import-content > input {
  margin-right: 12px;
  width: 15px;
  height: 15px;
}
.player-import-position {
  min-width: 50px;
  font-weight: bolder;
  margin-right: 32px;
}
</style>
