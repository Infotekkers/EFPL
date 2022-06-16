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
        {{ $t("Ethiopian Premier League") }} - {{ getSeason }} {{ $t("Teams") }}
      </div>

      <!-- Add Button -->
      <div class="teams-add-new" @click="activateModal">
        <div>
          <img :src="addIcon.path" :alt="addIcon.alt" class="small-icon" />
        </div>
        {{ $t("Add") }}
      </div>
    </div>
    <!-- Header -->

    <!-- Sorter Header -->
    <div class="teams-sorter-header">
      <!-- ID -->
      <div class="teams-id-sorter">
        <span @click="sortByID(-1)">
          <img
            :src="sortDownIcon.path"
            :alt="sortDownIcon.alt"
            class="extra-small-icon"
          />
        </span>
        <span class="sorter-content">
          {{ $t("ID") }}
        </span>
        <span @click="sortByID(1)">
          <img
            :src="sortUpIcon.path"
            :alt="sortUpIcon.alt"
            class="extra-small-icon"
          />
        </span>
      </div>

      <!-- ID -->
      <div class="teams-logo-sorter">{{ $t("Logo") }}</div>

      <!-- Name -->
      <div class="teams-name-sorter">
        <span @click="sortByName(-1)">
          <img
            :src="sortDownIcon.path"
            :alt="sortDownIcon.alt"
            class="extra-small-icon"
          />
        </span>
        <span class="sorter-content">
          {{ $t("Team") }}
        </span>
        <span @click="sortByName(1)">
          <img
            :src="sortUpIcon.path"
            :alt="sortUpIcon.alt"
            class="extra-small-icon"
          />
        </span>
      </div>
      <!-- Name -->

      <!-- City -->
      <div class="teams-city-sorter">
        <span @click="sortByCity(-1)">
          <img
            :src="sortDownIcon.path"
            :alt="sortDownIcon.alt"
            class="extra-small-icon"
        /></span>
        <span class="sorter-content"> {{ $t("City") }}</span>
        <span @click="sortByCity(1)">
          <img
            :src="sortUpIcon.path"
            :alt="sortUpIcon.alt"
            class="extra-small-icon"
          />
        </span>
      </div>
      <!-- City -->

      <!-- Stadium -->
      <div class="teams-stadium-sorter">
        <span @click="sortbyStadium(-1)">
          <img
            :src="sortDownIcon.path"
            :alt="sortDownIcon.alt"
            class="extra-small-icon"
          />
        </span>
        <span class="sorter-content"> {{ $t("Stadium") }}</span>
        <span @click="sortbyStadium(1)">
          <img
            :src="sortUpIcon.path"
            :alt="sortUpIcon.alt"
            class="extra-small-icon"
          />
        </span>
      </div>
      <!-- Stadium -->

      <!-- Date -->
      <div class="teams-founded-sorter">
        <span @click="sortByFoundedDate(-1)">
          <img
            :src="sortDownIcon.path"
            :alt="sortDownIcon.alt"
            class="extra-small-icon"
          />
        </span>
        <span class="sorter-content"> {{ $t("Year") }}</span>
        <span @click="sortByFoundedDate(1)">
          <img
            :src="sortUpIcon.path"
            :alt="sortUpIcon.alt"
            class="extra-small-icon"
          />
        </span>
      </div>

      <!-- Date -->
      <div class="teams-controls-sorter">{{ $t("Controls") }}</div>
    </div>
    <!-- Sorter Header -->
    <div
      class="teams-container"
      v-if="getAllTeams.length > 0 && isTeamLoading == false"
    >
      <TeamComponent
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

    <!-- Loading -->
    <div v-else-if="isTeamLoading == true" class="no-teams-container">
      <SpinnerComponent />
    </div>
  </main>
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
.teams-main-container {
  width: 100%;
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
  font-size: 16px;
  position: absolute;
  right: 0%;
  background: var(--primary-900);
  padding: 5px 22px 5px 16px;
  color: var(--neutral-100);
  display: flex;
}

.teams-add-new > div {
  width: 20px;
  height: 20px;
  background: var(--primary-800);
  border-radius: 50%;
  display: grid;
  place-items: center;
  margin-right: 6px;
}
.teams-sorter-header {
  padding: 0 12px;
  margin: var(--spacing-xlarge) 0 var(--spacing-regular) 0;
  display: flex;
  justify-content: space-between;
  font-weight: 500;
  font-size: 15px;
  color: var(--neutral-700);
}
.teams-id-sorter,
.teams-name-sorter,
.teams-city-sorter,
.teams-stadium-sorter,
.teams-founded-sorter {
  display: flex;
  align-items: center;
}
.teams-id-sorter {
  width: 5%;
  min-width: 45px;
}
.sorter-content {
  margin-right: 8px;
  margin-left: 8px;
}
.teams-id-sorter > span,
.teams-name-sorter > span,
.teams-city-sorter > span,
.teams-stadium-sorter > span,
.teams-founded-sorter > span {
  display: flex;
  align-items: center;
  cursor: pointer;
  height: 100%;
  min-width: 10px;
}
.teams-logo-sorter {
  width: 60px;
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
  width: 18%;
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
import {
  sortUpIcon,
  sortDownIcon,
  addIcon,
  editIcon,
  deleteIcon,
} from "@/utils/Icons";

// Components
import TeamComponent from "@/components/TeamComponent";
import TeamModal from "@/components/TeamModalComponent";
import SpinnerComponent from "@/components/SpinnerComponent.vue";
export default {
  name: "TeamsComponent",
  components: {
    TeamComponent,
    TeamModal,
    SpinnerComponent,
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

    sortByFoundedDate(order) {
      store.dispatch("Team/sortByFoundedDate", order);
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
    this.isTeamLoading = true;
    store.dispatch("Team/setAllTeams");

    setTimeout(() => {
      this.isTeamLoading = false;
    }, 2000);

    // activate modal if required -> when routed from fixtures page
    if (this.$route.query.modal == 1) {
      this.showModal = true;
      this.$router.replace({ modal: null });
    }
  },
};
</script>
