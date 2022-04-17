<template>
  <div class="admin-login">
    <h1>Login</h1>
    <form @submit.prevent="loginAdmin">
      <div class="email">
        <label>Email:</label>
        <input required type="email" v-model="loginInfo.email" />
      </div>
      <div class="password">
        <label>Password:</label>
        <input
          :type="showPassword ? 'text' : 'password'"
          required
          v-model="loginInfo.password"
          minlength="8"
        />
      </div>
      <div class="submit"><button>Login</button></div>
    </form>
    <button @click="showPassword = !showPassword">show password</button>
    <div v-if="isLoading">Loading...</div>
    <p class="forgot-pass">
      <router-link :to="{ name: 'forgot-password' }"
        >Forgot Password?</router-link
      >
    </p>
  </div>
</template>

<style scoped>
@import "../assets/design-system.css";

.admin-login {
  position: absolute;
  left: 50%;
  top: 50%;
  transform: translate(-50%, -50%);
  width: 25%;
}
form {
  text-align: left;
  padding: 40px;
  border: 1px solid;
  border-radius: 10px;
}
label {
  color: var(--neutral-900);
  display: inline-block;
  margin: 25px 0 15px;
  font-size: var(--text-xsmall);
  font-weight: bold;
  text-transform: uppercase;
}
button {
  background: var(--success-200);
  color: var(--neutral-50);
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
  border-bottom: 1px solid var(--neutral-600);
  color: var(--neutral-600);
}
.forgot-pass {
  text-decoration: none;
}
.submit {
  text-align: center;
}
</style>

<script>
export default {
  data() {
    return {
      showPassword: false,
      loginInfo: {
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

      this.isLoading = false;
    },
  },
};
</script>
