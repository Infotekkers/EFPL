import axios from "axios";
import store from "./index";

const baseURL = process.env.VUE_APP_API_BASE_URL;

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

    // Fixture edit mode
    editFixtureId: "",
  },
  getters: {},
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

    SET_EDIT_FIXTURE_ID(state, payload) {
      state.editFixtureId = payload;
    },
  },
  actions: {
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
    // Fetches all fixtures
    async setAllFixtures(context) {
      axios
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
      axios
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

    setEditFixtureId(context, matchId) {
      context.commit("SET_EDIT_FIXTURE_ID", matchId);
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
        await axios
          .patch(
            `${baseURL}/fixtures/postpone/${store.state.Fixture.editFixtureId}`,
            updatedFixture
          )
          .then(async (response) => {
            if (response.status === 200) {
              console.log(response);
              store.dispatch("Global/setNotificationInfo", {
                showNotification: true,
                notificationType: "success",
                notificationMessage: response.data,
              });
              await store.dispatch("Fixture/setAllFixtures");
              // store.dispatch("Fixture/setHomeTeams");
            }
          })
          .catch((err) => {
            // console.log(err.response);
            // store.dispatch("Global/setNotificationInfo", {
            //   showNotification: true,
            //   notificationType: "error",
            //   notificationMessage: `${err.response.data}`,
            //   notificationDuration: 8000,
            // });
            err.a = "";
          });
      }
      // await axios
      //   .patch(`${baseURL}/fixtures//update/`, newFixture)
      //   .then(async (response) => {
      //     if (response.status === 200) {
      //       store.dispatch("Global/setNotificationInfo", {
      //         showNotification: true,
      //         notificationType: "success",
      //         notificationMessage: `Fixture ${newFixture.homeTeam} vs ${newFixture.awayTeam} added for game week ${newFixture.gameweekId}`,
      //       });
      //       await store.dispatch("Fixture/setAllFixtures");
      //       // store.dispatch("Fixture/setHomeTeams");
      //     }
      //   })
      //   .catch((err) => {
      //     console.log(err.response);
      //     store.dispatch("Global/setNotificationInfo", {
      //       showNotification: true,
      //       notificationType: "error",
      //       notificationMessage: `${err.response.data}`,
      //       notificationDuration: 8000,
      //     });
      //   });
    },

    // Start match
    async startMatch(context, matchId) {
      axios
        .patch(`${baseURL}/fixtures/start/${matchId}`)
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
        .patch(`${baseURL}/fixtures/pause/${matchId}`)
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
        .patch(`${baseURL}/fixtures/resume/${matchId}`)
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
        .patch(`${baseURL}/fixtures/end/${matchId}`)
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
        .delete(`${baseURL}/fixtures/delete/${matchId}`)
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
  },
};
