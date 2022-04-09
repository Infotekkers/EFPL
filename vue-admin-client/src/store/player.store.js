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
            for (let i = 0; i < res.data.length; i++) {
              res.data[i].relative_id = i + 1;
            }
            console.log(res.data);
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
    async updatePlayer(context, updatedPlayer) {
      const playerId = store.state.Player.editPlayerId;
      console.log("ID", store.state.Player.imageChanged);
      const verifyChange = store.state.Player.allPlayers.filter((player) => {
        return (
          player.playerName == updatedPlayer.playerName &&
          player.eplTeamId == updatedPlayer.eplTeamId &&
          player.position == updatedPlayer.position &&
          player.currentPrice == updatedPlayer.currentPrice &&
          player.injurystatus == updatedPlayer.injurystatus &&
          player.inuryMessage == updatedPlayer.injuryMessage
        );
      });

      if (!verifyChange.length > 0 || store.state.Player.imageChanged) {
        axios
          .patch(`${baseURL}/players/updateplayer/${playerId}`, updatedPlayer)
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
      } else {
        store.dispatch("Global/setNotificationInfo", {
          showNotification: true,
          notificationType: "warning",
          notificationMessage: "No changes have been applied.",
        });
      }
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
