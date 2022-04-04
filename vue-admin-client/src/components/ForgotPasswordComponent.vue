<template>
  <div>
    <form @submit.prevent>
      <h3>Forgot Password</h3>
      <div class="form-group">
        <label> Reset link will be sent to the email you enter below </label>
        <input type="email" required placeholder="Email" v-model="email" />
      </div>
      <button @click="handleSubmit">Submit</button>
    </form>
    <p v-if="isLoading">Loading.....</p>
  </div>
</template>

<script>
export default {
  name: "ForgotPasswordComponent",
  data() {
    return {
      email: "",
      isLoading: false,
    };
  },
  methods: {
    handleSubmit() {
      this.isLoading = true;
      this.$store.dispatch("requestReset", this.email);
      this.isLoading = false;
    },
  },
};
</script>

<style></style>
