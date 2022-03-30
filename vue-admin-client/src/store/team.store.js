import axios from "axios";
import store from "./index";

const baseURL = process.env.VUE_APP_API_BASE_URL;

export default {
  namespaced: true,
  state: {
    allTeams: [],

    editTeamId: "",

    imageChanged: false,
  },
  getters: {},
  mutations: {
    SET_ALL_TEAMS(state, payload) {
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
    sortByID() {
      store.state.Team.allTeams.sort(function (teamOne, teamTwo) {
        return teamOne.teamId.toUpperCase() < teamTwo.teamId.toUpperCase()
          ? -1
          : teamOne.teamId.toUpperCase() > teamTwo.teamId.toUpperCase()
          ? 1
          : 0;
      });
    },

    sortByName() {
      store.state.Team.allTeams.sort(function (teamOne, teamTwo) {
        return teamOne.teamName.toUpperCase() < teamTwo.teamName.toUpperCase()
          ? -1
          : teamOne.teamName.toUpperCase() > teamTwo.teamName.toUpperCase()
          ? 1
          : 0;
      });
    },
    sortByCity() {
      store.state.Team.allTeams.sort(function (teamOne, teamTwo) {
        return teamOne.teamCity.toUpperCase() < teamTwo.teamCity.toUpperCase()
          ? -1
          : teamOne.teamName.toUpperCase() > teamTwo.teamName.toUpperCase()
          ? 1
          : 0;
      });
    },
    sortByStadium() {
      store.state.Team.allTeams.sort(function (teamOne, teamTwo) {
        return teamOne.teamStadium.toUpperCase() <
          teamTwo.teamStadium.toUpperCase()
          ? -1
          : teamOne.teamStadium.toUpperCase() >
            teamTwo.teamStadium.toUpperCase()
          ? 1
          : 0;
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
          // TODO:Add Notification
          store.dispatch("Global/setNotificationInfo", {
            showNotification: true,
            notificationType: "error",
            notificationMessage: err.response.data,
          });
        });
    },

    async saveTeam(context, teamData) {
      console.log(teamData);
      axios
        .post(`${baseURL}/teams/`, teamData)
        .then((response) => {
          // TODO:Add Notification
          console.log(response);
          store.dispatch("Team/setAllTeams");
        })
        .catch((err) => {
          // TODO:Add Notification
          console.log(err);
        });
    },

    async deleteTeam(context, teamId) {
      axios
        .delete(`${baseURL}/teams/${teamId}`)
        .then((response) => {
          // TODO:Add Notification
          console.log(response);
          store.dispatch("Team/setAllTeams");
        })
        .catch((err) => {
          // TODO:Add Notification
          console.log(err);
        });
    },

    async updateTeam(context, updatedTeam) {
      const teamId = store.state.Team.editTeamId;
      console.log("ID", store.state.Team.imageChanged);
      const verifyChange = store.state.Team.allTeams.filter((team) => {
        return (
          team.teamName == updatedTeam.teamName &&
          team.teamCity == updatedTeam.teamCity &&
          team.teamStadium == updatedTeam.teamStadium
        );
      });

      if (!verifyChange.length > 0 || store.state.Team.imageChanged) {
        axios
          .patch(`${baseURL}/teams/${teamId}`, updatedTeam)
          .then((response) => {
            // TODO:Add Notification
            console.log(response);
            store.dispatch("Team/setAllTeams");
          })
          .catch((err) => {
            // TODO:Add Notification
            console.log(err);
          });
      } else {
        console.log("Wef man");
      }
    },
  },
};
