import { createApp } from "vue";
import App from "./App.vue";
import router from "./router";
import store from "./store";

import errorHandler from "./error/error.middleware";

const app = createApp(App);
app.config.errorHandler = errorHandler;

app.use(store).use(router).mount("#app");
