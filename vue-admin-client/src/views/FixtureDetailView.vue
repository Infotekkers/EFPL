<template>
  <main v-if="fixtureDetailsLoaded && !errorLog">
    <TeamSelector
      :homeTeamId="parseInt(this.homeTeamId)"
      :awayTeamId="parseInt(this.awayTeamId)"
      :activeTeamId="parseInt(this.activeTeamId)"
      :homeTeamName="this.fixtureDetailData.teams[this.homeTeamId].teamName"
      :awayTeamName="this.fixtureDetailData.teams[this.awayTeamId].teamName"
      :homeTeamLogo="this.fixtureDetailData.logos[this.homeTeamId]"
      :awayTeamLogo="this.fixtureDetailData.logos[this.awayTeamId]"
      :score="score[this.fixtureDetailId]"
      :status="this.fixtureDetailData.status"
      @changeActiveTeam="changeActiveTeam"
    />
    <Field :activeTeamId="this.activeTeamId" />
    <Locker :activeTeamId="this.activeTeamId" />
  </main>
  <main v-else-if="errorLog">Encountered an error</main>
  <main v-else>
    <Spinner id="spinner" />
  </main>
</template>

<script>
import { mapFields } from "vuex-map-fields";
import { mapActions } from "vuex";
import Router from "../router/index";
import TeamSelector from "../components/FixtureDetailTeamSelector.vue";
import Field from "../components/FixtureDetailField.vue";
import Locker from "../components/FixtureDetailLocker.vue";
import Spinner from "../components/SpinnerComponent.vue";

export default {
  name: "FixtureDetailPage",

  components: {
    TeamSelector,
    Field,
    Locker,
    Spinner,
  },

  mounted() {
    if (!this.fixtureDetailId)
      this.setFixtureDetailId(
        new URL(window.location.href).searchParams.get("id")
      );
    if (!this.fixtureDetailId)
      Router.push({
        path: "/admin/fixtures",
      });

    this.loadFixtureDetails(this.fixtureDetailId);
    this.homeTeamId = this.fixtureDetailId.split("|")[0];
    this.awayTeamId = this.fixtureDetailId.split("|")[1];
    this.activeTeamId = this.homeTeamId;
  },

  computed: {
    ...mapFields("Fixture", [
      "players",
      "fixtureDetailData",
      "fixtureDetailId",
      "fixtureDetailsLoaded",
      "errorLog",
      "score",
    ]),
  },

  data: () => ({
    homeTeamId: 0,
    awayTeamId: 0,
    activeTeamId: 0,
  }),

  methods: {
    ...mapActions("Fixture", [
      "loadFixtureDetails",
      "saveFixtureLineup",
      "saveFixtureStats",
      "setFixtureDetailId",
    ]),

    // Team Selection
    changeActiveTeam(e) {
      if (this.activeTeamId !== e) this.activeTeamId = e;
    },

    // Update lineup
    // Update stats
    // Cache changes
  },
};
</script>

<style lang="scss" scoped>
main {
  display: flex;
  flex-direction: column;
  justify-content: center;
}

#spinner {
  align-self: center;
}

@media screen and (min-width: 900px) {
  main {
    display: flex;
    flex-direction: row;
    justify-content: center;
  }
}
</style>
