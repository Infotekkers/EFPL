<template>
  <div class="admin-login">
    <h1>{{ $t("Login Page") }}</h1>
    <form @submit.prevent="loginAdmin">
      <div class="email">
        <label>{{ $t("Email") }}:</label>
        <input required type="email" v-model="loginInfo.email" />
      </div>
      <div class="password">
        <label>{{ $t("Password") }}:</label>
        <input
          :type="showPassword ? 'text' : 'password'"
          required
          v-model="loginInfo.password"
          minlength="8"
        />
      </div>
      <div class="submit">
        <button>{{ $t("Login") }}</button>
      </div>
    </form>
    <button @click="showPassword = !showPassword">
      {{ $t("show password") }}
    </button>
    <div v-if="isLoading">Loading...</div>
    <p class="forgot-pass">
      <router-link :to="{ name: 'forgot-password' }"
        >{{ $t("forgot password") }}?</router-link
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
  width: 50%;
}
form {
  text-align: left;
  padding: var(--spacing-large);
  border: 1px solid;
  border-radius: 10px;
}
label {
  color: var(--neutral-900);
  display: inline-block;
  margin: var(--spacing-regular) 0 var(--spacing-base);
  font-size: var(--text-xsmall);
  font-weight: bold;
  text-transform: uppercase;
}
button {
  background: var(--success-200);
  color: var(--neutral-50);
  border: 0;
  padding: var(--spacing-small) var(--spacing-regular);
  margin-top: var(--spacing-regular);
  border-radius: 20px;
  cursor: pointer;
}
input {
  display: block;
  padding: var(--spacing-small) var(--spacing-xsmall);
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
@media screen and (max-width: 768px) {
  .admin-login {
    width: 100%;
  }
  form {
    border: none;
  }
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
