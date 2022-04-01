import { createStore } from "vuex";
import GlobalStore from "./global.store";
import AdminStore from "./admin.store";
export default createStore({
  modules: {
    Global: GlobalStore,
    Admin: AdminStore,
  },
});
