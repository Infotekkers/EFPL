<template>
  <div class="container">
    <div class="number">{{ team.teamId }}</div>
    <div class="logo">Logo</div>
    <div class="team">{{ team.teamName }}</div>
    <div class="position">Position</div>
  </div>
</template>

<style scoped>
.container {
  display: flex;
  justify-content: space-between;
}
</style>

<script>
export default {
  name: "TeamComponent",
  props: {
    team: Object,
  },

  methods: {},
  computed: {},
};
</script>
