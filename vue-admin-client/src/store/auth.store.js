import axios from "axios";
import store from "./index";
const baseURL = process.env.VUE_APP_API_BASE_URL;
export default {
  state: {
    admins: [],
    currentAdmin: {},
  },
  getters: {
    allAdmins: (state) => state.admins,
    currentAdmin: (state) => state.currentAdmin,
  },
  actions: {
    async setAdmin({ commit }) {
      let currentAdmin = JSON.parse(window.localStorage.currentAdmin);
      commit("SET_CURRENT_ADMIN", currentAdmin);
    },
    logOutAdmin({ commit }) {
      commit("LOG_OUT");
    },
    async loginAdmin({ commit }, { email, password }) {
      axios
        .post(`${baseURL}/admin/login`, {
          email: email,
          password: password,
        })
        .then((response) => {
          if (response.status === 201) {
            store.dispatch("Global/setNotificationInfo", {
              showNotification: true,
              notificationType: "success",
              notificationMessage: `${response.data.email} successfully logged in`,
            });
            commit("SET_CURRENT_ADMIN", response.data);
            console.log("logged in");
          }
        })
        .catch((err) => {
          if (err.response.status === 400) {
            store.dispatch("Global/setNotificationInfo", {
              showNotification: true,
              notificationType: "error",
              notifcationMessage: `${err.response.data}`,
            });
          }
        });
    },
  },
  mutations: {
    SET_ADMINS: (state, admins) => (state.admins = admins),
    LOG_OUT: (state) => {
      state.currentAdmin = {};
      window.localStorage.setItem("currentAdmin", JSON.stringify({}));
    },
    SET_CURRENT_ADMIN: (state, admin) => {
      state.currentAdmin = admin;
      window.localStorage.setItem("currentAdmin", JSON.stringify(admin));
    },
  },
};
