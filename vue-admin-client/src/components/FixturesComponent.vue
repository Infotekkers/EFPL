<template>
  <div class="fixtures-main-container">
    <!-- The add and edit modal - has emit handler -->
    <FixtureModalComponent
      v-show="showModal"
      @closeModal="showModal = false"
      :isEditMode="isEditMode"
    />

    <!-- No Connection -->
    <div v-if="connectionStatus === false">{{ $t("No Connection") }}</div>

    <!-- Loading Data -->
    <div v-else-if="isFixtureLoading">
      <SpinnerComponent />
    </div>

    <!-- After Data Loaded -->
    <div v-else class="gameweek-container">
      <!-- Search Bar -->
      <input
        type="text"
        class="fixture-search-bar"
        @keyup="searchBarFilter"
        placeholder="Search Term Here..."
        ref="searchBar"
      />
      <!-- Search Bar -->

      <!-- Title -->
      <div class="gameweek-main-header">
        <div class="gameweek-title">
          {{ $t("Ethiopian Premier League") }} - {{ getSeason }}
          {{ $t("Fixtures") }}
        </div>
        <div class="gameweek-add-new" @click="activateModal" data-cp="add-gw">
          <div>
            <img :src="addIcon.path" :alt="addIcon.alt" class="small-icon" />
          </div>
          {{ $t("Add") }}
        </div>
      </div>
      <!-- Title -->

      <div class="filter-container">
        <div class="filter-item">
          <label>{{ $t("All") }}</label>
          <input
            type="radio"
            @change="radioFilterChange"
            value="All"
            v-model="radioFilter"
          />
        </div>

        <div class="filter-item">
          <label>{{ $t("Scheduled") }}</label>
          <input
            type="radio"
            @change="radioFilterChange"
            value="scheduled"
            v-model="radioFilter"
          />
        </div>

        <div class="filter-item">
          <label>{{ $t("First Half") }}</label>
          <input
            type="radio"
            @change="radioFilterChange"
            v-model="radioFilter"
            value="liveFH"
          />
        </div>

        <div class="filter-item">
          <label>{{ $t("Half Time") }}</label>
          <input
            type="radio"
            @change="radioFilterChange"
            v-model="radioFilter"
            value="HT"
          />
        </div>

        <div class="filter-item">
          <label>{{ $t("Second Half") }}</label>
          <input
            type="radio"
            @change="radioFilterChange"
            v-model="radioFilter"
            value="liveSH"
          />
        </div>

        <div class="filter-item">
          <label>{{ $t("Full Time") }}</label>
          <input
            type="radio"
            @change="radioFilterChange"
            v-model="radioFilter"
            value="FT"
          />
        </div>
      </div>

      <!-- Header - Gameweek controls, add new & gameweek title -->
      <div class="gameweek-controller">
        <!-- Previous Game week button -->
        <div @click="prevGameWeek" class="navigator-button">
          <div>
            <img
              :src="nextLargeIcon.path"
              :alt="nextLargeIcon.alt"
              class="medium-icon"
            />
          </div>

          <div>
            {{ $t("Prev") }}
          </div>
        </div>

        <!-- Gameweek counter -->
        <div class="gameweek-controller-main">
          <div
            class="gameweek-complete-verifier"
            v-if="isGameWeekComplete === true"
          >
            ✅
          </div>
          <div class="gameweek-complete-verifier" v-else>❌</div>
          <div class="gameweek-controller-title">
            {{ $t("Game week") }} {{ showingGameWeek }}
          </div>
        </div>

        <!-- Next game week Button -->
        <div @click="nextGameWeek" class="navigator-button">
          <div>
            {{ $t("Next") }}
          </div>

          <div>
            <img
              :src="previousLargeIcon.path"
              :alt="previousLargeIcon.alt"
              class="medium-icon"
            />
          </div>
        </div>

        <!-- Add New game week button -->
      </div>

      <!-- Content -->
      <div
        v-if="
          currentGWFixtures.length > 0 &&
          allTeams.length >= currentGWFixtures.length / 2
        "
        class="all-fixtures"
      >
        <!-- Classify by dates -->
        <div v-for="(fixtureBatch, index) in currentGWFixtures" :key="index">
          <!-- Date of fixture -->
          <div class="gameweek-date">
            {{ formatDate[index] }}
          </div>

          <!-- Each Fixture  -->
          <div>
            <FixtureComponent
              v-for="fixture in fixtureBatch"
              :key="fixture.matchId"
              :fixture="fixture"
              :isTeamLoading="isTeamLoading"
              @activateModal="activateModalEdit"
            />
          </div>
          <!-- Each Fixture  -->
        </div>
        <!-- Classify by dates -->
      </div>
      <!-- Content -->

      <!-- If no fixtures -->
      <div v-else class="gameweek-no-fixtures">
        {{ $t("No") }} {{ $t("Fixtures") }}
      </div>
      <!-- If no fixtures -->
    </div>
    <!-- After Data Loaded -->
  </div>
