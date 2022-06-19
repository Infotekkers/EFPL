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
      <div class="fixtures-control">
        <div class="filter-group">
          <h3>Find fixtures</h3>
          <!-- Search Bar -->
          <input
            type="search"
            class="fixture-search-bar"
            @keyup="searchBarFilter"
            placeholder="Start typing..."
            ref="searchBar"
          />
        </div>
        <!-- Search Bar -->
        <!-- Header - Gameweek controls, add new & gameweek title -->
        <div class="filter-group">
          <h3>Change gameweek</h3>
          <div class="gameweek-controller">
            <!-- Previous Game week button -->
            <div @click="prevGameWeek" class="navigator-button">
              <img :src="nextLargeIcon.path" :alt="nextLargeIcon.alt" />
            </div>
            <!-- Gameweek counter -->
            <div class="gameweek-controller-main">
              <div class="gameweek-dropdown" @click="toggleOptions">
                <div class="selected-gw">
                  {{ $t("Game week") }} {{ showingGameWeek }}
                  <div
                    class="gameweek-complete-verifier"
                    v-if="isGameWeekComplete === true"
                  >
                    ✅
                  </div>
                  <div class="gameweek-complete-verifier" v-else>❌</div>
                </div>
                <div
                  class="gameweek-dropdown-options"
                  v-if="revealDropDownOptions"
                >
                  <div
                    class="gameweek-dropdown-option"
                    v-for="(gw, index) of numberOfGameweeks"
                    v-bind:key="index"
                    @click="setShowingGameweek(index + 1)"
                  >
                    {{ $t("Game week") }} {{ index + 1 }}
                  </div>
                </div>
              </div>
            </div>

            <!-- Next game week Button -->
            <div @click="nextGameWeek" class="navigator-button">
              <img :src="previousLargeIcon.path" :alt="previousLargeIcon.alt" />
            </div>
            <!-- Add New game week button -->
          </div>
        </div>

        <div class="filter-group">
          <h3>Filter by status</h3>
          <div class="filter-container">
            <div class="filter-item">
              <input
                type="radio"
                id="all"
                @change="radioFilterChange"
                value="All"
                v-model="radioFilter"
              />
              <label for="all">{{ $t("All") }}</label>
            </div>
            <div class="filter-item">
              <input
                type="radio"
                id="scheduled"
                @change="radioFilterChange"
                value="scheduled"
                v-model="radioFilter"
              />
              <label for="scheduled">{{ $t("Scheduled") }}</label>
            </div>
            <div class="filter-item">
              <input
                type="radio"
                id="liveFH"
                @change="radioFilterChange"
                v-model="radioFilter"
                value="liveFH"
              />
              <label for="liveFH">{{ $t("First Half") }}</label>
            </div>
            <div class="filter-item">
              <input
                type="radio"
                id="HT"
                @change="radioFilterChange"
                v-model="radioFilter"
                value="HT"
              />
              <label for="HT">{{ $t("Half Time") }}</label>
            </div>
            <div class="filter-item">
              <input
                type="radio"
                id="liveSH"
                @change="radioFilterChange"
                v-model="radioFilter"
                value="liveSH"
              />
              <label for="liveSH">{{ $t("Second Half") }}</label>
            </div>
            <div class="filter-item">
              <input
                type="radio"
                id="FT"
                @change="radioFilterChange"
                v-model="radioFilter"
                value="FT"
              />
              <label for="FT">{{ $t("Full Time") }}</label>
            </div>
          </div>
        </div>
      </div>

      <!-- Content -->
      <div class="fixtures-content">
        <div class="gameweek-title">
          {{ $t("Ethiopian Premier League") }} - {{ getSeason }}
          {{ $t("Fixtures") }}
        </div>
        <div class="gameweek-add-new" @click="activateModal" data-cp="add-gw">
          <!-- <div>
            <img :src="addIcon.path" :alt="addIcon.alt" class="small-icon" />
          </div> -->
          {{ $t("Add") }}
        </div>
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
    </div>

    <!-- After Data Loaded -->
  </div>
