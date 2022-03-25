<template>
  <div
    :class="showModal === true ? 'modal-show' : 'modal-hide'"
    class="modal-show"
  >
    <div class="homeTeam"></div>
  </div>
</template>

<style scoped>
.container-col,
.container-row {
  display: flex;
}
.form-container {
  width: 30%;
}
.container-col {
  flex-direction: column;
}
.container-row {
  flex-direction: row;
}
.text-input {
  height: 28px;
}
.modal-show {
  width: 100%;
  height: 100vh;
  background: red;
  position: absolute;
  top: 0;
  left: 0;
  z-index: 1;
}
.modal-hide {
  display: none;
}
</style>

<script>
export default {
  name: "FixtureModalComponent",
  props: {
    showModal: Boolean,
  },
};
</script>
