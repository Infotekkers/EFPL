import { createStore } from "vuex";
import GlobalStore from "./global.store";
import AuthStore from "./auth.store";
import FixtureStore from "./fixture.store";
import TeamsStore from "./team.store";
import SeasonStore from "./season.store";

export default createStore({
  modules: {
    Global: GlobalStore,
    Fixture: FixtureStore,
    Team: TeamsStore,
    Auth: AuthStore,
    Season: SeasonStore,
  },
});
