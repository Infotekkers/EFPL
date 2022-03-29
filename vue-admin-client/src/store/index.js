import { createStore } from "vuex";

// Fixtures Store
import GlobalStore from "./global.store";
import PlayerStore from "./player.store";

export default createStore({
  modules: {
    Global: GlobalStore,
    Player: PlayerStore,
  },
});
