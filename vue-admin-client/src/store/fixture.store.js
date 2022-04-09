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
    fixtureDetailId: "",

    // Fixture detailed info like formation
    fixtureDetailData: {
      teams: {},
      formations: {},
      lineups: {},
      stats: {},
    },

    // Players arranged according to their EPL teams
    players: {},

    // Locker room to contain reserved or unselected players of both EPL teams
    locker: {},

    // Loading indicator
    fixtureDetailsLoaded: false,
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
    SET_LOCKER(state, payload) {
      state.locker = payload;
    },
    SET_LOCKER_PLAYER(state, payload) {
      state.locker[payload.teamId][payload.playerId] = payload.data;
    },
    DELETE_LOCKER_PLAYER(state, payload) {
      delete state.locker[payload.teamId][payload.playerId];
    },
    SET_FIXTURE_DETAILS_LOADED(state, payload) {
      state.fixtureDetailsLoaded = payload;
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

    setFixtureDetailId({ commit }, matchId) {
      commit("SET_FIXTURE_DETAIL_ID", matchId);
    },

    async loadFixtureDetails({ commit }, matchId) {
      const homeTeamId = matchId.split("|")[0];
      const awayTeamId = matchId.split("|")[1];
      console.log(homeTeamId, awayTeamId);

      // TODO: User team data from store
      const reqHomeTeam = axios.get(`/teams/${homeTeamId}`);
      const reqAwayTeam = axios.get(`/teams/${awayTeamId}`);
      const reqPlayers = axios.get(
        `/players/getplayers/homeTeam/${homeTeamId}/awayTeam/${awayTeamId}`
      );
      const reqFixtureStats = axios.get(`/fixtures/${matchId}`);

      await axios
        .all([reqHomeTeam, reqAwayTeam, reqPlayers, reqFixtureStats])
        .then(
          axios.spread((...res) => {
            const [resHomeTeam, resAwayTeam, resPlayers, resFixtureStats] = res;

            // RESPONSE HOME TEAM
            let payload = {
              type: "teams",
              teamId: homeTeamId,
              data: resHomeTeam.data[0],
            };
            commit("SET_FIXTURE_DETAIL_DATA", payload);

            // RESPONSE AWAY TEAM
            payload = {
              type: "teams",
              teamId: awayTeamId,
              data: resAwayTeam.data[0],
            };
            commit("SET_FIXTURE_DETAIL_DATA", payload);

            // RESPONSE PLAYERS
            const payloadHomePlayers = {
              teamId: homeTeamId,
              data: resPlayers.data.homePlayers,
            };
            commit("SET_PLAYERS", payloadHomePlayers);

            const payloadAwayPlayers = {
              teamId: awayTeamId,
              data: resPlayers.data.awayPlayers,
            };
            commit("SET_PLAYERS", payloadAwayPlayers);

            // RESPONSE FIXTURE STATS
            if (resFixtureStats.data.homeTeamLineUp) {
              const payload = {
                type: "lineups",
                teamId: homeTeamId,
                data: resFixtureStats.data.homeTeamLineUp.lineup,
              };
              commit("SET_FIXTURE_DETAIL_DATA", payload);
            } else {
              const payload = {
                type: "lineups",
                teamId: homeTeamId,
                data: {
                  goalkeepers: [],
                  defenders: [],
                  midfielders: [],
                  strikers: [],
                  bench: [],
                },
              };
              commit("SET_FIXTURE_DETAIL_DATA", payload);
            }

            if (resFixtureStats.data.awayTeamLineUp) {
              const payload = {
                type: "lineups",
                teamId: awayTeamId,
                data: resFixtureStats.data.awayTeamLineUp.lineup,
              };
              commit("SET_FIXTURE_DETAIL_DATA", payload);
            } else {
              const payload = {
                type: "lineups",
                teamId: awayTeamId,
                data: {
                  goalkeepers: [],
                  defenders: [],
                  midfielders: [],
                  strikers: [],
                  bench: [],
                },
              };
              commit("SET_FIXTURE_DETAIL_DATA", payload);
            }

            // Using object assign to copy obj so as not to delete the response data
            payload = {};
            payload[homeTeamId] = Object.assign(
              {},
              resPlayers.data.homePlayers
            );
            payload[awayTeamId] = Object.assign(
              {},
              resPlayers.data.awayPlayers
            );

            for (const position in resFixtureStats.data.homeTeamLineUp.lineup) {
              for (const playerId of resFixtureStats.data.homeTeamLineUp.lineup[
                position
              ]) {
                if (payload[homeTeamId][playerId] !== undefined)
                  delete payload[homeTeamId][playerId];
              }
            }

            for (const position in resFixtureStats.data.awayTeamLineUp.lineup) {
              for (const playerId of resFixtureStats.data.awayTeamLineUp.lineup[
                position
              ]) {
                if (payload[awayTeamId][playerId] !== undefined)
                  delete payload[awayTeamId][playerId];
              }
            }
            commit("SET_LOCKER", payload);

            commit("SET_FIXTURE_DETAILS_LOADED", true);
          })
        )
        .catch((err) => {
          console.log(err);
          store.dispatch("Global/setNotificationInfo", {
            showNotification: true,
            notificationType: "error",
            notificationMessage: err.response.data,
          });
        });
    },

    async saveFixtureLineup({ state }) {
      let url;
      let payload;
      const matchId = state.fixtureDetailId;
      const homeTeamId = matchId.split("|")[0];
      const awayTeamId = matchId.split("|")[1];
      const homeTeamLineUp = {
        teamId: homeTeamId,
        lineup: state.fixtureDetailData.lineups[homeTeamId],
      };
      const awayTeamLineUp = {
        teamId: awayTeamId,
        lineup: state.fixtureDetailData.lineups[awayTeamId],
      };

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

    setFixtureDetailDataLineup(
      { commit, state },
      { teamId, incomingPlayer, position, operation }
    ) {
      let updatedLineup;

      updatedLineup = state.fixtureDetailData.lineups[teamId];
      if (operation === "add")
        updatedLineup[position].splice(3, 0, parseInt(incomingPlayer));
      else
        updatedLineup[position] = updatedLineup[position].filter(
          (player) => player !== parseInt(incomingPlayer)
        );

      let payload = {
        type: "lineups",
        teamId,
        data: updatedLineup,
      };

      commit("SET_FIXTURE_DETAIL_DATA", payload);
    },

    addPlayerToLocker({ commit, state }, { teamId, playerId }) {
      const payload = {
        teamId,
        playerId,
        data: state.players[teamId][playerId],
      };
      commit("SET_LOCKER_PLAYER", payload);
    },

    deletePlayerFromLocker({ commit }, { teamId, playerId }) {
      const payload = {
        teamId,
        playerId,
      };
      commit("DELETE_LOCKER_PLAYER", payload);
    },
  },
};
