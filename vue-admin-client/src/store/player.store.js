import axios from "axios";
import store from "./index";
import { getField, updateField } from "vuex-map-fields";

const baseURL = process.env.VUE_APP_API_BASE_URL;
axios.defaults.baseURL = baseURL;

export default {
  namespaced: true,
  state: {
    stats: {},
    names: {},
  },
  getters: {
    getField,
  },
  mutations: {
    SET_PLAYER_STAT(state, payload) {
      state.stats[payload.playerId] = {};
      state.stats[payload.playerId][payload.gameweek] = payload.data;
      state.names[payload.playerId] = payload.name;
    },
    updateField,
  },
  actions: {
    async loadPlayerStats({ commit, rootState }, playerId) {
      let url;
      let payload;
      let gameweek = rootState.Fixture.showingGameWeek;

      url = `/players/getplayer/${playerId}`;
      await axios
        .get(url)
        .then((res) => {
          payload = {
            playerId,
            gameweek,
            name: res.data[0].playerName,
            data: res.data[0].score[gameweek - 1],
          };
          commit("SET_PLAYER_STAT", payload);
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
