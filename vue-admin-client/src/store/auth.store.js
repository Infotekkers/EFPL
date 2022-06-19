import axiosInstance from "@/services/AxiosTokenInstance";
import axios from "axios";
import router from "../router/index";
import store from "./index";
const baseURL = process.env.VUE_APP_API_BASE_URL;
export default {
  // namespaced: true,
  state: {
    currentAdmin: {},
  },
  getters: {
    currentAdmin: (state) => state.currentAdmin,
  },
  actions: {
    // set current admin
    async setAdmin({ commit }) {
      if (window.localStorage.currentAdmin) {
        let currentAdmin = JSON.parse(window.localStorage.currentAdmin);
        const token = currentAdmin.token;

        await axios
          .post(`${baseURL}/admin/validateAdmin`, {
            token,
          })
          .then((response) => {
            if (response.status.code === 200) {
              commit("SET_CURRENT_ADMIN", currentAdmin);
            }
          })
          .catch((err) => {
            console.log(err);
            window.localStorage.removeItem("currentAdmin");
            router.push({ name: "admin-login" });
          });
      }
    },
    // log out admin
    logOutAdmin({ commit }) {
      commit("LOG_OUT");
      store.dispatch("Global/setShowSidebar", {
        showSidebar: false,
      });
      router.push({ name: "admin-login" });
    },
    // login admin
    async loginAdmin({ commit }, { email, password }) {
      await axios
        .post(`${baseURL}/admin/login`, {
          email: email,
          password: password,
        })
        .then((response) => {
          if (response.status === 201) {
            // store.dispatch("Global/setNotificationInfo", {
            //   showNotification: true,
            //   notificationType: "success",
            //   notificationMessage: `${response.data.email} successfully logged in`,
            // });
            store.dispatch("Global/setShowSidebar", {
              showSidebar: true,
            });

            commit("SET_CURRENT_ADMIN", response.data);
            router.replace({ name: "Home" });
          }
        })
        .catch((err) => {
          store.dispatch("Global/setNotificationInfo", {
            showNotification: true,
            notificationType: "error",
            notificationMessage: `${err.response.data.message}`,
          });
        });
    },
    // request rest
    async requestReset(context, email) {
      axios
        .post(`${baseURL}/admin/requestReset`, { email: email })
        .then((response) => {
          if (response.status === 200) {
            store.dispatch("Global/setNotificationInfo", {
              showNotification: true,
              notificationType: "success",
              notificationMessage: `Email successfully sent to ${email} `,
            });
          }
        })
        .catch((err) => {
          store.dispatch("Global/setNotificationInfo", {
            showNotification: true,
            notificationType: true,
            notificationMessage: `${err.response.data.message}`,
          });
        });
    },
    // admin reset pass
    async resetPassword(context, password) {
      const token = router.currentRoute.value.params.token;

      axios
        .post(`${baseURL}/admin/resetPass/${token}`, {
          password: password,
        })
        .then((response) => {
          if (response.status === 200) {
            store.dispatch("Global/setNotificationInfo", {
              showNotification: true,
              notificationType: "success",
              notificationMessage: `Password Successfully Reset `,
            });
            router.push({ name: "admin-login" });
          }
        })
        .catch((err) => {
          store.dispatch("Global/setNotificationInfo", {
            showNotification: true,
            notificationType: "error",
            notificationMessage: `${err.response.data.message}`,
          });
        });
    },
    async changePassword(context, { old_password, new_password }) {
      await axiosInstance
        .post(`${baseURL}/admin/changePass`, {
          oldPass: old_password,
          newPass: new_password,
        })
        .then((response) => {
          if (response.status === 200) {
            store.dispatch("Global/setNotificationInfo", {
              showNotification: true,
              notificationType: "success",
              notificationMessage: `Password Changed Successfully`,
            });
          }
          router.push({ name: "settings" });
        })
        .catch((err) => {
          store.dispatch("Global/setNotificationInfo", {
            showNotification: true,
            notificationType: true,
            notificationMessage: `${err.response.data.message}`,
          });
        });
    },

    // user reset pass
    async userResetPassword(context, password) {
      const token = router.currentRoute.value.params.token;
      axios
        .post(`${baseURL}/user/resetPass/${token}`, {
          password: password,
        })
        .then((response) => {
          if (response.status === 200) {
            store.dispatch("Global/setNotificationInfo", {
              showNotification: true,
              notificationType: "success",
              notificationMessage: `Password Successfully Reset `,
            });
          }
        })
        .catch((err) => {
          store.dispatch("Global/setNotificationInfo", {
            showNotification: true,
            notificationType: "error",
            notificationMessage: `${err.response.data.message}`,
          });
        });
    },
    // send email
    async sendEmail(context, { receiverEmail, emailBody }) {
      await axiosInstance
        .post(`${baseURL}/admin/sendEmail`, {
          receiverEmail: receiverEmail,
          emailBody: emailBody,
        })
        .then((response) => {
          if (response.status === 200) {
            store.dispatch("Global/setNotificationInfo", {
              showNotification: true,
              notificationType: "success",
              notificationMessage: `successfully sent`,
            });
            router.push({ name: "settings" });
          }
        })
        .catch((err) => {
          store.dispatch("Global/setNotificationInfo", {
            showNotification: true,
            notificationType: "error",
            notificationMessage: `Something went wrong ${err}`,
          });
        });
    },
  },
  mutations: {
    LOG_OUT: (state) => {
      state.currentAdmin = {};
      window.localStorage.removeItem("currentAdmin");
    },
    SET_CURRENT_ADMIN: (state, admin) => {
      state.currentAdmin = admin;
      window.localStorage.setItem("currentAdmin", JSON.stringify(admin));
    },
  },
};
