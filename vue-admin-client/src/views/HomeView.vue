<template>
  <FixturesComponent />
</template>

<script>
// @ is an alias to /src

import FixturesComponent from "@/components/FixturesComponent";

export default {
  name: "HomeView",
  components: {
    FixturesComponent,
  },

  mounted() {
    console.log("Mounted Home");
  },
};
</script>
