<template>
  <div class="main-modal-container" v-if="showConfirmModal">
    <!-- Close Button -->
    <div class="main-modal-close" @click="closeModal">X</div>
    <!-- Close Button -->

    <!-- Content -->
    <div class="main-modal-content confirmation-modal-content-container">
      <div class="confirmation-modal-content">
        <p
          v-for="message in modalMessage.split(' ')"
          :key="message"
          :class="
            boldWords.includes(message) ? 'confirmation-modal-bold-text' : ''
          "
        >
          {{ message }}
        </p>
      </div>
      <div class="confirmation-modal-buttons-container">
        <div class="main-button-secondary" @click="cancelAction">Cancel</div>
        <div class="main-button-primary" @click="mainAction">Save</div>
      </div>
    </div>
    <!-- Content -->
  </div>
</template>

<script>
export default {
  name: "ConfirmationModalComponent",
  props: {
    showConfirmModal: Boolean,
    modalMessage: String,
    boldWords: Array,
    saveAction: Function,
  },
  methods: {
    cancelAction() {
      this.closeModal();
    },

    mainAction() {
      // imported function
      this.saveAction();

      this.closeModal();
    },

    closeModal() {
      this.$emit("closeModal");
    },
  },
};
</script>

<style scoped>
.confirmation-modal-content-container {
  width: 30%;
  min-height: 200px;
  text-align: start;
  line-height: 1.6;
}

.confirmation-modal-content {
  display: flex;
  flex-wrap: wrap;
}
.confirmation-modal-content > p {
  margin-left: 5px;
}
.confirmation-modal-buttons-container {
  display: flex;
  width: fit-content;
  margin-left: auto;
  position: absolute;
  bottom: 16px;
  right: 24px;
}
.confirmation-modal-bold-text {
  font-weight: bold;
}
</style>
