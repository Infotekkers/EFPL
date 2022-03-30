import { createStore } from "vuex";

// Fixtures Store
import GlobalStore from "./global.store";
import FixtureStore from "./fixture.store";
import TeamsStore from "./team.store";

export default createStore({
  modules: {
    Global: GlobalStore,
    Fixture: FixtureStore,
    Team: TeamsStore,
  },
});
