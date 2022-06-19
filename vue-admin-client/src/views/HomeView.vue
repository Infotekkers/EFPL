<template>
  <DashboardComponent />
</template>

<script>
// Components
// import SpinnerComponent from "@/components/SpinnerComponent.vue";
import DashboardComponent from "@/components/DashboardComponent.vue";
export default {
  name: "HomeView",
  data() {
    return {
      showConfirmModal: true,
    };
  },
  components: {
    // SpinnerComponent,
    DashboardComponent,
  },
  methods: {
    saveAction() {
      console.log("Saving");
    },
  },
};
</script>
