import axios from "axios";
import store from "./index";

const baseURL = process.env.VUE_APP_API_BASE_URL;

export default {
  namespaced: true,
  state: {
    allFixtures: [],
    allTeams: [],
    homeTeams: [],
    awayTeams: [],

    // Caching states
    tempCache: [],

    // Gameweek states
    showingGameWeek: 1,

    // Scroller states
    currentHomeTeamIndex: 0,
    currentAwayTeamIndex: 1,
  },
  getters: {
    getIsFixtureLoading: function (state) {
      return state.isFixtureLoading;
    },
    getAllFixtures: function (state) {
      return state.allFixtures;
    },
    getTempCache: function (state) {
      return state.tempCache;
    },
  },
  mutations: {
    SET_ALL_FIXTURES(state, payload) {
      state.allFixtures = payload;
    },
    SET_ALL_TEAMS(state, payload) {
      state.allTeams = payload;
      state.homeTeams = payload;
      state.awayTeams = payload;
    },
    SET_HOME_TEAMS(state, payload) {
      state.homeTeams = payload;
    },
    SET_AWAY_TEAMS(state, payload) {
      state.awayTeams = payload;
    },

    // Caching states
    SET_TEMP_CACHE(state, payload) {
      state.tempCache.push(payload);
    },

    // Gameweek states
    SET_SHOWING_GAMEWEEK(state, payload) {
      state.showingGameWeek = payload;
    },

    // Scroller states

    SET_HOME_TEAM_INDEX(state, payload) {
      state.currentHomeTeamIndex = payload;
    },
    SET_AWAY_TEAM_INDEX(state, payload) {
      state.currentAwayTeamIndex = payload;
    },
  },
  actions: {
    // Fetches all fixtures
    async setAllFixtures(context) {
      axios
        .get(`${baseURL}/fixtures/`)
        .then((response) => {
          if (response.status === 200) {
            context.commit("SET_ALL_FIXTURES", response.data);
          }
        })
        .catch((err) => {
          store.dispatch("Global/setNotificationInfo", {
            showNotification: true,
            notificationType: "error",
            notificationMessage: err.response.data,
          });
        });
    },

    // fetches all teams
    async setAllTeams(context) {
      axios
        .get(`${baseURL}/teams//all`)
        .then((response) => {
          context.commit("SET_ALL_TEAMS", response.data);
        })
        .catch((err) => {
          store.dispatch("Global/setNotificationInfo", {
            showNotification: true,
            notificationType: "error",
            notificationMessage: err.response.data,
          });
        });
    },

    setHomeTeams(context, homeTeams) {
      context.commit("SET_HOME_TEAMS", homeTeams);
    },

    // sets away team => useful when filtering
    setAwayTeams(context, awayTeams) {
      context.commit("SET_AWAY_TEAMS", awayTeams);
    },

    // Caching states
    setTempCache(context, cacheData) {
      context.commit("SET_TEMP_CACHE", cacheData);
    },

    // sets the showing gameweek
    setShowingGameWeek(context, gameWeek) {
      context.commit("SET_SHOWING_GAMEWEEK", gameWeek);
    },

    // Scroller states
    setHomeTeamIndex(context, homeTeamIndex) {
      context.commit("SET_HOME_TEAM_INDEX", homeTeamIndex);
    },
    setAwayTeamIndex(context, awayTeamIndex) {
      context.commit("SET_AWAY_TEAM_INDEX", awayTeamIndex);
    },

    // Saves new fixture
    async saveNewFixture(context, newFixture) {
      await axios
        .post(`${baseURL}/fixtures/add`, newFixture)
        .then(async (response) => {
          if (response.status === 200) {
            store.dispatch("Global/setNotificationInfo", {
              showNotification: true,
              notificationType: "success",
              notificationMessage: `Fixture ${newFixture.homeTeam} vs ${newFixture.awayTeam} added for game week ${newFixture.gameweekId}`,
            });
            await store.dispatch("Fixture/setAllFixtures");
            // store.dispatch("Fixture/setHomeTeams");
          }
        })
        .catch((err) => {
          console.log(err.response);
          store.dispatch("Global/setNotificationInfo", {
            showNotification: true,
            notificationType: "error",
            notificationMessage: `${err.response.data}`,
            notificationDuration: 8000,
          });
        });

      // context.commit("SET_NEW_FIXTURE", newFixture);
    },
  },
};
