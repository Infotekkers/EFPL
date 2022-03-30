import axios from "axios";
import store from "./index";

const baseURL = process.env.VUE_APP_API_BASE_URL;

export default {
  namespaced: true,
  state: {
    allTeams: [],
  },
  getters: {},
  mutations: {
    SET_ALL_TEAMS(state, payload) {
      state.allTeams = payload;
    },
  },
  actions: {
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

    async saveTeam(context, teamData) {
      console.log(teamData);
      axios
        .post(`${baseURL}/teams/`, teamData)
        .then((response) => {
          console.log(response);
        })
        .catch((err) => {
          console.log(err);
        });
    },
  },
};
