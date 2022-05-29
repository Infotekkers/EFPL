<template>
  <div class="admin-login">
    <h1>{{ $t("Login Page") }}</h1>
    <form @submit.prevent="loginAdmin">
      <div class="email">
        <label>{{ $t("Email") }}:</label>
        <input required type="email" v-model="loginInfo.email" />
      </div>
      <div>
        <label>{{ $t("Password") }}:</label>
        <div class="password">
          <input
            :type="showPassword ? 'text' : 'password'"
            required
            v-model="loginInfo.password"
            minlength="8"
          />
          <button @click="showPassword = !showPassword">
            {{ $t("show password") }}
          </button>
        </div>
      </div>
      <div class="action-buttons">
        <p class="forgot-pass">
          <router-link :to="{ name: 'forgot-password' }">{{
            $t("forgot password")
          }}</router-link>
        </p>
        <div class="submit">
          <button>{{ $t("Login") }}</button>
        </div>
      </div>
    </form>

    <div v-if="isLoading">Loading...</div>
  </div>
</template>

<style scoped>
@import "../assets/design-system.css";

.admin-login {
  position: absolute;
  left: 50%;
  top: 50%;
  transform: translate(-50%, -50%);
  width: 90vw;
  max-width: 600px;

  background: var(--neutral-200);
  padding: var(--spacing-xlarge);
}
form {
  text-align: left;
}

h1 {
  font-size: var(--text-base);
  font-weight: 500;
  color: var(--neutral-600);
  margin-bottom: var(--spacing-base);
}

label {
  color: var(--neutral-700);
  display: inline-block;
  margin: var(--spacing-regular) 0 var(--spacing-2xsmall);
  font-size: var(--text-small);
}
button {
  border: 0;
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

.forgot-pass a {
  text-decoration: none;
  color: var(--neutral-700);
  font-size: var(--text-small);
}

.submit {
  text-align: center;
}

.password {
  position: relative;
}

.password > button {
  position: absolute;
  top: 50%;
  right: var(--spacing-base);
  transform: translateY(-50%);

  background: none;
  color: var(--success-400);
  padding: 0;
  margin: 0;
}

.action-buttons {
  display: flex;
  justify-content: flex-end;
  align-items: center;

  margin-top: var(--spacing-large);
}

.action-buttons button {
  margin-left: var(--spacing-base);
  font-weight: bold;
  background: var(--success-200);
  color: var(--success-900);
  padding: var(--spacing-small) var(--spacing-xlarge);
  border-radius: 20px;
  cursor: pointer;
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
