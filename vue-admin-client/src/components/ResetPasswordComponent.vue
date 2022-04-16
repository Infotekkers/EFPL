<template>
  <div>
    <form @submit.prevent="handleSubmit">
      <h3>Reset Your Password</h3>
      <div>
        <label> Password </label>
        <input
          v-model="password"
          required
          placeholder="Password"
          :type="showPassword ? 'text' : 'password'"
        />
      </div>
      <div>
        <label>Confirm Your New Password </label>
        <input
          v-model="password_confirm"
          required
          placeholder="Cofirm password"
          :type="showPassword ? 'text' : 'password'"
        />
      </div>

      <button>Submit</button>
    </form>
    <button @click="showPassword = !showPassword">show password</button>
    <div>{{ error }}</div>
  </div>
</template>

<script>
export default {
  name: "ResetPasswordComponent",
  data() {
    return {
      error: "",
      showPassword: false,
      password: "",
      password_confirm: "",
      isLoading: false,
    };
  },
  methods: {
    async handleSubmit() {
      if (!(this.password === this.password_confirm)) {
        this.error = "Passwords don't match";
      } else {
        this.$store.dispatch("resetPassword", this.password);
      }
    },
  },
};
</script>
