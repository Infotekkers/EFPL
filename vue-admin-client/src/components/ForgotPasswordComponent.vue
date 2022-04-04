<template>
  <form @submit.prevent="handleSubmit">
    <h3>Forgot Password</h3>
    <div class="form-group">
      <label> Reset link will be sent to the email you enter below </label>
      <input type="email" required placeholder="Email" v-model="email" />
    </div>
    <button>Submit</button>
  </form>
</template>

<script>
import axios from "axios";
export default {
  name: "ForgotPasswordComponent",
  data() {
    return {
      email: "",
      isLoading: false,
    };
  },
  methods: {
    async handleSubmit() {
      console.log("what"); // loading
      const response = await axios.post(`${this.baseUrl}/admin/requestReset`, {
        email: this.email,
      });
      console.log("e"); // done loading

      console.log(response.data);
    },
  },
  computed: {
    baseUrl() {
      return process.env.VUE_APP_API_BASE_URL;
    },
  },
};
</script>

<style></style>
