<template>
  <main>
    <div class="stats-cards">
      <EPLStatsComponent :statArray="topScorers || []" statType="goals" />
      <EPLStatsComponent :statArray="mostAssists || []" statType="assists" />
      <EPLStatsComponent
        :statArray="mostCleanSheets || []"
        statType="cleanSheets"
      />
      <EPLStatsComponent :statArray="mostSaves || []" statType="saves" />
      <EPLStatsComponent :statArray="mostReds || []" statType="reds" />
      <EPLStatsComponent :statArray="mostYellows || []" statType="yellows" />
      <EPLStatsComponent
        :statArray="mostMinutesPlayed || []"
        statType="minutesPlayed"
      />
    </div>
    <!-- Header -->
    <div class="teams-header-container">
      <!-- Title -->
      <div class="teams-title">
        {{ $t("Ethiopian Premier League") }} - {{ getSeason }}
        {{ $t("Teams") }}
      </div>
    </div>
    <!-- Header -->

    <!-- Sorter Header -->
    <div class="teams-sorter-header">
      <div class="teams-id-header">
        {{ $t("ID") }}
      </div>

      <div class="teams-logo-header"></div>

      <div class="teams-team-header">{{ $t("Teams") }}</div>

      <div class="teams-gf-header">{{ $t("GF") }}</div>

      <div class="teams-ga-header">{{ $t("GA") }}</div>

      <div class="teams-gd-header">{{ $t("GD") }}</div>

      <div class="teams-won-header">{{ $t("Won") }}</div>

      <div class="teams-draw-header">{{ $t("Draw") }}</div>

      <div class="teams-lost-header">{{ $t("Lost") }}</div>

      <div class="teams-pts-header">{{ $t("Points") }}</div>
    </div>
    <!-- Sorter Header -->
    <div
      class="teams-container"
      v-if="getAllTeams.length > 0 && isTeamLoading == false"
    >
      <DashLeagueTableComponent
        v-for="team in getAllTeams"
        :key="team.teamId"
        :team="team"
        @activateModalEdit="activateModalEdit"
      />
    </div>

    <!-- No items -->
    <div
      class="no-teams-container"
      v-else-if="getAllTeams.length == 0 && isTeamLoading == false"
    >
      {{ $t("No") }} {{ $t("Teams") }}
    </div>
    <div v-else-if="isTeamLoading == true" class="no-teams-container">
      <SpinnerComponent />
    </div>
    <!-- Loading -->
  </main>
</template>
<script>
// Utils
import store from "../store/index";
import {
  sortUpIcon,
  sortDownIcon,
  addIcon,
  editIcon,
  deleteIcon,
} from "@/utils/Icons";

// Components
// import TeamComponent from "@/components/TeamComponent";
import DashLeagueTableComponent from "@/components/dashLeagueTableComponent";
import SpinnerComponent from "@/components/SpinnerComponent.vue";
import EPLStatsComponent from "@/components/EPLStatsComponent.vue";

export default {
  name: "TeamsComponent",
  components: {
    DashLeagueTableComponent,
    SpinnerComponent,
    EPLStatsComponent,
  },
  data() {
    return {
      showModal: false,
      isEditMode: false,
      isTeamLoading: true,

      // Icons
      sortUpIcon: sortUpIcon,
      sortDownIcon: sortDownIcon,
      addIcon: addIcon,
      editIcon: editIcon,
      deleteIcon: deleteIcon,
    };
  },

  methods: {
    searchBarFilter() {
      const searchTerm = this.$refs.searchBar.value;
      store.dispatch("Team/filterByTerm", searchTerm);
      this.getAllTeams;
    },
    // Event Handlers
    activateModal() {
      this.isEditMode = false;
      this.showModal = true;
    },
    activateModalEdit() {
      this.isEditMode = true;
      this.showModal = true;
    },
    closeModal() {
      this.isEditMode = false;
      this.showModal = false;
    },
    sortByID(order) {
      store.dispatch("Team/sortByID", order);
    },
    sortByName(order) {
      store.dispatch("Team/sortByName", order);
    },
    sortByCity(order) {
      store.dispatch("Team/sortByCity", order);
    },
    sortbyStadium(order) {
      store.dispatch("Team/sortByStadium", order);
    },
    sortByPoint(order) {
      store.dispatch("Team/sortByPoint", order);
    },
    sortByFoundedDate(order) {
      store.dispatch("Team/sortByFoundedDate", order);
    },

    getEPLStatsFromAPI() {
      store.dispatch("EPLStats/getEPLStats");
    },
  },

  computed: {
    getSeason() {
      const date = new Date().getFullYear().toString().split("");

      return date[2] + (date[3] - 1) + "/" + date[2] + date[3];
    },

    getAllTeams() {
      return store.state.Team.allTeams;
    },

    topScorers() {
      return store.state.EPLStats.allStats.topScorers;
    },

    mostAssists() {
      return store.state.EPLStats.allStats.mostAssists;
    },

    mostCleanSheets() {
      return store.state.EPLStats.allStats.mostCleanSheets;
    },

    mostSaves() {
      return store.state.EPLStats.allStats.mostSaves;
    },

    mostYellows() {
      return store.state.EPLStats.allStats.mostYellows;
    },

    mostReds() {
      return store.state.EPLStats.allStats.mostReds;
    },

    mostMinutesPlayed() {
      return store.state.EPLStats.allStats.mostMinutesPlayed;
    },
  },

  beforeMount() {
    this.isTeamLoading = true;
    store.dispatch("Team/setAllTeams");
    store.dispatch("Player/sortByPosition");
    setTimeout(() => {
      this.isTeamLoading = false;
    }, 2000);

    // activate modal if required -> when routed from fixtures page
    if (this.$route.query.modal == 1) {
      this.showModal = true;
      this.$router.replace({ modal: null });
    }

    // get stats
    this.getEPLStatsFromAPI();
  },
};
</script>
<style scoped>
.stats-cards {
  display: flex;
  justify-content: space-around;
  flex-wrap: wrap;
}
</style>
