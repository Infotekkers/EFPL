<template>
  <section>
    <router-view />
  </section>
</template>

<script>
export default {
  name: "MainView",
};
</script>

<style scoped>
section {
  /* width: 100%; */
  min-height: 100vh;
  padding: var(--spacing-small);
}
</style>
