<template>
  <div class="home">
    <FixturesComponent />
  </div>
</template>

<script>
// @ is an alias to /src
import FixturesComponent from "@/components/FixturesComponent";

export default {
  name: "HomeView",
  components: {
    FixturesComponent,
  },
  data() {
    return {
      showNotification: true,
    };
  },
};
</script>
