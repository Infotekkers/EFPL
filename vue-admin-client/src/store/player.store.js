import axios from "axios";
import store from "./index";

const baseURL = process.env.VUE_APP_API_BASE_URL;

export default {
  namespaced: true,
  state: {
    allPlayers: [],
    allPlayersUnfiltered: [],
    allTeams: [],

    // tracker
    teamFilterCondition: "",
    positionFilterCondition: "",
    priceFilterCondition: [],

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

    // TODO:USE TEAM Store or MERGE
    SET_ALL_TEAMS(state, payload) {
      state.allTeams = payload;
    },

    SET_TEAM_FILTER(state, payload) {
      state.teamFilterCondition = payload;
    },
    SET_POSITION_FILTER(state, payload) {
      state.positionFilterCondition = payload;
    },
    SET_PRICE_FILTER(state, payload) {
      state.priceFilterCondition = payload;
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
        .then(async (res) => {
          if (res.status === 200) {
            // TODO:Integrate with Team store

            // get all teams
            const allTeams = await axios.get(`${baseURL}/teams/all`);
            context.commit("SET_ALL_TEAMS", allTeams.data);

            // console.log(allTeams.data);
            for (let i = 0; i < res.data.length; i++) {
              const currentTeam = allTeams.data.filter((team) => {
                return team.teamId == res.data[i].eplTeamId;
              });

              // add relative ID
              res.data[i].relative_id = i + 1;

              // add team name
              res.data[i].teamName = currentTeam[0].teamName;
            }

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

    sortByID(context, order) {
      // reset
      store.state.Player.allPlayers = store.state.Player.allPlayersUnfiltered;

      if (order == 1) {
        store.state.Player.allPlayers.sort(function (playerOne, playerTwo) {
          return parseInt(playerOne.relative_id) <
            parseInt(playerTwo.relative_id)
            ? -1
            : parseInt(playerOne.relative_id) > parseInt(playerTwo.relative_id)
            ? 1
            : 0;
        });
      } else {
        store.state.Player.allPlayers.sort(function (playerOne, playerTwo) {
          return parseInt(playerOne.relative_id) >
            parseInt(playerTwo.relative_id)
            ? -1
            : parseInt(playerOne.relative_id) < parseInt(playerTwo.relative_id)
            ? 1
            : 0;
        });
      }
    },

    sortByTeam(context, order) {
      // reset
      store.state.Player.allPlayers = store.state.Player.allPlayersUnfiltered;

      if (order == 1) {
        store.state.Player.allPlayers.sort(function (playerOne, playerTwo) {
          return playerOne.teamName < playerTwo.teamName
            ? -1
            : playerOne.teamName > playerTwo.teamName
            ? 1
            : 0;
        });
      } else {
        store.state.Player.allPlayers.sort(function (playerOne, playerTwo) {
          return playerOne.teamName > playerTwo.teamName
            ? -1
            : playerOne.teamName < playerTwo.teamName
            ? 1
            : 0;
        });
      }
    },

    sortByPosition(context, order) {
      // // reset
      // store.state.Player.allPlayers = store.state.Player.allPlayersUnfiltered;
      if (order == 1) {
        store.state.Player.allPlayers.sort(function (playerOne, playerTwo) {
          return playerOne.position < playerTwo.position
            ? -1
            : playerOne.position > playerTwo.position
            ? 1
            : 0;
        });
      } else {
        store.state.Player.allPlayers.sort(function (playerOne, playerTwo) {
          return playerOne.position > playerTwo.position
            ? -1
            : playerOne.position < playerTwo.position
            ? 1
            : 0;
        });
      }
    },
    sortbyPrice(context, order) {
      // // reset
      // store.state.Player.allPlayers = store.state.Player.allPlayersUnfiltered;

      if (order == 1) {
        store.state.Player.allPlayers.sort(function (playerOne, playerTwo) {
          return playerOne.currentPrice < playerTwo.currentPrice
            ? -1
            : playerOne.currentPrice > playerTwo.currentPrice
            ? 1
            : 0;
        });
      } else {
        store.state.Player.allPlayers.sort(function (playerOne, playerTwo) {
          return playerOne.currentPrice > playerTwo.currentPrice
            ? -1
            : playerOne.currentPrice < playerTwo.currentPrice
            ? 1
            : 0;
        });
      }
    },
    sortByName(context, order) {
      // // reset
      // store.state.Player.allPlayers = store.state.Player.allPlayersUnfiltered;

      if (order == 1) {
        store.state.Player.allPlayers.sort(function (playerOne, playerTwo) {
          return playerOne.playerName < playerTwo.playerName
            ? -1
            : playerOne.playerName > playerTwo.playerName
            ? 1
            : 0;
        });
      } else {
        store.state.Player.allPlayers.sort(function (playerOne, playerTwo) {
          return playerOne.playerName > playerTwo.playerName
            ? -1
            : playerOne.playerName < playerTwo.playerName
            ? 1
            : 0;
        });
      }
    },
    filterSearchTerm(context, searchTerm) {
      if (searchTerm) {
        const searchTermCap = searchTerm.toUpperCase();
        const filteredPlayers = store.state.Player.allPlayers.filter(
          (player) => {
            return (
              player.playerName
                .toString()
                .toUpperCase()
                .includes(searchTermCap) ||
              player.teamName
                .toString()
                .toUpperCase()
                .includes(searchTermCap) ||
              player.position
                .toString()
                .toUpperCase()
                .includes(searchTermCap) ||
              player.currentPrice.toString().includes(searchTerm)
            );
          }
        );
        for (let i = 0; i < filteredPlayers.length; i++) {
          filteredPlayers[i].relative_id = i + 1;
        }

        context.commit("SET_FILTERED_PLAYERS", filteredPlayers);
      } else {
        //  reset
        store.state.Player.allPlayers = store.state.Player.allPlayersUnfiltered;
      }
    },

    filterByPrice(context, values) {
      // update filter value
      context.commit("SET_PRICE_FILTER", values);
    },

    filterByPosition(context, playerPosition) {
      // update filter value
      context.commit("SET_POSITION_FILTER", playerPosition);
    },

    filterByTeam(context, playerTeam) {
      // update
      context.commit("SET_TEAM_FILTER", playerTeam);
    },

    filterAll(context) {
      // reset
      store.state.Player.allPlayers = store.state.Player.allPlayersUnfiltered;

      // if team filter exists
      if (store.state.Player.teamFilterCondition) {
        // If not All
        if (store.state.Player.teamFilterCondition != "All") {
          const filteredPlayers = store.state.Player.allPlayers.filter(
            (player) => {
              return (
                player.teamName.toString().toUpperCase() ==
                store.state.Player.teamFilterCondition.toString().toUpperCase()
              );
            }
          );
          for (let i = 0; i < filteredPlayers.length; i++) {
            filteredPlayers[i].relative_id = i + 1;
          }
          context.commit("SET_FILTERED_PLAYERS", filteredPlayers);
        }
      }

      if (store.state.Player.positionFilterCondition) {
        if (store.state.Player.positionFilterCondition != "All") {
          const filteredPlayers = store.state.Player.allPlayers.filter(
            (player) => {
              return (
                player.position.toString().toUpperCase() ==
                store.state.Player.positionFilterCondition
                  .toString()
                  .toUpperCase()
              );
            }
          );
          for (let i = 0; i < filteredPlayers.length; i++) {
            filteredPlayers[i].relative_id = i + 1;
          }
          context.commit("SET_FILTERED_PLAYERS", filteredPlayers);
        }
      }

      if (
        store.state.Player.priceFilterCondition[0] &&
        store.state.Player.priceFilterCondition[1]
      ) {
        const filteredPlayers = store.state.Player.allPlayers.filter(
          (player) => {
            return (
              parseFloat(player.currentPrice) >
                parseFloat(store.state.Player.priceFilterCondition[0]) &&
              parseFloat(player.currentPrice) <
                parseFloat(store.state.Player.priceFilterCondition[1])
            );
          }
        );
        for (let i = 0; i < filteredPlayers.length; i++) {
          filteredPlayers[i].relative_id = i + 1;
        }
        context.commit("SET_FILTERED_PLAYERS", filteredPlayers);
      }
    },
  },
  getters: {},
};
