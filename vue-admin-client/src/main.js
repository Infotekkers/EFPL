import { polyfill } from "mobile-drag-drop";
import { scrollBehaviourDragImageTranslateOverride } from "mobile-drag-drop/scroll-behaviour";
import { createApp } from "vue";
import App from "./App.vue";
import router from "./router";
import store from "./store";

import errorHandler from "./error/error.middleware";

polyfill({
  dragImageTranslateOverride: scrollBehaviourDragImageTranslateOverride,
});

const app = createApp(App);
app.config.errorHandler = errorHandler;

app.use(store).use(router).mount("#app");
