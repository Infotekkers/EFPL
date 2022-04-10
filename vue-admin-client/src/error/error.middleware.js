import store from "../store/index";

const errorHandler = (err, vm, info) => {
  const message = `${err.message} Happened at ${vm.$.type.name}  in ${info} `;
  console.log(message);

  if (process.env.VUE_APP_ENV == "development") {
    console.log(err);
  }

  if (err.message == "Network Error") {
    store.dispatch("Global/setConnection", false);
    store.dispatch("Global/setNotificationInfo", {
      showNotification: true,
      notificationType: "error",
      notificationMessage: "No Connection to server.",
    });
  } else if (err.message == "Cannot find module") {
    console.log("Module Err");
  } else if (
    err.message == "Request failed" &&
    (err.message.includes("401") || err.message.includes("403"))
  ) {
    store.dispatch("Global/setNotificationInfo", {
      showNotification: true,
      notificationType: "error",
      notificationMessage: "No Connection to server.",
    });
  }
};

export default errorHandler;
