import axios from "axios";
import store from "./index";

const baseURL = process.env.VUE_APP_API_BASE_URL;

export default {
  namespaced: true,
  state: {
    allPlayers: [],
    allPlayersUnfiltered: [],

    eplTeamId: "",
    imageChanged: false,
  },
  mutations: {
    SET_ALL_PLAYERS(state, payload) {
      state.allPlayers = payload;
      state.allPlayersUnfiltered = payload;
    },
    SET_FILTERED_PLAYERS(state, payload) {
      state.allPlayers = payload;
    },
    SET_EDIT_PLAYER_ID(state, payload) {
      state.editPlayerId = payload;
    },
    SET_IMAGE_CHANGED_STATUS(state, payload) {
      state.imageChanged = payload;
    },
  },
  actions: {
    setEditPlayerId(context, playerId) {
      context.commit("SET_EDIT_PLAYER_ID", playerId);
    },
    setImageChanged(context, status) {
      context.commit("SET_IMAGE_CHANGED_STATUS", status);
    },
    async setAllPlayers(context) {
      await axios
        .get(`${baseURL}/players/getplayers`)
        .then((res) => {
          if (res.status === 200) {
            context.commit("SET_ALL_PLAYERS", res.data);
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
    async savePlayer(context, playerData) {
      await axios
        .post(`${baseURL}/players/addplayer`, playerData)
        .then(async (res) => {
          if (res.status === 200) {
            this.$store.dispatch("Global/setNotificationInfo", {
              showNotification: true,
              notificationType: "success",
              notificationMessage: `Player ${playerData.playerName} added succesfully`,
            });

            store.dispatch("player/setAllPlayers");
          }
        })
        .catch((err) => {
          store.dispatch("Global/setNotificationInfo", {
            showNotification: true,
            notificationType: "error",
            notificationMessage: `${err.response.data}`,
          });
        });
    },
    async deletePlayer(context, playerId) {
      axios
        .delete(`${baseURL}/players/deleteplayer/${playerId}`)
        .then((response) => {
          store.dispatch("Global/setNotificationInfo", {
            showNotification: true,
            notificationType: "success",
            notificationMessage: response.data,
          });
          store.dispatch("Player/setAllPlayers");
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
  getters: {},
};
