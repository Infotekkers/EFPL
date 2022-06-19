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
    SET_PLAYER_STAT_BY_TYPE(state, payload) {
      if (payload.operationType === "+")
        state.stats[payload.playerId][payload.gameweek][payload.statType]++;
      else if (payload.operationType === "-")
        state.stats[payload.playerId][payload.gameweek][payload.statType]--;
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
          // If player has no stats for current gameweek add initial stats
          if (!res.data[0].score[gameweek - 1]) {
            let score = {
              gameweekId: gameweek,
              price: 0,
              fantasyScore: 0,
              minutesPlayed: 0,
              goals: 0,
              assists: 0,
              cleanSheet: 0,
              yellows: 0,
              reds: 0,
              penalitiesMissed: 0,
              penalitiesSaved: 0,
              saves: 0,
              ownGoal: 0,
              transfersIn: 0,
              transfersOut: 0,
              form: 0,
            };
            res.data[0].score.push(score);
          }

          // if player has uninitialized stat fields initialize them to 0
          let score = {
            gameweekId: gameweek,
            price: 0,
            fantasyScore: 0,
            minutesPlayed: 0,
            goals: 0,
            assists: 0,
            cleanSheet: 0,
            yellows: 0,
            reds: 0,
            penalitiesMissed: 0,
            penalitiesSaved: 0,
            saves: 0,
            ownGoal: 0,
            transfersIn: 0,
            transfersOut: 0,
            form: 0,
          };
          score.goals = res.data[0].score[gameweek - 1].goals
            ? res.data[0].score[gameweek - 1].goals
            : 0;
          score.assists = res.data[0].score[gameweek - 1].assists
            ? res.data[0].score[gameweek - 1].assists
            : 0;
          score.yellows = res.data[0].score[gameweek - 1].yellows
            ? res.data[0].score[gameweek - 1].yellows
            : 0;
          score.reds = res.data[0].score[gameweek - 1].reds
            ? res.data[0].score[gameweek - 1].reds
            : 0;
          score.penalitiesMissed = res.data[0].score[gameweek - 1]
            .penalitiesMissed
            ? res.data[0].score[gameweek - 1].penalitiesMissed
            : 0;
          score.penalitiesSaved = res.data[0].score[gameweek - 1]
            .penalitiesMissed
            ? res.data[0].score[gameweek - 1].penalitiesMissed
            : 0;
          score.saves = res.data[0].score[gameweek - 1].saves
            ? res.data[0].score[gameweek - 1].saves
            : 0;
          score.ownGoal = res.data[0].score[gameweek - 1].ownGoal
            ? res.data[0].score[gameweek - 1].ownGoal
            : 0;

          res.data[0].score.splice(gameweek - 1, 1, score);
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

    updatePlayerStats(
      { commit },
      { playerId, gameweek, statType, operationType }
    ) {
      let payload;

      payload = {
        playerId,
        gameweek,
        statType,
        operationType,
      };
      commit("SET_PLAYER_STAT_BY_TYPE", payload);
    },

    async savePlayerStats({ state, rootState }, { playerId, gameweek }) {
      let url;
      let payload;

      payload = {
        playerId,
        gameweekId: gameweek,
        minutesPlayed: state.stats[playerId][gameweek].minutesPlayed,
        goals: state.stats[playerId][gameweek].goals,
        assists: state.stats[playerId][gameweek].assists,
        cleanSheet: state.stats[playerId][gameweek].cleanSheet,
        yellows: state.stats[playerId][gameweek].yellows,
        reds: state.stats[playerId][gameweek].reds,
        penalitiesMissed: state.stats[playerId][gameweek].penalitiesMissed,
        penalitiesSaved: state.stats[playerId][gameweek].penalitiesSaved,
        saves: state.stats[playerId][gameweek].saves,
        ownGoal: state.stats[playerId][gameweek].ownGoal,
        fantasyScore: state.stats[playerId][gameweek].fantasyScore,
      };

      url = `/fixtures/update/stats/${rootState.Fixture.fixtureDetailId}`;
      await axios
        .patch(url, payload)
        .then((res) => {
          store.dispatch("Global/setNotificationInfo", {
            showNotification: true,
            notificationType: "success",
            notificationMessage: res.data,
          });
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
