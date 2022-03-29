<template>
  <div>
    <pre>{{ $data }}</pre>
  </div>
</template>

<script>
import { mapActions } from "vuex";
import { mapFields } from "vuex-map-fields";

export default {
  name: "FixtureDetailPage",
  beforeCreate() {
    // Get fixture id
    // Get teams w players + jerseys
  },

  computed: {
    ...mapFields("Fixture", ["fixtureDetailTrue, fixtureDetailData, players"]),
  },

  data: () => ({
    a: 1,
  }),

  methods: [...mapActions("Fixture", ["loadFixtureDetails"])],
};
</script>

<style lang="scss" scoped></style>
