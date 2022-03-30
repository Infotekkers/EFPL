<template>
  <main class="teams-main-container">
    <!-- Modal -->
    <TeamModal
      v-show="showModal"
      @closeModal="closeModal"
      :isEditMode="isEditMode"
    />
    <!-- Modal -->

    <input
      type="text"
      class="team-search-bar"
      @keyup="searchBarFilter"
      placeholder="Search Term Here..."
      ref="searchBar"
    />

    <!-- Header -->
    <div class="teams-header-container">
      <!-- Title -->
      <div class="teams-title">
        Ethiopian Premier League - {{ getSeason }} Teams
      </div>

      <!-- Add Button -->
      <div class="teams-add-new" @click="activateModal">+</div>
    </div>
    <!-- Header -->

    <!-- Sorter Header -->
    <div class="teams-sorter-header">
      <div @click="sortByID" class="teams-id-sorter">ID</div>
      <div class="teams-logo-sorter">Logo</div>
      <div @click="sortByName" class="teams-name-sorter">Team Name</div>
      <div @click="sortByCity" class="teams-city-sorter">City</div>
      <div @click="sortbyStadium" class="teams-stadium-sorter">Stadium</div>
      <div @click="sortByFoundedDate" class="teams-founded-sorter">Year</div>
      <div class="teams-controls-sorter">Controls</div>
    </div>
    <!-- Sorter Header -->
    <div class="teams-container" v-if="getAllTeams.length > 0">
      <TeamComponent
        v-for="team in getAllTeams"
        :key="team.teamId"
        :team="team"
        @activateModalEdit="activateModalEdit"
      />
    </div>

    <!-- No items -->
    <div class="no-teams-container" v-else>No Teams</div>
  </main>
</template>

<style scoped>
.teams-main-container {
  /* background: var(--primary-400); */
  width: 82%;
  margin-left: 18%;
  padding: 100px 16px 60px 16px;
}
.team-search-bar {
  width: 20%;
  height: 32px;
  margin-left: 80%;
  padding: 0 3px;
  outline: none;
}
.teams-header-container {
  margin-top: var(--spacing-medium);
  width: 100%;
  display: flex;
  justify-content: center;
  align-items: center;

  /*  */
  position: relative;
  z-index: 1;
}
.teams-title {
  font-size: var(--text-medium);
}
.teams-add-new {
  font-size: 36px;
  font-weight: bold;
  position: absolute;
  right: 18%;
}
.teams-sorter-header {
  padding: 0 12px;
  margin: var(--spacing-large) 0;
  display: flex;
  justify-content: space-between;
  background: var(--primary-900);
  color: var(--primary-100);
  font-weight: 500;
  font-size: 20px;
}
.teams-id-sorter {
  width: 5%;
  min-width: 45px;
}
.teams-logo-sorter {
  width: 110px;
}
.teams-name-sorter {
  width: 20%;
  min-width: 130px;
}
.teams-city-sorter {
  min-width: 100px;
  width: 17%;
}
.teams-stadium-sorter {
  width: 16%;
}
.teams-founded-sorter {
  width: 8%;
}
.teams-controls-sorter {
  width: 10%;
}
.no-teams-container {
  margin-top: var(--spacing-xlarge);
  width: 100%;
  min-height: 200px;
  display: grid;
  place-items: center;
  font-weight: bold;
  font-size: var(--text-medium);
}
</style>

<script>
// Utils
import store from "../store/index";

// Components
import TeamComponent from "@/components/TeamComponent";
import TeamModal from "@/components/TeamModal";
export default {
  name: "TeamsComponent",
  components: {
    TeamComponent,
    TeamModal,
  },
  data() {
    return {
      showModal: false,
      isEditMode: false,
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
      this.showModal = false;
    },
    sortByID() {
      store.dispatch("Team/sortByID");
    },
    sortByName() {
      store.dispatch("Team/sortByName");
    },
    sortByCity() {
      store.dispatch("Team/sortByCity");
    },
    sortbyStadium() {
      store.dispatch("Team/sortByStadium");
    },

    sortByFoundedDate() {
      store.dispatch("Team/sortByFoundedDate");
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
  },

  beforeMount() {
    store.dispatch("Team/setAllTeams");
  },
};
</script>
