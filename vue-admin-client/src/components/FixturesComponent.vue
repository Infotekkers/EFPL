<template>
  <main class="fixtures-main-container">
    <!-- The add and edit modal - has emit handler -->
    <FixtureModalComponent
      v-show="showModal"
      @closeModal="showModal = false"
      :isEditMode="isEditMode"
    />

    <!-- No Connection -->
    <div v-if="connectionStatus === false">No connection</div>

    <!-- Loading Data -->
    <div v-else-if="isFixtureLoading">Loading</div>

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
          Ethiopian Premier League - {{ getSeason }} Fixtures
        </div>
        <div class="gameweek-add-new" @click="activateModal">
          <div>+</div>
          Add
        </div>
      </div>
      <!-- Title -->

      <!-- Header - Gameweek controls, add new & gameweek title -->
      <div class="gameweek-controller">
        <!-- Previous Game week button -->
        <div v-on="showingGameWeek == 1 ? {} : { click: prevGameWeek }">
          Prev
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
            Gameweek {{ showingGameWeek }}
          </div>
        </div>

        <!-- Next game week Button -->
        <div v-on="showingGameWeek == 30 ? {} : { click: nextGameWeek }">
          Next
        </div>

        <!-- Add New game week button -->
      </div>

      <!-- Content -->
      <div v-if="currentGWFixtures.length > 0" class="all-fixtures">
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
      <div v-else class="gameweek-no-fixtures">No Fixtures</div>
      <!-- If no fixtures -->
    </div>
    <!-- After Data Loaded -->
  </main>
</template>

<style scoped>
.fixtures-main-container {
  width: 82%;
  margin-left: 18%;
  min-height: 100vh;
  display: grid;
  place-items: center;
}
.gameweek-container {
  width: 90%;
  display: flex;
  flex-direction: column;
  align-items: center;
  border: 1px solid black;
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
}
.gameweek-title {
  font-size: var(--text-medium);
}
.gameweek-add-new {
  font-size: 16px;
  position: absolute;
  right: calc(10% - 12px);
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
.gameweek-date {
  margin-top: 12px;
  text-align: center;
  font-size: 20px;
}
.all-fixtures {
  width: 100%;
}
.gameweek-no-fixtures {
  width: 100%;
  min-height: 150px;
  display: grid;
  place-items: center;
}
</style>

<script>
// Utils
import store from "../store/index";

// Components
import FixtureComponent from "@/components/FixtureComponent";
import FixtureModalComponent from "@/components/FixtureModalComponent";

export default {
  name: "FixturesComponent",
  components: {
    FixtureComponent,
    FixtureModalComponent,
  },
  data() {
    return {
      showModal: false,
      isFixtureLoading: false,
      isTeamLoading: false,
      isEditMode: false,
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
      this.isFixtureLoading = false;

      // TODO: Remove Timer
      // setTimeout(() => {
      //   this.isFixtureLoading = false;
      // }, 4000);
    },

    // Get all teams
    getTeams() {
      //   Set Loader
      this.isTeamLoading = true;

      store.dispatch("Fixture/setAllTeams");

      this.isTeamLoading = false;

      // // TODO: Remove Timer
      // setTimeout(() => {
      //   this.isTeamLoading = false;
      // }, 6000);
    },

    // Event Handlers
    prevGameWeek() {
      const currentGW = store.state.Fixture.showingGameWeek;
      store.dispatch("Fixture/setShowingGameWeek", currentGW - 1);
    },

    nextGameWeek() {
      const currentGW = store.state.Fixture.showingGameWeek;
      store.dispatch("Fixture/setShowingGameWeek", currentGW + 1);
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
      const teamCount = store.state.Fixture.allTeams.length;

      const fixturesCount = store.state.Fixture.allFixtures.filter(
        (fixture) => {
          return fixture.gameweekId == this.showingGameWeek;
        }
      ).length;

      return teamCount === fixturesCount * 2 ? true : false;
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
    this.getFixtures();
    this.getTeams();
  },
};
</script>
