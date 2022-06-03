import axiosInstance from "../services/AxiosTokenInstance";
import axios from "axios";
import store from "./index";
import { getField, updateField } from "vuex-map-fields";

const baseURL = process.env.VUE_APP_API_BASE_URL;
axiosInstance.defaults.baseURL = baseURL;

export default {
  namespaced: true,
  state: {
    allFixtures: [],
    allFixturesUnfiltered: [],
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
      logos: {},
      status: "",
    },

    // Players arranged according to their EPL teams
    players: {},

    // Locker room to contain reserved or unselected players of both EPL teams
    locker: {},

    // Loading indicator
    fixtureDetailsLoaded: false,

    // Error Log
    errorLog: "",

    score: { "10|15": "0v0" },

    // Fixture edit mode
    editFixtureId: "",
  },
  getters: {
    getScore: (state) => (matchId) => {
      return state.score[matchId];
    },
    getField,
  },
  mutations: {
    SET_ALL_FIXTURES(state, payload) {
      state.allFixtures = payload;
      state.allFixturesUnfiltered = payload;
    },
    SET_ALL_TEAMS(state, payload) {
      state.allTeams = payload;
      state.homeTeams = payload;
      state.awayTeams = payload;
    },
    SET_FILTERED_FIXTURES(state, payload) {
      state.allFixtures = payload;
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
      if (payload.type === "stats" || payload.type === "status")
        state.fixtureDetailData[payload.type] = payload.data;
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
    SET_SCORE(state, payload) {
      state.score[payload.matchId] = payload.data;
    },
    SET_ERROR_LOG(state, payload) {
      state.errorLog = payload;
    },
    updateField,
    SET_EDIT_FIXTURE_ID(state, payload) {
      state.editFixtureId = payload;
    },
  },
  actions: {
    filterByMatchStatus(context, filterMatchStatus) {
      // reset previous filter result
      store.state.Fixture.allFixtures =
        store.state.Fixture.allFixturesUnfiltered;

      if (filterMatchStatus != "All") {
        const filteredFixtures = store.state.Fixture.allFixtures.filter(
          (fixture) => {
            return fixture.status == filterMatchStatus;
          }
        );
        context.commit("SET_FILTERED_FIXTURES", filteredFixtures);
      }
    },
    // TODO:Improve filter
    filterByTerm(context, filterTerm) {
      // reset previous filter result
      store.state.Fixture.allFixtures =
        store.state.Fixture.allFixturesUnfiltered;

      // apply filter
      const filteredFixtures = store.state.Fixture.allFixtures.filter(
        (fixture) => {
          return (
            // home team
            fixture.homeTeam.includes(filterTerm.toUpperCase()) ||
            fixture.homeTeam.includes(filterTerm.toLowerCase()) ||
            fixture.homeTeam.includes(filterTerm) ||
            // away team
            fixture.awayTeam.includes(filterTerm.toUpperCase()) ||
            fixture.awayTeam.includes(filterTerm.toLowerCase()) ||
            fixture.awayTeam.includes(filterTerm)
          );
        }
      );

      // update filtered
      context.commit("SET_FILTERED_FIXTURES", filteredFixtures);
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
      // TODO: Clear fixture gameweek data
      context.commit("SET_SHOWING_GAMEWEEK", gameWeek);
    },

    // Scroller states
    setHomeTeamIndex(context, homeTeamIndex) {
      context.commit("SET_HOME_TEAM_INDEX", homeTeamIndex);
    },
    setAwayTeamIndex(context, awayTeamIndex) {
      context.commit("SET_AWAY_TEAM_INDEX", awayTeamIndex);
    },

    setEditFixtureId(context, matchId) {
      context.commit("SET_EDIT_FIXTURE_ID", matchId);
    },

    setFixtureDetailId({ commit }, matchId) {
      commit("SET_FIXTURE_DETAIL_ID", matchId);
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

    setScore({ commit }, { matchId, incomingScore }) {
      let payload;

      payload = {
        matchId,
        data: incomingScore,
      };
      commit("SET_SCORE", payload);
    },

    // get active gameweek
    async getActiveGameWeek(context) {
      axiosInstance
        .get(`${baseURL}/fixtures/gwf/check/activeGw`)
        .then((response) => {
          if (response.status === 200) {
            context.commit(
              "SET_SHOWING_GAMEWEEK",
              response.data.gameWeekNumber
            );
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

    // Fetches all fixtures
    async setAllFixtures(context) {
      axiosInstance
        .get(`${baseURL}/fixtures/`)
        .then((response) => {
          if (response.status === 200) {
            response.data.sort(function (a, b) {
              var c = new Date(a.schedule);
              var d = new Date(b.schedule);
              return c - d;
            });
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
      axiosInstance
        .get(`${baseURL}/teams/all`)
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

    // Saves new fixture
    async saveNewFixture(context, newFixture) {
      await axiosInstance
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
          store.dispatch("Global/setNotificationInfo", {
            showNotification: true,
            notificationType: "error",
            notificationMessage: `${err.response.data}`,
            notificationDuration: 8000,
          });
        });

      // context.commit("SET_NEW_FIXTURE", newFixture);
    },

    async updateFixture(context, updatedFixture) {
      const allFixtures = store.state.Fixture.allFixtures;

      const verifyChange = allFixtures.filter((fixture) => {
        return (
          fixture.gameweekId == updatedFixture.gameweekId &&
          new Date(fixture.schedule).toString() ==
            new Date(updatedFixture.schedule).toString() &&
          fixture.homeTeam === updatedFixture.homeTeam &&
          fixture.awayTeam === updatedFixture.awayTeam
        );
      });

      // If no change in data
      if (verifyChange.length > 0) {
        store.dispatch("Global/setNotificationInfo", {
          showNotification: true,
          notificationType: "warning",
          notificationMessage: "No change in Fixture information for update.",
        });
      } else {
        // TODO:Review
        await axiosInstance
          .patch(
            `${baseURL}/fixtures/postpone/${store.state.Fixture.editFixtureId}`,
            updatedFixture
          )
          .then(async (response) => {
            if (response.status === 200) {
              store.dispatch("Global/setNotificationInfo", {
                showNotification: true,
                notificationType: "success",
                notificationMessage: response.data,
              });
              await store.dispatch("Fixture/setAllFixtures");
            } else if (response.status === 422) {
              store.dispatch("Global/setNotificationInfo", {
                showNotification: true,
                notificationType: "warning",
                notificationMessage: response.data,
              });
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
      }
    },

    // Start match
    async startMatch(context, matchId) {
      axiosInstance
        .patch(`${baseURL}/fixtures/start/${matchId}`)
        .then(async (response) => {
          if (response.status === 200) {
            store.dispatch("Global/setNotificationInfo", {
              showNotification: true,
              notificationType: "success",
              notificationMessage: response.data,
            });
            await store.dispatch("Fixture/setAllFixtures");
          }
        })
        .catch((err) => {
          if (err.response.status === 422) {
            store.dispatch("Global/setNotificationInfo", {
              showNotification: true,
              notificationType: "warning",
              notificationMessage: err.response.data,
            });
          } else {
            store.dispatch("Global/setNotificationInfo", {
              showNotification: true,
              notificationType: "error",
              notificationMessage: err.response.data,
            });
          }
        });
    },

    // Pause match
    async pauseMatch(context, matchId) {
      axiosInstance
        .patch(`${baseURL}/fixtures/pause/${matchId}`)
        .then(async (response) => {
          if (response.status === 200) {
            store.dispatch("Global/setNotificationInfo", {
              showNotification: true,
              notificationType: "success",
              notificationMessage: response.data,
            });
            await store.dispatch("Fixture/setAllFixtures");
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
      axiosInstance
        .patch(`${baseURL}/fixtures/resume/${matchId}`)
        .then(async (response) => {
          if (response.status === 200) {
            store.dispatch("Global/setNotificationInfo", {
              showNotification: true,
              notificationType: "success",
              notificationMessage: response.data,
            });
            await store.dispatch("Fixture/setAllFixtures");
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
      axiosInstance
        .patch(`${baseURL}/fixtures/end/${matchId}`)
        .then(async (response) => {
          if (response.status === 200) {
            store.dispatch("Global/setNotificationInfo", {
              showNotification: true,
              notificationType: "success",
              notificationMessage: response.data,
            });
            await store.dispatch("Fixture/setAllFixtures");
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
      axiosInstance
        .delete(`${baseURL}/fixtures/delete/${matchId}`)
        .then((response) => {
          if (response.status === 200) {
            store.dispatch("Global/setNotificationInfo", {
              showNotification: true,
              notificationType: "success",
              notificationMessage: response.data,
            });
            store.dispatch("Fixture/setAllFixtures");
          }
        })
        .catch((err) => {
          if (err.response.status === 422) {
            store.dispatch("Global/setNotificationInfo", {
              showNotification: true,
              notificationType: "error",
              notificationMessage: err.response.data,
            });
          } else {
            store.dispatch("Global/setNotificationInfo", {
              showNotification: true,
              notificationType: "error",
              notificationMessage: err.response.data,
            });
          }
        });
    },

    async loadFixtureDetails({ commit, state }, matchId) {
      const homeTeamId = matchId.split("|")[0];
      const awayTeamId = matchId.split("|")[1];

      // TODO: User team data from store
      const reqHomeTeam = axiosInstance.get(`/teams/${homeTeamId}`);
      const reqAwayTeam = axiosInstance.get(`/teams/${awayTeamId}`);

      await axios.all([reqHomeTeam, reqAwayTeam]).then(
        axios.spread((...res) => {
          const [resHomeTeam, resAwayTeam] = res;

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

          // SAVING LOGO URLS
          const baseUrl = process.env.VUE_APP_API_BASE_URL;

          payload = {
            type: "logos",
            teamId: homeTeamId,
            data: `${baseUrl}${resHomeTeam.data[0].teamLogo}`,
          };
          commit("SET_FIXTURE_DETAIL_DATA", payload);
          payload = {
            type: "logos",
            teamId: awayTeamId,
            data: `${baseUrl}${resAwayTeam.data[0].teamLogo}`,
          };
          commit("SET_FIXTURE_DETAIL_DATA", payload);
        })
      );

      const reqPlayers = axiosInstance.get(
        `/players/getplayers/homeTeam/${state.fixtureDetailData.teams[homeTeamId].teamName}/awayTeam/${state.fixtureDetailData.teams[awayTeamId].teamName}`
      );
      const reqFixtureStats = axiosInstance.get(`/fixtures/${matchId}`);

      await axios
        .all([reqPlayers, reqFixtureStats])
        .then(
          axios.spread((...res) => {
            const [resPlayers, resFixtureStats] = res;
            let payload;

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

            if (resFixtureStats.data.score) {
              payload = {
                matchId,
                data: resFixtureStats.data.score,
              };
              commit("SET_SCORE", payload);
            }

            payload = {
              type: "status",
              data: resFixtureStats.data.status,
            };
            commit("SET_FIXTURE_DETAIL_DATA", payload);

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

            if (resFixtureStats.data.homeTeamLineUp) {
              for (const position in resFixtureStats.data.homeTeamLineUp
                .lineup) {
                for (const playerId of resFixtureStats.data.homeTeamLineUp
                  .lineup[position]) {
                  if (payload[homeTeamId][playerId] !== undefined)
                    delete payload[homeTeamId][playerId];
                }
              }
            }

            if (resFixtureStats.data.awayTeamLineUp) {
              for (const position in resFixtureStats.data.awayTeamLineUp
                .lineup) {
                for (const playerId of resFixtureStats.data.awayTeamLineUp
                  .lineup[position]) {
                  if (payload[awayTeamId][playerId] !== undefined)
                    delete payload[awayTeamId][playerId];
                }
              }
            }
            commit("SET_LOCKER", payload);

            commit("SET_FIXTURE_DETAILS_LOADED", true);
          })
        )
        .catch((err) => {
          commit("SET_ERROR_LOG", err.response.data);
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

      await axiosInstance
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

      await axiosInstance
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

    // TODO:Remind got merged with save stats

    async saveScore() {
      //   let url;
      //   let payload;
      //   url = `/fixtures/update/score/${matchId}`;
      //   payload = {
      //     score: state.score[matchId],
      //   };
      //   await axiosInstance
      //     .patch(url, payload)
      //     .then((res) => {
      //       store.dispatch("Global/setNotificationInfo", {
      //         showNotification: true,
      //         notificationType: "success",
      //         notificationMessage: res.data,
      //       });
      //     })
      //     .catch((err) => {
      //       store.dispatch("Global/setNotificationInfo", {
      //         showNotification: true,
      //         notificationType: "error",
      //         notificationMessage: err.response.data,
      //       });
      //     });
    },
  },
};
