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
    <div v-if="error">{{ error }}</div>
  </div>
</template>

<script>
import axios from "axios";
export default {
  name: "ResetPasswordComponent",
  data() {
    return {
      error: "",
      showPassword: false,
      password: "",
      password_confirm: "",
    };
  },
  methods: {
    async handleSubmit() {
      console.log(this.token);
      if (this.password === this.password_confirm) {
        const response = await axios.post(
          `${this.baseUrl}/admin/resetPass/${this.token}`,
          {
            password: this.password,
          }
        );
        this.$router.push({ name: "admin-login" });
        console.log(response);
      }
    },
  },
  computed: {
    baseUrl() {
      return process.env.VUE_APP_API_BASE_URL;
    },
    token() {
      return this.$route.params.token;
    },
  },
};
</script>

<style></style>