</template>

<style scoped>
/* Icons */
.extra-small-icon,
.small-icon,
.medium-icon {
  height: fit-content;
  object-fit: contain;
}

.extra-small-icon {
  width: 7px;
}
.small-icon {
  width: 15px;
}
.medium-icon {
  width: 24px;
}

.fixtures-main-container {
  /* width: 100%; */
  /* margin-left: 18%; */
  min-height: 100vh;
  display: grid;
  place-items: center;
  /* padding: 100px 24px 60px 16px; */
}
.gameweek-container {
  width: 100%;
  display: flex;
  flex-direction: column;
  align-items: center;
  /* border: 1px solid black; */
  padding: 24px 14px 24px 14px;
}
.fixture-search-bar {
  width: 20%;
  height: 32px;
  margin-left: 80%;
  padding: 0 3px;
  outline: none;
}
.gameweek-main-header {
  margin-top: var(--spacing-medium);
  display: flex;
  justify-content: center;
  align-items: center;
  width: 100%;
  position: relative;
}
.gameweek-title {
  font-size: var(--text-medium);
}
.gameweek-add-new {
  font-size: 16px;
  position: absolute;
  right: 0;
  background: var(--primary-900);
  padding: 5px 22px 5px 16px;
  color: var(--neutral-100);
  display: flex;
}
.gameweek-add-new > div {
  width: 20px;
  height: 20px;
  background: var(--primary-800);
  border-radius: 50%;
  display: grid;
  place-items: center;
  margin-right: 6px;
}
.filter-container {
  margin-top: 32px;
  width: 100%;
  min-height: 60px;

  /*  */
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding-right: 30%;
}
.filter-item {
  display: flex;
  align-items: center;
}
.filter-item > label {
  font-size: 14px;
}
.filter-item > input {
  margin-left: 5px;
}
.gameweek-controller {
  margin: var(--spacing-medium) 0 var(--spacing-regular) 0;
  display: flex;
  justify-content: space-between;
  font-weight: 500;
  font-size: 15px;
  color: var(--neutral-700);
  width: 100%;
}

.gameweek-controller-main {
  display: flex;
  align-items: center;
  font-size: 18px;
  color: var(--neutral-900);
}
.gameweek-complete-verifier {
  margin-right: 6px;
}
.gameweek-controller > div:nth-of-type(odd) {
  font-weight: 400;
  border: 1px solid black;
  padding: 2px 8px;
  cursor: pointer;
}
.navigator-button {
  width: 30%;
  min-height: 32px;
  padding: 12px 60px;
  display: flex;
  align-items: center;
  justify-content: space-between;
}
.gameweek-date {
  margin-top: 42px;
  text-align: center;
  font-size: 20px;
}
.all-fixtures {
  width: 100%;
}
.gameweek-no-fixtures {
  margin-top: var(--spacing-xlarge);
  width: 100%;
  min-height: 200px;
  display: grid;
  place-items: center;
  font-weight: bold;
  font-size: var(--text-medium);
}

