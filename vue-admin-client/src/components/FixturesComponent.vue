<template>
  <div class="container">
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
      <!-- Header - Gameweek controls, add new & gameweek title -->
      <div class="gameweek-header">
        <!-- Previous Game week button -->
        <span v-on="showingGameWeek == 1 ? {} : { click: prevGameWeek }"
          >Prev</span
        >

        <!-- Gameweek counter -->
        <span> Gameweek {{ showingGameWeek }}</span>

        <!-- Next game week Button -->
        <span v-on="showingGameWeek == 30 ? {} : { click: nextGameWeek }"
          >Next</span
        >

        <!-- Add New game week button -->
        <span @click="activateModal">Add New</span>
      </div>

      <!-- Content -->
      <div v-if="currentGWFixtures.length > 0">
        <!-- Classify by dates -->
        <div v-for="(fixtureBatch, index) in currentGWFixtures" :key="index">
          <!-- Date of fixture -->
          <div class="date">
            {{ formatDate[index] }}
          </div>

          <!-- Each Fixture  -->
          <FixtureComponent
            v-for="fixture in fixtureBatch"
            :key="fixture.matchId"
            :fixture="fixture"
            :isTeamLoading="isTeamLoading"
            @activateModal="activateModalChild"
          />
          <!-- Each Fixture  -->
        </div>
        <!-- Classify by dates -->
      </div>
      <!-- Content -->

      <!-- If no fixtures -->
      <div v-else>No Fixtures</div>
      <!-- If no fixtures -->
    </div>
    <!-- After Data Loaded -->
  </div>
</template>

<style scoped>
.container {
  width: 100%;
  min-height: 100vh;
  display: grid;
  place-items: center;
}

.gameweek-container {
  width: 900px;
  min-height: 200px;
  /* background: grey; */
  display: flex;
  flex-direction: column;
  align-items: center;
  border: 1px solid black;
  padding: 12px 12px 24px 12px;
}
.gameweek-header {
  width: 98%;
  padding-top: 12px;
  font-weight: bold;
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  /* background: teal; */
  /* align-items: space-between; */
}
.gameweek-header > span {
  font-weight: 400;
  border: 1px solid black;
  padding: 2px 8px;
  cursor: pointer;
}
.date {
  margin-top: 32px;
  margin-bottom: 32px;
  font-size: 16px;
  text-align: center;
  font-size: 22px;
  font-weight: bold;
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
    activateModalChild() {
      this.isEditMode = true;
      this.showModal = true;
    },

    // fetch all fixtures
    getFixtures() {
      //   Set Loader
      this.isFixtureLoading = true;

      // Dispatch Store Action
      store.dispatch("Fixture/setAllFixtures");

      // TODO: Remove Timer
      setTimeout(() => {
        this.isFixtureLoading = false;
      }, 4000);
    },

    // Get all teams
    getTeams() {
      //   Set Loader
      this.isTeamLoading = true;

      store.dispatch("Fixture/setAllTeams");

      // TODO: Remove Timer
      setTimeout(() => {
        this.isTeamLoading = false;
      }, 6000);
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

    // get current gameweek
    showingGameWeek() {
      return store.state.Fixture.showingGameWeek;
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
