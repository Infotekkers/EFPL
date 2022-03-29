<template>
  <div></div>
</template>

<script>
import { mapFields } from "vuex-map-fields";
import { mapActions } from "vuex";

export default {
  name: "FixtureDetailPage",
  mounted() {
    this.loadFixtureDetails(this.fixtureDetailId);
  },

  computed: {
    ...mapFields("Fixture", [
      "players",
      "fixtureDetailData",
      "fixtureDetailId",
    ]),
  },

  data: () => ({}),

  methods: {
    ...mapActions("Fixture", [
      "loadFixtureDetails",
      "saveFixtureLineup",
      "saveFixtureStats",
    ]),
    // Update lineup
    // Update stats
  },
};
</script>

<style lang="scss" scoped></style>
