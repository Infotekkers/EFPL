<template>
  <div class="admin-login">
    <h1>Admin Login</h1>
    <form @submit.prevent="loginAdmin">
      <label>Email:</label>
      <input required type="email" v-model="loginInfo.email" />
      <label>Password:</label>
      <input
        :type="showPassword ? 'text' : 'password'"
        required
        v-model="loginInfo.password"
        minlength="8"
      />
      <div class="submit"><button>Login</button></div>
      <button @click="showPassword = !showPassword">show password</button>
    </form>
    <div v-if="isLoading">Loading...</div>
  </div>
</template>

<style>
.admin-login {
  max-width: 420px;
  margin: 30px auto;
}
form {
  background: white;
  text-align: left;
  padding: 40px;
  border: 1px solid;
  border-radius: 10px;
}
label {
  color: rgb(26, 24, 24);
  display: inline-block;
  margin: 25px 0 15px;
  font-size: 0.6rem;
  font-weight: bold;
  text-transform: uppercase;
}
button {
  background: #42b983;
  color: white;
  border: 0;
  padding: 10px 20px;
  margin-top: 20px;
  border-radius: 20px;
  cursor: pointer;
}
input {
  display: block;
  padding: 10px 6px;
  width: 100%;
  box-sizing: border-box;
  border: none;
  border-bottom: 1px solid #ddd;
  color: #555;
}
.submit {
  text-align: center;
}
</style>

<script>
import store from "../store/index";
export default {
  data() {
    return {
      showPassword: false,
      loginInfo: {
        showPassword: true,
        email: "",
        password: "",
      },
      error: "",
      isLoading: false,
    };
  },
  name: "AdminLoginView",

  methods: {
    loginAdmin() {
      this.isLoading = true;
      this.$store.dispatch("loginAdmin", this.loginInfo);
      this.$router.replace({ name: "admin" });
      this.isLoading = false;
    },
  },
  computed: {
    baseURL() {
      return process.env.VUE_APP_API_BASE_URL;
    },

    connectionStatus() {
      return store.state.Global.connection;
    },
  },
};
</script>
