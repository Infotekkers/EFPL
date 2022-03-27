export default {
  namespaced: true,
  state: {
    connection: true,
  },
  getters: {
    getConnection: function (state) {
      return state.connection;
    },
  },
  mutations: {
    SET_CONNECTION(state, payload) {
      state.connection = payload;
    },
  },
  actions: {
    setConnection(context, connection) {
      context.commit("SET_CONNECTION", connection);
    },
  },
};