/* Super Small Screen */
@media screen and (max-width: 400px) {
  .fixtures-main-container {
    display: none;
  }
}

/* Small Screens */
@media screen and (min-width: 401px) and (max-width: 576px) {
  .gameweek-title {
    font-size: 22px;
    transform: translateX(-32px);
  }
  .filter-container {
    padding-right: 10%;
  }
  .filter-item {
    font-size: 15px;
  }
}

@media screen and (min-width: 577px) and (max-width: 768px) {
  .gameweek-title {
    font-size: 22px;
    transform: translateX(-32px);
  }
  .filter-container {
    padding-right: 10%;
  }
  .filter-item {
    font-size: 15px;
  }
}

@media screen and (min-width: 769px) and (max-width: 1200px) {
  .gameweek-title {
    font-size: 22px;
    transform: translateX(-32px);
  }
  .filter-container {
    padding-right: 10%;
  }
  .filter-item {
    font-size: 16px;
  }
}

@media screen and (min-width: 1400px) {
  .filter-container {
    padding-right: 20vw;
  }
  .filter-item {
    font-size: 18px;
  }
}
</style>

<script>
// Utils
import store from "../store/index";

// Components
import FixtureComponent from "@/components/FixtureComponent";
import FixtureModalComponent from "@/components/FixtureModalComponent";
import SpinnerComponent from "@/components/SpinnerComponent.vue";

// Icons
import {
  addIcon,
  playIcon,
  pauseIcon,
  stopIcon,
  editIcon,
  deleteIcon,
  nextLargeIcon,
  previousLargeIcon,
} from "@/utils/Icons";

