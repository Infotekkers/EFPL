export default {
  namespaced: true,
  state: {
    isFixtureLoading: false,
    allFixtures: [],
    tempCache: [],
    showingGameWeek: 2,
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
    SET_FIXTURE_LOADER(state, payload) {
      state.isFixtureLoading = payload;
    },

    SET_ALL_FIXTURES(state, payload) {
      state.allFixtures = payload;
    },
    SET_TEMP_CACHE(state, payload) {
      state.tempCache.push(payload);
    },
    SET_SHOWING_GAMEWEEK(state, payload) {
      state.showingGameWeek = payload;
    },
  },
  actions: {
    setFixtureLoader(context, fixtureLoaderStatus) {
      context.commit("SET_FIXTURE_LOADER", fixtureLoaderStatus);
    },

    setAllFixtures(context, allFixtures) {
      context.commit("SET_ALL_FIXTURES", allFixtures);
    },
    setTempCache(context, cacheData) {
      context.commit("SET_TEMP_CACHE", cacheData);
    },
    setShowingGameWeek(context, gameWeek) {
      context.commit("SET_SHOWING_GAMEWEEK", gameWeek);
    },
  },
};
