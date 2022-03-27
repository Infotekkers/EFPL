<template>
  <div class="admin-login">
    <h1>Admin Login</h1>
    <form @submit.prevent="loginAdmin">
      <label>Email:</label>
      <input type="email" required v-model="login.email" />
      <label>Password:</label>
      <input type="password" required v-model="login.password" />
      <div class="submit"><button>Login</button></div>
    </form>
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
import axios from "axios";
import store from "../store/index";
export default {
  data() {
    return {
      login: {
        email: "",
        password: "",
      },
    };
  },
  name: "AdminLoginView",

  methods: {
    async loginAdmin() {
      if (this.connectionStatus) {
        axios
          .post(`${this.baseURL}/admin/login`, this.login)
          .then((response) => {
            if (response.status === 201) {
              console.log("logged in");
              this.$router.push("/admin/settings");
            }
          })
          .catch((error) => {
            console.log(error);
          });
      }
      console.log(this.baseURL);
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
