<template>
  <div class="home">Dash</div>
</template>

<script>
// Components
// import ConfirmationModalComponent from "@/components/ConfirmModalComponent.vue";
export default {
  name: "HomeView",
  data() {
    return {
      showConfirmModal: true,
    };
  },
  components: {
    // ConfirmationModalComponent,
  },
  methods: {
    saveAction() {
      console.log("Saving");
    },
  },
};
</script>