export default {
  name: "FixturesComponent",
  components: {
    FixtureComponent,
    FixtureModalComponent,
    SpinnerComponent,
  },
  data() {
    return {
      showModal: false,
      isFixtureLoading: false,
      isTeamLoading: false,
      isEditMode: false,
      radioFilter: "All",

      // Icons
      addIcon: addIcon,
      playIcon: playIcon,
      pauseIcon: pauseIcon,
      stopIcon: stopIcon,
      editIcon: editIcon,
      deleteIcon: deleteIcon,
      nextLargeIcon: nextLargeIcon,
      previousLargeIcon: previousLargeIcon,
    };
  },

  methods: {
    // Activate modal for Add Mode -> Add New Fixture
    activateModal() {
      // Disable edit mode
      this.isEditMode = false;
      this.showModal = true;
    },

    // Activate modal for Edit Mode -> Edit fixture
    activateModalEdit() {
      this.isEditMode = true;
      this.showModal = true;
    },

    // fetch all fixtures
    getFixtures() {
      //   Set Loader
      this.isFixtureLoading = true;

      // Dispatch Store Action
      store.dispatch("Fixture/setAllFixtures");
      // this.isFixtureLoading = false;
      this.isFixtureLoading = false;
    },
    getActiveGameWeek() {
      //   Set Loader
      this.isFixtureLoading = true;

      // Dispatch Store Action
      store.dispatch("Fixture/getActiveGameWeek");
      // this.isFixtureLoading = false;

      this.isFixtureLoading = false;
    },

    // Get all teams
    getTeams() {
      //   Set Loader
      this.isTeamLoading = true;

      store.dispatch("Fixture/setAllTeams");

      // this.isTeamLoading = false;
      this.isTeamLoading = false;
    },

    // Event Handlers
    prevGameWeek() {
      const currentGW = store.state.Fixture.showingGameWeek;

      const maxGWCount =
        store.state.Fixture.allTeams.length > 0
          ? (store.state.Fixture.allTeams.length - 1) * 2
          : 1;

      currentGW == 1
        ? store.dispatch("Fixture/setShowingGameWeek", maxGWCount)
        : store.dispatch("Fixture/setShowingGameWeek", currentGW - 1);
    },

    nextGameWeek() {
      const currentGW = store.state.Fixture.showingGameWeek;
      const maxGWCount =
        store.state.Fixture.allTeams.length > 0
          ? (store.state.Fixture.allTeams.length - 1) * 2
          : 1;

      currentGW === maxGWCount
        ? store.dispatch("Fixture/setShowingGameWeek", 1)
        : store.dispatch("Fixture/setShowingGameWeek", currentGW + 1);
    },

    searchBarFilter() {
      const searchTerm = this.$refs.searchBar.value;
      store.dispatch("Fixture/filterByTerm", searchTerm);
      this.getFixtures;
    },

    radioFilterChange() {
      store.dispatch("Fixture/filterByMatchStatus", this.radioFilter);
    },
  },

  computed: {
    connectionStatus() {
      return store.state.Global.connection;
    },

    getSeason() {
      const date = new Date().getFullYear().toString().split("");

      return date[2] + (date[3] - 1) + "/" + date[2] + date[3];
    },

    // get current gameweek
    showingGameWeek() {
      return store.state.Fixture.showingGameWeek;
    },

    isGameWeekComplete() {
      // get number of teams
      const teamCount = store.state.Fixture.allTeams.length;

      // count gameweek for current GW
      const fixturesCount = store.state.Fixture.allFixturesUnfiltered.filter(
        (fixture) => {
          return fixture.gameweekId == this.showingGameWeek;
        }
      ).length;

      // number of fixtures should be more than 0 and 2 * number of teams
      return teamCount <= fixturesCount * 2 && fixturesCount > 0 ? true : false;
    },

    // filter gameweek fixtures by date for display
    currentGWFixtures() {
      // Filter only current gw fixtures
      const currentGW = store.state.Fixture.showingGameWeek;
      const allFixtures = store.state.Fixture.allFixtures;
      const filtered = allFixtures.filter((fixture) => {
        return fixture.gameweekId == currentGW;
      });

      // get all possible fixture dates
      let allDates = [];
      filtered.forEach((fixture) => {
        const date = fixture.schedule.split("T")[0];
        if (!allDates.includes(date)) {
          allDates.push(date);
        }
      });
      let formattedAndFiltered = [];
      allDates.forEach((date) => {
        let fix = filtered.filter((fixture) => {
          return fixture.schedule.split("T")[0] === date;
        });

        formattedAndFiltered.push(fix);
      });
      return formattedAndFiltered;
    },

    allTeams() {
      return store.state.Fixture.allTeams;
    },

    // format date to readable format
    formatDate() {
      const days = [
        "Monday",
        "Tuesday",
        "Wednesday",
        "Thursday",
        "Friday",
        "Saturday",
        "Sunday",
      ];
      const months = [
        "January",
        "February",
        "March",
        "April",
        "May",
        "June",
        "July",
        "August",
        "September",
        "October",
        "November",
        "December",
      ];

      const currentGW = store.state.Fixture.showingGameWeek;
      const allFixtures = store.state.Fixture.allFixtures;
      const filtered = allFixtures.filter((fixture) => {
        return fixture.gameweekId == currentGW;
      });

      // get all possible fixture dates
      let allDates = [];

      filtered.forEach((fixture) => {
        const date = fixture.schedule.split("T")[0];
        if (!allDates.includes(date)) {
          allDates.push(date);
        }
      });

      let allFormattedDates = [];
      allDates.forEach((date) => {
        const value = new Date(date);
        const fullDate = `${days[value.getDay()]} ${value.getDate()} ${
          months[value.getMonth()]
        } ${value.getFullYear()}`;

        allFormattedDates.push(fullDate);
      });

      return allFormattedDates;
    },

    //
    cache() {
      return store.state.Fixture.tempCache;
    },
  },

  // get data before component mounts
  beforeMount() {
    this.getActiveGameWeek();
    this.getFixtures();
    this.getTeams();
  },
};
</script>
