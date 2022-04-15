import axiosInstance from "../services/AxiosTokenInstance";
import store from "./index";

const baseURL = process.env.VUE_APP_API_BASE_URL;

export default {
  namespaced: true,
  state: {
    allLegacyTeams: [],
    allLegacyPlayers: [],
    importSelectedTeams: [],
    importSelectedPlayers: [],
    currentLegacyTeamId: "",
  },
  getters: {},
  mutations: {
    SET_ALL_LEGACY_TEAMS(state, payload) {
      state.allLegacyTeams = payload;
    },
    SET_CURRENT_LEGACY_TEAM_ID(state, payload) {
      state.currentLegacyTeamId = payload;
    },
    SET_ALL_LEGACY_PLAYERS(state, payload) {
      state.allLegacyPlayers.push(payload);
    },
    ADD_IMPORT_TEAM(state, payload) {
      console.log(state.importSelectedPlayers);
      if (payload in state.importSelectedPlayers) {
        const removed = state.importSelectedTeams.filter((team) => {
          return team !== payload;
        });

        const removedPlayers = state.importSelectedPlayers.filter((player) => {
          return player.teamId !== payload;
        });

        console.log(removedPlayers);

        state.importSelectedTeams = removed;
        state.importSelectedPlayers = removedPlayers;
      } else {
        state.importSelectedTeams.push(payload);
      }
    },
    ADD_IMPORT_PLAYER(state, payload) {
      if (payload in state.importSelectedPlayers) {
        const removed = state.importSelectedPlayers.filter((player) => {
          return player.playerName !== payload[0];
        });

        state.importSelectedPlayers = removed;
      } else {
        state.importSelectedPlayers.push(payload);
      }
    },
  },
  actions: {
    addImportTeam(context, teamInfo) {
      context.commit("ADD_IMPORT_TEAM", teamInfo[0]);
      store.dispatch("Global/setNotificationInfo", {
        showNotification: true,
        notificationType: "success",
        notificationMessage: `${teamInfo[1]} added to import list.`,
      });
    },
    addImportPlayer(context, playerInfo) {
      context.commit("ADD_IMPORT_PLAYER", {
        playerId: playerInfo[0],
        teamId: playerInfo[1],
      });
    },

    async setAllLegacyTeams(context) {
      axiosInstance
        .get(`${baseURL}/backup/teams/all`)
        .then((response) => {
          if (response.status === 200) {
            context.commit("SET_ALL_LEGACY_TEAMS", response.data);
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

    async exportBackUp() {
      axiosInstance
        .get(`${baseURL}/backup/`)
        .then((response) => {
          if (response.status === 200) {
            store.dispatch("Global/setNotificationInfo", {
              showNotification: true,
              notificationType: "success",
              notificationMessage: "Done",
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

    async getLegacyPlayerByTeam(context, legacyTeamId) {
      axiosInstance
        .get(`${baseURL}/backup/players/${legacyTeamId}`)
        .then((response) => {
          if (response.status === 200) {
            response.data.forEach((data) => {
              context.commit("SET_ALL_LEGACY_PLAYERS", data);
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

    async importAll() {
      const importSelectedTeams = JSON.parse(
        JSON.stringify(store.state.Season.importSelectedTeams)
      );
      const importSelectedPlayers = JSON.parse(
        JSON.stringify(store.state.Season.importSelectedPlayers)
      );

      const data = {
        importSelectedPlayers: importSelectedPlayers,
        importSelectedTeams: importSelectedTeams,
      };

      console.log(data);

      await axiosInstance
        .post(`${baseURL}/backup/restore`, {
          importSelectedPlayers: importSelectedPlayers,
          importSelectedTeams: importSelectedTeams,
        })
        .then((response) => {
          if (response.status == 201) {
            store.dispatch("Global/setNotificationInfo", {
              showNotification: true,
              notificationType: "success",
              notificationMessage: `Done`,
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
  },
};
