import axiosInstance from "@/services/AxiosTokenInstance";
import store from "./index";

const baseURL = process.env.VUE_APP_API_BASE_URL;
axiosInstance.defaults.baseURL = baseURL;

export default {
  namespaced: true,
  state: {
    allStats: {},
  },
  mutations: {
    SET_EPL_STATS(state, payload) {
      state.allStats = payload;
    },
  },
  actions: {
    async getEPLStats(context) {
      axiosInstance
        .get(`${baseURL}/eplStats/topPlayers`)
        .then((response) => {
          if (response.status === 200) {
            context.commit("SET_EPL_STATS", response.data);
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
  },
};
