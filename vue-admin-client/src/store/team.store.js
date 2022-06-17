import axiosInstance from "../services/AxiosTokenInstance";
import store from "./index";

const baseURL = process.env.VUE_APP_API_BASE_URL;

export default {
  namespaced: true,
  state: {
    allTeams: [],
    allTeamsUnfiltered: [],
    editTeamId: "",
    imageChanged: false,
  },
  getters: {},
  mutations: {
    SET_ALL_TEAMS(state, payload) {
      state.allTeams = payload;
      state.allTeamsUnfiltered = payload;
    },
    SET_FILTERED_TEAMS(state, payload) {
      state.allTeams = payload;
    },
    SET_EDIT_TEAM_ID(state, payload) {
      state.editTeamId = payload;
    },
    SET_IMAGE_CHANGED_STATUS(state, payload) {
      state.imageChanged = payload;
    },
  },
  actions: {
    setEditTeamId(context, teamId) {
      context.commit("SET_EDIT_TEAM_ID", teamId);
    },
    setImageChanged(context, status) {
      context.commit("SET_IMAGE_CHANGED_STATUS", status);
    },
    sortByID(context, order) {
      if (order == 1) {
        store.state.Team.allTeams.sort(function (teamOne, teamTwo) {
          return parseInt(teamOne.relative_id) < parseInt(teamTwo.relative_id)
            ? -1
            : parseInt(teamOne.relative_id) > parseInt(teamTwo.relative_id)
            ? 1
            : 0;
        });
      } else {
        store.state.Team.allTeams.sort(function (teamOne, teamTwo) {
          return parseInt(teamOne.relative_id) > parseInt(teamTwo.relative_id)
            ? -1
            : parseInt(teamOne.relative_id) < parseInt(teamTwo.relative_id)
            ? 1
            : 0;
        });
      }
    },
    sortByName(context, order) {
      if (order == 1) {
        store.state.Team.allTeams.sort(function (teamOne, teamTwo) {
          return teamOne.teamName.toUpperCase() < teamTwo.teamName.toUpperCase()
            ? -1
            : teamOne.teamName.toUpperCase() > teamTwo.teamName.toUpperCase()
            ? 1
            : 0;
        });
      } else {
        store.state.Team.allTeams.sort(function (teamOne, teamTwo) {
          return teamOne.teamName.toUpperCase() > teamTwo.teamName.toUpperCase()
            ? -1
            : teamOne.teamName.toUpperCase() < teamTwo.teamName.toUpperCase()
            ? 1
            : 0;
        });
      }
    },
    sortByPoint(context, order) {
      if (order == 1) {
        store.state.Team.allTeams.sort(function (teamOne, teamTwo) {
          return parseInt(teamOne.teamPosition[0].teamPoint) <
            parseInt(teamTwo.teamPosition[0].teamPoint)
            ? -1
            : parseInt(teamOne.teamPosition[0].teamPoint) >
              parseInt(teamTwo.teamPosition[0].teamPoint)
            ? 1
            : 0;
        });
      } else {
        store.state.Team.allTeams.sort(function (teamOne, teamTwo) {
          return parseInt(teamOne.teamPosition[0].teamPoint) >
            parseInt(teamTwo.teamPosition[0].teamPoint)
            ? -1
            : parseInt(teamOne.teamPosition[0].teamPoint) <
              parseInt(teamTwo.teamPosition[0].teamPoint)
            ? 1
            : 0;
        });
      }
    },
    sortByWon(context, order) {
      if (order == 1) {
        store.state.Team.allTeams.sort(function (teamOne, teamTwo) {
          return parseInt(teamOne.teamPosition[0].won) <
            parseInt(teamTwo.teamPosition[0].won)
            ? -1
            : parseInt(teamOne.teamPosition[0].won) >
              parseInt(teamTwo.teamPosition[0].won)
            ? 1
            : 0;
        });
      } else {
        store.state.Team.allTeams.sort(function (teamOne, teamTwo) {
          return parseInt(teamOne.teamPosition[0].won) >
            parseInt(teamTwo.teamPosition[0].won)
            ? -1
            : parseInt(teamOne.teamPosition[0].won) <
              parseInt(teamTwo.teamPosition[0].won)
            ? 1
            : 0;
        });
      }
    },
    sortByDraw(context, order) {
      if (order == 1) {
        store.state.Team.allTeams.sort(function (teamOne, teamTwo) {
          return parseInt(teamOne.teamPosition[0].Draw) <
            parseInt(teamTwo.teamPosition[0].Draw)
            ? -1
            : parseInt(teamOne.teamPosition[0].Draw) >
              parseInt(teamTwo.teamPosition[0].Draw)
            ? 1
            : 0;
        });
      } else {
        store.state.Team.allTeams.sort(function (teamOne, teamTwo) {
          return parseInt(teamOne.teamPosition[0].Draw) >
            parseInt(teamTwo.teamPosition[0].Draw)
            ? -1
            : parseInt(teamOne.teamPosition[0].Draw) <
              parseInt(teamTwo.teamPosition[0].Draw)
            ? 1
            : 0;
        });
      }
    },
    sortByLost(context, order) {
      if (order == 1) {
        store.state.Team.allTeams.sort(function (teamOne, teamTwo) {
          return parseInt(teamOne.teamPosition[0].lost) <
            parseInt(teamTwo.teamPosition[0].lost)
            ? -1
            : parseInt(teamOne.teamPosition[0].lost) >
              parseInt(teamTwo.teamPosition[0].lost)
            ? 1
            : 0;
        });
      } else {
        store.state.Team.allTeams.sort(function (teamOne, teamTwo) {
          return parseInt(teamOne.teamPosition[0].lost) >
            parseInt(teamTwo.teamPosition[0].lost)
            ? -1
            : parseInt(teamOne.teamPosition[0].lost) <
              parseInt(teamTwo.teamPosition[0].lost)
            ? 1
            : 0;
        });
      }
    },
    sortByAgainst(context, order) {
      if (order == 1) {
        store.state.Team.allTeams.sort(function (teamOne, teamTwo) {
          return parseInt(teamOne.teamPosition[0].goalAgainst) <
            parseInt(teamTwo.teamPosition[0].goalAgainst)
            ? -1
            : parseInt(teamOne.teamPosition[0].goalAgainst) >
              parseInt(teamTwo.teamPosition[0].goalAgainst)
            ? 1
            : 0;
        });
      } else {
        store.state.Team.allTeams.sort(function (teamOne, teamTwo) {
          return parseInt(teamOne.teamPosition[0].goalAgainst) >
            parseInt(teamTwo.teamPosition[0].goalAgainst)
            ? -1
            : parseInt(teamOne.teamPosition[0].goalAgainst) <
              parseInt(teamTwo.teamPosition[0].goalAgainst)
            ? 1
            : 0;
        });
      }
    },
    sortByFor(context, order) {
      if (order == 1) {
        store.state.Team.allTeams.sort(function (teamOne, teamTwo) {
          return parseInt(teamOne.teamPosition[0].goalFor) <
            parseInt(teamTwo.teamPosition[0].goalFor)
            ? -1
            : parseInt(teamOne.teamPosition[0].goalFor) >
              parseInt(teamTwo.teamPosition[0].goalFor)
            ? 1
            : 0;
        });
      } else {
        store.state.Team.allTeams.sort(function (teamOne, teamTwo) {
          return parseInt(teamOne.teamPosition[0].goalFor) >
            parseInt(teamTwo.teamPosition[0].goalFor)
            ? -1
            : parseInt(teamOne.teamPosition[0].goalFor) <
              parseInt(teamTwo.teamPosition[0].goalFor)
            ? 1
            : 0;
        });
      }
    },
    sortByGD(context, order) {
      if (order == 1) {
        store.state.Team.allTeams.sort(function (teamOne, teamTwo) {
          return parseInt(teamOne.teamPosition[0].goalDifferntial) <
            parseInt(teamTwo.teamPosition[0].goalDifferntial)
            ? -1
            : parseInt(teamOne.teamPosition[0].goalDifferntial) >
              parseInt(teamTwo.teamPosition[0].goalDifferntial)
            ? 1
            : 0;
        });
      } else {
        store.state.Team.allTeams.sort(function (teamOne, teamTwo) {
          return parseInt(teamOne.teamPosition[0].goalDifferntial) >
            parseInt(teamTwo.teamPosition[0].goalDifferntial)
            ? -1
            : parseInt(teamOne.teamPosition[0].goalDifferntial) <
              parseInt(teamTwo.teamPosition[0].goalDifferntial)
            ? 1
            : 0;
        });
      }
    },
    sortByCity(context, order) {
      if (order == 1) {
        store.state.Team.allTeams.sort(function (teamOne, teamTwo) {
          return teamOne.teamCity.toUpperCase() < teamTwo.teamCity.toUpperCase()
            ? -1
            : teamOne.teamName.toUpperCase() > teamTwo.teamName.toUpperCase()
            ? 1
            : 0;
        });
      } else {
        store.state.Team.allTeams.sort(function (teamOne, teamTwo) {
          return teamOne.teamCity.toUpperCase() > teamTwo.teamCity.toUpperCase()
            ? -1
            : teamOne.teamName.toUpperCase() < teamTwo.teamName.toUpperCase()
            ? 1
            : 0;
        });
      }
    },
    sortByStadium(context, order) {
      if (order == 1) {
        store.state.Team.allTeams.sort(function (teamOne, teamTwo) {
          return teamOne.teamStadium.toUpperCase() <
            teamTwo.teamStadium.toUpperCase()
            ? -1
            : teamOne.teamStadium.toUpperCase() >
              teamTwo.teamStadium.toUpperCase()
            ? 1
            : 0;
        });
      } else {
        store.state.Team.allTeams.sort(function (teamOne, teamTwo) {
          return teamOne.teamStadium.toUpperCase() >
            teamTwo.teamStadium.toUpperCase()
            ? -1
            : teamOne.teamStadium.toUpperCase() <
              teamTwo.teamStadium.toUpperCase()
            ? 1
            : 0;
        });
      }
    },
    sortByFoundedDate(context, order) {
      if (order == 1) {
        store.state.Team.allTeams.sort(function (teamOne, teamTwo) {
          return teamOne.foundedIn < teamTwo.foundedIn
            ? -1
            : teamOne.foundedIn > teamTwo.foundedIn
            ? 1
            : 0;
        });
      } else {
        store.state.Team.allTeams.sort(function (teamOne, teamTwo) {
          return teamOne.foundedIn > teamTwo.foundedIn
            ? -1
            : teamOne.foundedIn < teamTwo.foundedIn
            ? 1
            : 0;
        });
      }
    },
    filterByTerm(context, filterTerm) {
      // reset previous filter result
      store.state.Team.allTeams = store.state.Team.allTeamsUnfiltered;

      let filteredTeams;

      // apply filter
      if (filterTerm != "") {
        filteredTeams = store.state.Team.allTeams.filter((team) => {
          return (
            // By city
            team.teamCity
              .toString()
              .toUpperCase()
              .includes(filterTerm.toUpperCase()) ||
            // by name
            team.teamName
              .toString()
              .toUpperCase()
              .includes(filterTerm.toUpperCase()) ||
            // year

            team.foundedIn.toString().includes(filterTerm) ||
            // by stadium
            team.teamStadium
              .toString()
              .toUpperCase()
              .includes(filterTerm.toUpperCase())
          );
        });
      } else {
        filteredTeams = store.state.Team.allTeamsUnfiltered;
      }

      // update filtered
      context.commit("SET_FILTERED_TEAMS", filteredTeams);
    },
    // fetches all teams
    async setAllTeams(context) {
      axiosInstance
        .get(`${baseURL}/teams/all`)
        .then((response) => {
          let relative_id_count = 1;
          response.data.forEach((team) => {
            team.relative_id = relative_id_count;
            relative_id_count = relative_id_count + 1;
          });
          context.commit("SET_ALL_TEAMS", response.data);
        })
        .catch((err) => {
          store.dispatch("Global/setNotificationInfo", {
            showNotification: true,
            notificationType: "error",
            notificationMessage: err,
          });
        });
    },

    async saveTeam(context, teamData) {
      axiosInstance
        .post(`${baseURL}/teams/`, teamData)
        .then((response) => {
          store.dispatch("Global/setNotificationInfo", {
            showNotification: true,
            notificationType: "success",
            notificationMessage: response.data,
          });

          store.dispatch("Team/setAllTeams");
        })
        .catch((err) => {
          store.dispatch("Global/setNotificationInfo", {
            showNotification: true,
            notificationType: "error",
            notificationMessage: err.response.data.message,
          });
        });
    },

    async deleteTeam(context, teamId) {
      axiosInstance
        .delete(`${baseURL}/teams/${teamId}`)
        .then((response) => {
          store.dispatch("Global/setNotificationInfo", {
            showNotification: true,
            notificationType: "success",
            notificationMessage: response.data,
          });
          store.dispatch("Team/setAllTeams");
        })
        .catch((err) => {
          store.dispatch("Global/setNotificationInfo", {
            showNotification: true,
            notificationType: "error",
            notificationMessage: err.response.data,
          });
        });
    },

    async updateTeam(context, updatedTeam) {
      const teamId = store.state.Team.editTeamId;

      const verifyChange = store.state.Team.allTeams.filter((team) => {
        return (
          team.teamName == updatedTeam.teamName &&
          team.teamCity == updatedTeam.teamCity &&
          team.teamStadium == updatedTeam.teamStadium &&
          team.teamCoach == updatedTeam.teamCoach &&
          team.teamNameAmh == updatedTeam.teamNameAmh
        );
      });

      if (!verifyChange.length > 0 || store.state.Team.imageChanged) {
        axiosInstance
          .patch(`${baseURL}/teams/${teamId}`, updatedTeam)
          .then((response) => {
            store.dispatch("Global/setNotificationInfo", {
              showNotification: true,
              notificationType: "success",
              notificationMessage: response.data,
            });
            store.dispatch("Team/setAllTeams");
          })
          .catch((err) => {
            store.dispatch("Global/setNotificationInfo", {
              showNotification: true,
              notificationType: "error",
              notificationMessage: err.response.data,
            });
          });
      }
      // no change
      else {
        store.dispatch("Global/setNotificationInfo", {
          showNotification: true,
          notificationType: "warning",
          notificationMessage: "No changes have been applied.",
        });
      }
    },
  },
};
