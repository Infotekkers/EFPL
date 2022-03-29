import axios from "axios";
import store from "./index";

const baseURL = process.env.VUE_APP_API_BASE_URL;
export default {
  namespaced: true,
  state: {
    players: [],
    player: "",
  },

  mutations: {
    SAVE_GRADES(state, payload) {
      state.players = payload;
    },
    SAVE_GRADE(state, payload) {
      state.player = payload;
    },
  },
  actions: {
    async addPlayer(context, player) {
      await axios
        .post(`${baseURL}/players/addplayer`, player)
        .then(async (res) => {
          if (res.status === 200) {
            this.$store.dispatch("Global/setNotificationInfo", {
              showNotification: true,
              notificationType: "success",
              notificationMessage: `Player ${player.playerName} added succesfully`,
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
    },
  },
  getters: {
    getAllPlayers: function (state) {
      return state.players;
    },

    getPlayer: function (state) {
      return state.player;
    },
  },
};
