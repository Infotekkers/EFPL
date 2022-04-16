<template>
  <!-- Content -->
  <div class="team-import-container">
    <div class="team-import-content">
      <input type="checkbox" @change="teamCheckboxClicked" ref="teamCheckbox" />
      <div
        class="team-import-logo"
        :style="{
          'background-image': 'url(' + getTeamLogo + ')',
        }"
      ></div>

      <div class="team-import-name">{{ legacyTeam.teamName }}</div>

      <div class="team-import-city">{{ legacyTeam.teamCity }}</div>

      <div class="team-import-collapse-player" @click="togglePlayerComponent">
        <span v-if="showPlayerComponent == false"> S </span>
        <span v-else-if="showPlayerComponent == true">H</span>
      </div>
    </div>
    <PlayerImportComponent
      :teamId="legacyTeam.teamId"
      :show="showPlayerComponent"
    />
  </div>
  <!-- Content -->
</template>

<script>
import PlayerImportComponent from "@/components/PlayerImportComponent.vue";
import store from "@/store";
export default {
  name: "TeamImportComponent",
  components: {
    PlayerImportComponent,
  },
  data() {
    return {
      showPlayerComponent: false,
    };
  },
  props: {
    showModal: Boolean,
    legacyTeam: Object,
  },
  methods: {
    teamCheckboxClicked() {
      this.togglePlayerComponent();

      if (this.$refs.teamCheckbox.checked) {
        //   fetch players
        store.dispatch(
          "Season/getAllLegacyPlayersByTeam",
          this.legacyTeam.teamId
        );

        // add to selection
        store.dispatch("Season/setImportSelectedTeam", this.legacyTeam.teamId);
      } else {
        //   remove team
        const filtered = store.state.Season.importSelectedTeams.filter(
          (selectedTeam) => {
            return selectedTeam != this.legacyTeam.teamId;
          }
        );
        store.dispatch("Season/replaceImportSelectedTeam", filtered);

        // remove players
        const filteredPlayers = store.state.Season.importSelectedPlayers.filter(
          (selectedPlayer) => {
            return selectedPlayer.teamId != this.legacyTeam.teamId;
          }
        );

        store.dispatch("Season/replaceImportSelectedPlayer", filteredPlayers);
      }

      //   add/remove to selection
    },

    togglePlayerComponent() {
      this.showPlayerComponent = !this.showPlayerComponent;
    },
  },
  computed: {
    getTeamLogo() {
      const baseUrl = process.env.VUE_APP_API_BASE_URL;
      const team = this.legacyTeam.teamLogo;
      return baseUrl + team;
    },
  },
};
</script>

<style scoped>
.team-import-container {
  margin: 36px 20px;
  width: 85%;
  background: yellow;
}
.team-import-content {
  min-height: 70px;
  width: 100%;
  display: flex;
  align-items: center;
  padding: 10px 16px;
  /*  */
  background: tomato;
}
.team-import-content > input {
  margin-right: 12px;
  width: 20px;
  height: 20px;
}
.team-import-logo {
  width: 55px;
  height: 55px;
  margin-right: 20px;

  /* background: green; */
  background-size: contain;
  background-repeat: no-repeat;
  background-position: center;
}
.team-import-name {
  margin-right: 30px;
  background: red;
  min-width: 200px;
}
.team-import-city {
  min-width: 200px;
}
.team-import-collapse-player {
  margin-left: 300px;
}
</style>
