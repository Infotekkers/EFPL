import { createStore } from "vuex";
import GlobalStore from "./global.store";
export default createStore({
  modules: {
    Global: GlobalStore,
  },
});
