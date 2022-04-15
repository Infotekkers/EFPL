import { createApp } from "vue";
import i18n from "./i18n";
import App from "./App.vue";
import router from "./router";
import store from "./store/index";

import errorHandler from "./error/error.middleware";

const app = createApp(App);
app.config.errorHandler = errorHandler;

app.use(i18n).use(store).use(router).mount("#app");