</template>

<style scoped>
.gameweek-dropdown {
  width: 100%;
  cursor: pointer;

  padding: var(--spacing-xsmall) var(--spacing-base);
  background: var(--neutral-400);

  position: relative;
}

.gameweek-dropdown-options {
  position: absolute;
  top: 100%;
  left: 0;
  width: 100%;

  margin-top: var(--spacing-3xsmall);
  height: 200px;
  overflow: auto;
}

.gameweek-dropdown-option {
  padding: var(--spacing-xsmall) var(--spacing-base);
  background: var(--neutral-300);
  margin-bottom: var(--spacing-3xsmall);
}

.navigator-button {
  padding: var(--spacing-xsmall);
  background: var(--neutral-300);

  display: flex;
  align-items: center;
}

.navigator-button img {
  width: var(--text-base);
}

input[type="radio"] {
  display: none;
}

input[type="radio"] + label {
  padding: var(--spacing-xsmall) var(--spacing-small);
  font-size: var(--text-base);
  display: block;
  width: 100%;

  text-align: center;
}

input[type="radio"]:checked + label {
  background: var(--neutral-400);
}

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
  min-height: 100vh;
}
.gameweek-container {
  display: grid;
  grid-template-columns: 300px minmax(900px, 1fr);
  /* border: 1px solid black; */
  padding: 24px 14px 24px 14px;
}

h3 {
  text-align: left;
  font-size: var(--text-small);
  font-weight: 400;
  margin-bottom: var(--spacing-2xsmall);
}

.fixtures-control,
.fixtures-content {
  padding: var(--spacing-small);
}

.fixtures-content {
  background: var(--neutral-50);
  padding-bottom: var(--spacing-large);

  overflow: auto;
}

.filter-group {
  margin: var(--spacing-regular) 0;
}

.filter-group:first-child {
  margin-top: 0;
}

.fixture-search-bar {
  width: 100%;
  max-width: 600px;
  margin: 0 auto;

  padding: var(--spacing-small) var(--spacing-xsmall);
  outline: none;
  border: none;
  border-bottom: var(--spacing-3xsmall) solid var(--neutral-900);

  background: var(--neutral-400);
  font-size: var(--text-base);
}

.fixture-search-bar::placeholder {
  color: var(--neutral-900);
}

.gameweek-main-header {
  margin-top: var(--spacing-medium);
  display: flex;
  justify-content: center;
  align-items: stretch;
}
.gameweek-title {
  font-size: var(--text-medium);
}
.gameweek-add-new {
  font-size: var(--text-base);
  padding: var(--spacing-small) 0;

  margin: var(--spacing-small) 0;
  margin-left: auto;

  width: 100px;

  color: var(--neutral-50);
  cursor: pointer;
  background: var(--primary-900);
  box-shadow: 0 2px 0 var(--primary-400);
  border-radius: var(--spacing-2xsmall);
}

.gameweek-add-new:hover {
  color: var(--primary-900);
  background: var(--primary-200);
}

.filter-container {
  display: flex;
  flex-direction: column;
  justify-content: space-between;
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
  display: flex;
  justify-content: space-between;
  align-items: stretch;
  font-weight: 500;
  font-size: var(--text-base);
  color: var(--neutral-700);
  width: 100%;
}

.gameweek-controller-main {
  font-size: 18px;
  color: var(--neutral-900);
  flex-grow: 1;
}
.gameweek-complete-verifier {
  margin-right: 6px;
  display: inline;
}
.gameweek-controller > div:nth-of-type(odd) {
  font-weight: 400;
  cursor: pointer;
}

.gameweek-date {
  margin-top: 42px;
  text-align: center;
  font-size: 20px;
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

      numberOfGameweeks: [...new Array(30)],
      revealDropDownOptions: false,

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

    toggleOptions() {
      this.revealDropDownOptions = !this.revealDropDownOptions;
    },

    setShowingGameweek(index) {
      store.dispatch("Fixture/setShowingGameWeek", index);
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
