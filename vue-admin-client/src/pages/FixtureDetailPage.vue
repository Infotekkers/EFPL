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
    <select name="formations" id="formations" @change="changeFormation">
      <option value="4-3-3">4-3-3</option>
      <option value="4-4-2">4-4-2</option>
      <option value="3-5-2">3-5-2</option>
      <option value="3-4-3">3-4-3</option>
      <option value="5-3-2">5-3-2</option>
      <option value="4-5-1">4-5-1</option>
      <option value="4-2-3-1">4-2-3-1</option>
      <option value="4-3-1-2">4-3-1-2</option>
      <option value="4-1-2-3">4-1-2-3</option>
      <option value="4-1-3-2">4-1-3-2</option>
      <option value="4-3-2-1">4-3-2-1</option>
      <option value="4-4-1-1">4-4-1-1</option>
      <option value="4-1-2-1-2">4-1-2-1-2</option>
      <option value="3-4-1-2">3-4-1-2</option>
      <option value="3-6-1">3-6-1</option>
      <option value="4-6-0">4-6-0</option>
      <option value="5-4-1">5-4-1</option>
      <option value="1-6-3">1-6-3</option>
      <option value="4-2-2-2">4-2-2-2</option>
      <option value="3-3-1-3">3-3-1-3</option>
      <option value="3-3-3-1">3-3-3-1</option>
    </select>
    <FormationSelector />
    <!-- Field -->
    <!-- Bench Selector -->
    <!-- Action Btns -->
  </main>
</template>

<script>
import { mapFields } from "vuex-map-fields";
import { mapActions } from "vuex";
import TeamSelector from "../components/FixtureDetailTeamSelector.vue";
import FormationSelector from "../components/FixtureDetailFormationSelector.vue";

export default {
  name: "FixtureDetailPage",

  components: {
    TeamSelector,
    FormationSelector,
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
  },
};
</script>

<style lang="scss" scoped></style>
