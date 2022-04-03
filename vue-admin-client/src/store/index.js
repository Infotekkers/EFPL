import { createStore } from "vuex";
import GlobalStore from "./global.store";
import AuthStore from "./auth.store";
export default createStore({
  modules: {
    Global: GlobalStore,
    Auth: AuthStore,
  },
});
