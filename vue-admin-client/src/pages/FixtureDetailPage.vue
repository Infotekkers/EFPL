<template>
  <div>
    <pre>{{ $data }}</pre>
    <pre>{{ players }}</pre>
    <pre>{{ fixtureDetailData }}</pre>
  </div>
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

  data: () => ({
    a: 1,
  }),

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
