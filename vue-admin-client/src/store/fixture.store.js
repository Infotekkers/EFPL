export default {
  namespaced: true,
  state: {
    // API states
    isFixtureLoading: false,
    allFixtures: [],
    homeTeams: [],
    awayTeams: [],

    // Caching states
    tempCache: [],

    // Gameweek states
    showingGameWeek: 2,

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
    // API states
    SET_FIXTURE_LOADER(state, payload) {
      state.isFixtureLoading = payload;
    },

    SET_ALL_FIXTURES(state, payload) {
      state.allFixtures = payload;
    },
    SET_ALL_TEAMS(state, payload) {
      state.homeTeams = payload;
      state.awayTeams = payload;
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
    // API states
    setFixtureLoader(context, fixtureLoaderStatus) {
      context.commit("SET_FIXTURE_LOADER", fixtureLoaderStatus);
    },
    setAllFixtures(context, allFixtures) {
      context.commit("SET_ALL_FIXTURES", allFixtures);
    },
    setAllTeams(context, teams) {
      context.commit("SET_ALL_TEAMS", teams);
    },
    setAwayTeams(context, awayTeams) {
      context.commit("SET_AWAY_TEAMS", awayTeams);
    },

    // Caching states
    setTempCache(context, cacheData) {
      context.commit("SET_TEMP_CACHE", cacheData);
    },

    // Gameweek states
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
  },
};
