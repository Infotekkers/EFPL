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
    <!-- Bench Selector -->
    <!-- Action Btns -->
  </main>
</template>

<script>
import { mapFields } from "vuex-map-fields";
import { mapActions } from "vuex";
import TeamSelector from "../components/FixtureDetailTeamSelector.vue";
import Field from "../components/FixtureDetailField.vue";

export default {
  name: "FixtureDetailPage",

  components: {
    TeamSelector,
    Field,
  },

  mounted() {
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

<style lang="scss" scoped></style>
