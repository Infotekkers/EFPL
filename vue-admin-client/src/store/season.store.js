// import store from ".";

import axiosInstance from "../services/AxiosTokenInstance";
import store from "./index";

const baseURL = process.env.VUE_APP_API_BASE_URL;

export default {
  namespaced: true,
  state: {
    allLegacyTeams: [],
    allLegacyPlayers: [],
    isSeasonComplete: false,

    // selected for import
    importSelectedTeams: [],

    importSelectedPlayers: [],
  },
  getters: {},
  mutations: {
    SET_FETCH_INDICATOR(state, payload) {
      state.playersFetched = payload;
    },
    // all legacy teams
    SET_LEGACY_TEAMS(state, payload) {
      state.allLegacyTeams = payload;
    },
    SET_SEASON_STATUS(state, payload) {
      state.isSeasonComplete = payload;
    },

    SET_ALl_LEGACY_PLAYERS(state, payload) {
      state.allLegacyPlayers.push(payload);
    },

    SET_IMPORT_SELECTED_TEAM(state, payload) {
      state.importSelectedTeams.push(payload);
    },
    REPLACE_IMPORT_SELECTED_TEAM(state, payload) {
      state.importSelectedTeams = payload;
    },

    SET_IMPORT_SELECTED_PLAYER(state, payload) {
      state.importSelectedPlayers.push(payload);
    },
    REPLACE_IMPORT_SELECTED_PLAYER(state, payload) {
      state.importSelectedPlayers = payload;
    },
  },
  actions: {
    setImportSelectedTeam(context, legacyTeamId) {
      context.commit("SET_IMPORT_SELECTED_TEAM", legacyTeamId);
    },

    replaceImportSelectedTeam(context, value) {
      context.commit("REPLACE_IMPORT_SELECTED_TEAM", value);
    },

    setImportSelectedPlayer(context, playerInfo) {
      context.commit("SET_IMPORT_SELECTED_PLAYER", playerInfo);
    },

    replaceImportSelectedPlayer(context, value) {
      context.commit("REPLACE_IMPORT_SELECTED_PLAYER", value);
    },

    async getAllLegacyTeams(context) {
      await axiosInstance
        .get(`${baseURL}/backup/teams/all`)
        .then((response) => {
          if (response.status == 200) {
            context.commit("SET_LEGACY_TEAMS", response.data);
          }
        })
        .catch((error) => {
          console.log(error);
        });
    },

    async getAllLegacyPlayersByTeam(context, teamId) {
      context.commit("SET_FETCH_INDICATOR", false);
      await axiosInstance
        .get(`${baseURL}/backup/players/${teamId}`)
        .then((response) => {
          if (response.status == 200) {
            let result = [];
            response.data.forEach((player) => {
              const exists = store.state.Season.allLegacyPlayers.filter(
                (legacyPlayer) => {
                  return legacyPlayer.playerId == player.playerId;
                }
              );

              if (exists.length == 0) {
                context.commit("SET_ALl_LEGACY_PLAYERS", player);
              }

              result.push({
                playerId: player.playerId,
                teamId: teamId,
              });
            });

            result.forEach((playerInfo) => {
              context.commit("SET_IMPORT_SELECTED_PLAYER", playerInfo);
            });
          }
        })
        .catch((error) => {
          console.log(error);
        });
    },

    async initiateImport(context) {
      const importSelectedTeams = store.state.Season.importSelectedTeams;
      const importSelectedPlayers = store.state.Season.importSelectedPlayers;
      if (importSelectedTeams.length == 0) {
        store.dispatch("Global/setNotificationInfo", {
          showNotification: true,
          notificationType: "warning",
          notificationMessage: "No Selection to import.",
        });
      } else {
        console.log(importSelectedTeams, importSelectedPlayers);
        await axiosInstance
          .post(`${baseURL}/backup/restore`, {
            importSelectedTeams: importSelectedTeams,
            importSelectedPlayers: importSelectedPlayers,
          })
          .then((response) => {
            if (response.status == 201) {
              store.dispatch("Global/setNotificationInfo", {
                showNotification: true,
                notificationType: "success",
                notificationMessage: `Season Data Successfully Imported.`,
              });

              context.commit("REPLACE_IMPORT_SELECTED_TEAM", []);
              context.commit("REPLACE_IMPORT_SELECTED_PLAYER", []);

              store.dispatch("Season/getAllLegacyTeams");
            }
          })
          .catch((error) => {
            store.dispatch("Global/setNotificationInfo", {
              showNotification: true,
              notificationType: "error",
              notificationMessage: error.response.data,
            });
          });
      }
    },

    async getSeasonStatus(context) {
      await axiosInstance
        .get(`${baseURL}/backup/verify`)
        .then((response) => {
          if (response.status === 200) {
            context.commit("SET_SEASON_STATUS", response.data);
          }
        })
        .catch((error) => {
          store.dispatch("Global/setNotificationInfo", {
            showNotification: true,
            notificationType: "error",
            notificationMessage: error.response.data,
          });
        });
    },

    async exportSeason(context, backupType) {
      await axiosInstance
        .get(`${baseURL}/backup/data/${backupType}`)
        .then((response) => {
          if (response.status == 200) {
            store.dispatch("Global/setNotificationInfo", {
              showNotification: true,
              notificationType: "success",
              notificationMessage: `Season Data Successfully Exported.`,
            });

            store.dispatch("Season/getAllLegacyTeams");
          }
        })
        .catch((error) => {
          store.dispatch("Global/setNotificationInfo", {
            showNotification: true,
            notificationType: "error",
            notificationMessage: error.response.data,
          });
        });
    },
  },
};
