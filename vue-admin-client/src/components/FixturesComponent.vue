<template>
  <div class="container">
    <div v-if="fixtureLoader">Loading</div>
    <div v-else class="gameweek-container">
      <!-- HEader -->
      <div class="gameweek-header">
        <span v-on="showingGameWeek == 1 ? {} : { click: prevGameWeek }"
          >Prev</span
        >
        Gameweek {{ showingGameWeek }}
        <span v-on="showingGameWeek == 30 ? {} : { click: nextGameWeek }"
          >Next</span
        >
      </div>

      <!-- COntent -->
      <div>{{ currentGWFixtures }}</div>
    </div>
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
  background: grey;
  display: flex;
  flex-direction: column;
  align-items: center;
}
.gameweek-header {
  width: 98%;
  padding-top: 12px;
  font-weight: bold;
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  background: teal;
  /* align-items: space-between; */
}
.gameweek-header > span {
  font-weight: 400;
  border: 1px solid black;
  padding: 2px 8px;
}
</style>

<script>
import axios from "axios";
import store from "../store/index";
import { compareCache } from "../utils/helpers";

// Components
// import FixtureComponent from "@/components/FixtureComponent";

export default {
  name: "FixturesComponent",

  components: {
    // FixtureComponent,
  },

  methods: {
    async addNewFixture() {
      const fixture = {
        gameweekId: 4,
        homeTeam: "Welayta Dicha",
        awayTeam: "Saint George",
        schedule: "03-23-22",
      };
      if (this.connectionStatus) {
        console.log("Adding New");
        axios
          .post(`${this.baseURL}/fixtures/add`, fixture)
          .then((response) => {
            if (response.status === 200) {
              console.log("Added new fixture");
            }
          })
          .catch((error) => {
            switch (error.response.status) {
              case 409:
                console.log("Fixture already exists");
                break;

              default:
                console.log(error);
                break;
            }
          });
      } else {
        console.log("Caching");
        const currentCache = store.state.Fixture.tempCache;

        // Check if value is cached
        const result = compareCache(fixture, currentCache);

        if (!result) {
          store.dispatch("Fixture/setTempCache", fixture);
        }
      }
    },

    async getFixtures() {
      //   Set Loader
      store.dispatch("Fixture/setFixtureLoader", true);
      const existingFixtures = await axios.get(`${this.baseURL}/fixtures/`);

      //    Check status
      switch (existingFixtures.status) {
        case 200:
          store.dispatch("Fixture/setAllFixtures", existingFixtures.data);
          break;

        default:
          store.dispatch(
            "Fixture/setConnectionStatus",
            existingFixtures.status
          );
          break;
      }

      // setTimeout(async () => {
      store.dispatch("Fixture/setFixtureLoader", false);
      // }, 4000);
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
    baseURL() {
      return process.env.VUE_APP_API_BASE_URL;
    },

    connectionStatus() {
      return store.state.Global.connection;
    },

    fixtureLoader() {
      return store.state.Fixture.isFixtureLoading;
    },
    showingGameWeek() {
      return store.state.Fixture.showingGameWeek;
    },

    currentGWFixtures() {
      const currentGW = store.state.Fixture.showingGameWeek;
      const allFixtures = store.state.Fixture.allFixtures;
      const filtered = allFixtures.filter((fixture) => {
        return fixture.gameweekId == currentGW;
      });
      console.log(filtered);

      return filtered;
    },

    //
    cache() {
      return store.state.Fixture.tempCache;
    },
  },

  async beforeMount() {
    await this.getFixtures();
  },
};
</script>
