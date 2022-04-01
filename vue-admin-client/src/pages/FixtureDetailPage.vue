<template>
  <main>
    <!-- Team Selection -->
    <TeamSelector
      :homeTeamId="this.homeTeamId"
      :awayTeamId="this.awayTeamId"
      :homeTeamName="this.fixtureDetailData.teams[this.homeTeamId].teamName"
      :awayTeamName="this.fixtureDetailData.teams[this.awayTeamId].teamName"
      @changeActiveTeam="changeActiveTeam"
    />
    <!-- Formation Selector -->
    <select
      name="formations"
      id="formations"
      @change="changeFormation"
      ref="formations"
    >
      <option value="4-3-3">4-3-3</option>
      <option value="4-4-2">4-4-2</option>
      <option value="3-5-2">3-5-2</option>
      <option value="3-4-3">3-4-3</option>
      <option value="5-3-2">5-3-2</option>
      <option value="4-5-1">4-5-1</option>
      <option value="3-6-1">3-6-1</option>
      <option value="4-6-0">4-6-0</option>
      <option value="5-4-1">5-4-1</option>
      <option value="1-6-3">1-6-3</option>
    </select>
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

    // Formation Selection
    changeFormation(e) {
      this.fixtureDetailData.formations[this.activeTeamId] = e.target.value;
    },

    // Update lineup
    // Update stats
    // Cache changes
  },
};
</script>

<style lang="scss" scoped></style>
