<template>
  <div class="home">Dash</div>
  <!-- <SpinnerComponent /> -->
</template>

<script>
// Components
// import SpinnerComponent from "@/components/SpinnerComponent.vue";
export default {
  name: "HomeView",
  data() {
    return {
      showConfirmModal: true,
    };
  },
  components: {
    // SpinnerComponent,
  },
  methods: {
    saveAction() {
      console.log("Saving");
    },
  },
};
</script>
