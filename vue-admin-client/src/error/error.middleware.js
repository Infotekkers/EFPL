import store from "../store/index";

const errorHandler = (err, vm, info) => {
  const message = `${err.message} Happened at ${vm.$.type.name}  in ${info} `;
  console.log(message);

  if (process.env.VUE_APP_ENV == "development") {
    // console.log(err);
  }

  if (err.message == "Network Error") {
    store.dispatch("Global/setConnection", false);
  } else if (err.message == "Cannot find module") {
    console.log("Module Err");
  }
};

export default errorHandler;
