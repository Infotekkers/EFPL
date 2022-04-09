<template>
  <main>
    <!-- Team Selection -->
    <TeamSelector
      :homeTeamId="parseInt(this.homeTeamId)"
      :awayTeamId="parseInt(this.awayTeamId)"
      :homeTeamName="this.fixtureDetailData.teams[this.homeTeamId].teamName"
      :awayTeamName="this.fixtureDetailData.teams[this.awayTeamId].teamName"
      @changeActiveTeam="changeActiveTeam"
    />
    <!-- Field -->
    <Field :activeTeamId="this.activeTeamId" />
    <!-- Locker -->
    <Locker :activeTeamId="this.activeTeamId" />
  </main>
</template>

<script>
import { mapFields } from "vuex-map-fields";
import { mapActions } from "vuex";
import TeamSelector from "../components/FixtureDetailTeamSelector.vue";
import Field from "../components/FixtureDetailField.vue";
import Locker from "../components/FixtureDetailLocker.vue";

export default {
  name: "FixtureDetailPage",

  components: {
    TeamSelector,
    Field,
    Locker,
  },

  mounted() {
    if (!this.fixtureDetailId)
      this.setFixtureDetailId(
        new URL(window.location.href).searchParams.get("id")
      );
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

@media screen and (min-width: 900px) {
  main {
    display: flex;
    flex-direction: row;
    justify-content: center;
  }
}
</style>
