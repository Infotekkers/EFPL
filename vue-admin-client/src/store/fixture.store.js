import axios from "axios";
import store from "./index";
import { getField, updateField } from "vuex-map-fields";

const baseURL = process.env.VUE_APP_API_BASE_URL;
axios.defaults.baseURL = baseURL;

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

    // FixtureId of fixture in detail state
    fixtureDetailId: "3|1",

    // Fixture detailed info like formation
    fixtureDetailData: {
      teams: {},
      formations: {},
      lineups: {},
      stats: {},
    },

    // Players arranged according to their EPL teams
    players: {},
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
    getField,
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

    SET_FIXTURE_DETAIL_ID(state, payload) {
      state.fixtureDetailId = payload;
    },
    SET_FIXTURE_DETAIL_DATA(state, payload) {
      if (payload.type === "stats")
        state.fixtureDetailData.stats = payload.data;
      else state.fixtureDetailData[payload.type][payload.teamId] = payload.data;
    },
    SET_PLAYERS(state, payload) {
      state.players[payload.teamId] = payload.data;
    },
    updateField,
  },
  actions: {
    // Fetches all fixtures
    async setAllFixtures(context) {
      axios
        .get(`/fixtures`)
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
        .get(`/teams/all`)
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
        .post(`/fixtures/add`, newFixture)
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

    // Start match
    async startMatch(context, matchId) {
      axios
        .patch(`/fixtures/start/${matchId}`)
        .then((response) => {
          if (response.status === 200) {
            store.dispatch("Global/setNotificationInfo", {
              showNotification: true,
              notificationType: "success",
              notificationMessage: response.data,
            });
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

    // Pause match
    async pauseMatch(context, matchId) {
      axios
        .patch(`/fixtures/pause/${matchId}`)
        .then((response) => {
          if (response.status === 200) {
            store.dispatch("Global/setNotificationInfo", {
              showNotification: true,
              notificationType: "success",
              notificationMessage: response.data,
            });
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

    // Resume match
    async resumeMatch(context, matchId) {
      axios
        .patch(`/fixtures/resume/${matchId}`)
        .then((response) => {
          if (response.status === 200) {
            store.dispatch("Global/setNotificationInfo", {
              showNotification: true,
              notificationType: "success",
              notificationMessage: response.data,
            });
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

    // end match
    async endMatch(context, matchId) {
      axios
        .patch(`/fixtures/end/${matchId}`)
        .then((response) => {
          if (response.status === 200) {
            store.dispatch("Global/setNotificationInfo", {
              showNotification: true,
              notificationType: "success",
              notificationMessage: response.data,
            });
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

    // delete match
    async deleteMatch(context, matchId) {
      axios
        .delete(`/fixtures/delete/${matchId}`)
        .then((response) => {
          store.dispatch("Global/setNotificationInfo", {
            showNotification: true,
            notificationType: "success",
            notificationMessage: response.data,
          });
          store.dispatch("Fixture/setAllFixtures");
        })
        .catch((err) => {
          store.dispatch("Global/setNotificationInfo", {
            showNotification: true,
            notificationType: "error",
            notificationMessage: err.response.data,
          });
        });
    },

    async loadFixtureDetails({ commit }, matchId) {
      let url;
      const homeTeamId = matchId.split("|")[0];
      const awayTeamId = matchId.split("|")[1];

      // TODO: User team data from store
      // Get home team
      url = `/teams/${homeTeamId}`;

      await axios
        .get(url)
        .then((res) => {
          store.dispatch("Global/setNotificationInfo", {
            showNotification: false,
            notificationType: "success",
          });

          const payload = {
            type: "teams",
            teamId: homeTeamId,
            data: res.data[0],
          };
          commit("SET_FIXTURE_DETAIL_DATA", payload);
        })
        .catch((err) => {
          store.dispatch("Global/setNotificationInfo", {
            showNotification: true,
            notificationType: "error",
            notificationMessage: err.response.data,
          });
        });

      // Get away team
      url = `/teams/${awayTeamId}`;

      await axios
        .get(url)
        .then((res) => {
          store.dispatch("Global/setNotificationInfo", {
            showNotification: false,
            notificationType: "success",
          });

          const payload = {
            type: "teams",
            teamId: awayTeamId,
            data: res.data[0],
          };
          commit("SET_FIXTURE_DETAIL_DATA", payload);
        })
        .catch((err) => {
          store.dispatch("Global/setNotificationInfo", {
            showNotification: true,
            notificationType: "error",
            notificationMessage: err.response.data,
          });
        });

      // Get players
      url = `/players/getplayers/homeTeam/${homeTeamId}/awayTeam/${awayTeamId}`;

      await axios
        .get(url)
        .then((res) => {
          store.dispatch("Global/setNotificationInfo", {
            showNotification: false,
            notificationType: "success",
          });

          const payloadHomePlayers = {
            teamId: homeTeamId,
            data: res.data.homePlayers,
          };
          commit("SET_PLAYERS", payloadHomePlayers);

          const payloadAwayPlayers = {
            teamId: awayTeamId,
            data: res.data.awayPlayers,
          };
          commit("SET_PLAYERS", payloadAwayPlayers);
        })
        .catch((err) => {
          store.dispatch("Global/setNotificationInfo", {
            showNotification: true,
            notificationType: "error",
            notificationMessage: err.response.data,
          });
        });

      // Get fixture stats
      url = `/fixtures/${matchId}`;

      await axios
        .get(url)
        .then((res) => {
          store.dispatch("Global/setNotificationInfo", {
            showNotification: false,
            notificationType: "success",
          });

          if (res.data.homeTeamLineUp) {
            const payload = {
              type: "lineups",
              teamId: homeTeamId,
              data: res.data.homeTeamLineUp.lineup,
            };
            commit("SET_FIXTURE_DETAIL_DATA", payload);
          }

          if (res.data.awayTeamLineUp) {
            const payload = {
              type: "lineups",
              teamId: awayTeamId,
              data: res.data.awayTeamLineUp.lineup,
            };
            commit("SET_FIXTURE_DETAIL_DATA", payload);
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

    async saveFixtureLineup(
      { commit },
      matchId,
      homeTeamLineUp,
      awayTeamLineUp
    ) {
      let url;
      let payload;
      const homeTeamId = matchId.split("|")[0];
      const awayTeamId = matchId.split("|")[1];

      payload = {
        type: "lineup",
        teamId: homeTeamId,
        data: homeTeamLineUp,
      };
      commit("SET_FIXTURE_DETAIL", payload);

      payload = {
        type: "lineup",
        teamId: awayTeamId,
        data: awayTeamLineUp,
      };
      commit("SET_FIXTURE_DETAIL", payload);

      url = `/fixtures/update/lineup/${matchId}`;
      payload = {
        homeTeamLineUp,
        awayTeamLineUp,
      };

      await axios
        .patch(url, payload)
        .then((res) => {
          store.dispatch("Global/setNotificationInfo", {
            showNotification: true,
            notificationType: "success",
            notificationMessage: res.data,
          });
        })
        .catch((err) => {
          store.dispatch("Global/setNotificationInfo", {
            showNotification: true,
            notificationType: "error",
            notificationMessage: err.response.data,
          });
        });
    },

    async saveFixtureStats({ commit }, matchId, incomingUpdate) {
      let url;
      let payload;

      payload = {
        type: "stats",
        data: incomingUpdate,
      };
      commit("SET_FIXTURE_DETAIL_DATA", payload);

      url = `/fixtures/update/stats/${matchId}`;
      payload = incomingUpdate;

      await axios
        .patch(url, payload)
        .then((res) => {
          store.dispatch("Global/setNotificationInfo", {
            showNotification: true,
            notificationType: "success",
            notificationMessage: res.data,
          });
        })
        .catch((err) => {
          store.dispatch("Global/setNotificationInfo", {
            showNotification: true,
            notificationType: "error",
            notificationMessage: err.response.data,
          });
        });
    },
  },
};
