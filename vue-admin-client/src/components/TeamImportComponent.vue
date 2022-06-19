<template>
  <!-- Content -->
  <div class="team-import-container">
    <div class="team-import-content">
      <!-- Checkbox -->
      <input type="checkbox" @change="teamCheckboxClicked" ref="teamCheckbox" />
      <!-- Checkbox -->

      <!-- Logo -->
      <div
        class="team-import-logo"
        :style="{
          'background-image': 'url(' + getTeamLogo + ')',
        }"
      ></div>
      <!-- Logo -->

      <!-- TeamName -->
      <div class="team-import-name">{{ legacyTeam.teamName }}</div>
      <!-- TeamName -->

      <!-- Team City -->
      <div class="team-import-city">{{ legacyTeam.teamCity }}</div>
      <!-- Team City -->

      <!-- Collapse/Expand Button -->
      <div class="team-import-collapse-player" @click="togglePlayerComponent">
        <!-- Expand Button -->
        <span v-if="showPlayerComponent == false">
          <img
            :src="expandIcon.path"
            :alt="expandIcon.alt"
            class="small-icon"
          />
        </span>
        <!-- Expand Button -->

        <!-- Collapse Button -->
        <span v-else-if="showPlayerComponent == true">
          <img
            :src="collapseIcon.path"
            :alt="collapseIcon.alt"
            class="small-icon"
          />
        </span>
        <!-- Collapse Button -->
      </div>
    </div>
    <PlayerImportComponent
      :teamName="legacyTeam.teamName"
      :show="showPlayerComponent"
      :check="checkPlayers"
    />
  </div>
  <!-- Content -->
</template>

<script>
import PlayerImportComponent from "@/components/PlayerImportComponent.vue";
import store from "@/store";

// Icons
import { collapseIcon, expandIcon } from "@/utils/Icons";
export default {
  name: "TeamImportComponent",
  components: {
    PlayerImportComponent,
  },
  data() {
    return {
      showPlayerComponent: false,
      checkPlayers: false,

      // Icons
      collapseIcon: collapseIcon,
      expandIcon: expandIcon,
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
        // store.dispatch(
        //   "Season/getAllLegacyPlayersByTeam",
        //   this.legacyTeam.teamName
        // );

        // add to selection
        store.dispatch(
          "Season/setImportSelectedTeam",
          this.legacyTeam.teamName
        );

        // check team players
        // this.checkPlayers = true;
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
            return selectedPlayer.teamId != this.legacyTeam.teamName;
          }
        );

        store.dispatch("Season/replaceImportSelectedPlayer", filteredPlayers);
      }

      this.checkPlayers = false;
    },

    togglePlayerComponent() {
      // this.showPlayerComponent = !this.showPlayerComponent;
    },
  },
  computed: {
    getTeamLogo() {
      const baseUrl = process.env.VUE_APP_API_BASE_URL;
      const team = this.legacyTeam.teamLogo;
      return baseUrl + team;
    },

    isChecked() {
      const allSelectedLegacyTeams = store.state.Season.importSelectedTeams;

      const checkStatus = allSelectedLegacyTeams.filter((legacyTeam) => {
        return legacyTeam.teamName == this.legacyTeam.teamName;
      });

      return checkStatus.length > 0;
    },
  },
};
</script>

<style scoped>
/* Icon */
.small-icon {
  width: 15px;
  height: 15px;
  object-fit: contain;
}
.team-import-container {
  margin: 0px 20px;
  padding: 8px 0;
  width: 100%;
  border-bottom: 2px solid var(--neutral-200);
  color: var(--neutral-900);
}
.team-import-container:nth-of-type(odd) {
  background: var(--neutral-100);
}
.team-import-container:nth-of-type(1) {
  margin-top: 32px;
}
.team-import-content {
  min-height: 70px;
  width: 100%;
  display: flex;
  align-items: center;
  padding: 10px 16px;
}
.team-import-content > input {
  margin-right: 12px;
  width: 20px;
  height: 20px;
}
.team-import-logo {
  width: 40px;
  height: 40px;
  margin-right: 20px;
  background-size: contain;
  background-repeat: no-repeat;
  background-position: center;
}
.team-import-name {
  font-size: 16px;
  margin-right: 30px;
  min-width: 200px;
}
.team-import-city {
  min-width: 200px;
}
.team-import-collapse-player {
  margin-left: 300px;
}
</style>
