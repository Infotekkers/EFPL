<template>
  <div class="reset-pass">
    <form @submit.prevent="handleSubmit">
      <h3>Reset Your Password</h3>
      <div>
        <label> {{ $t("new") }} {{ $t("Password") }} </label>
        <input
          v-model="password"
          required
          placeholder="Password"
          :type="showPassword ? 'text' : 'password'"
        />
      </div>
      <div>
        <label> {{ $t("Password") }} {{ $t("Confirm") }}</label>
        <input
          v-model="password_confirm"
          required
          placeholder="Cofirm password"
          :type="showPassword ? 'text' : 'password'"
        />
      </div>

      <button>Submit</button>
    </form>
    <button @click="showPassword = !showPassword">
      {{ $t("የይለፍ ቃል አሳይ") }}
    </button>
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
<style scoped>
.reset-pass {
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
  font-size: var(--text-small);
  font-weight: bold;
  text-transform: uppercase;
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
button {
  background: var(--success-200);
  color: var(--neutral-50);
  border: 0;
  padding: var(--spacing-small) var(--spacing-regular);
  margin-top: var(--spacing-regular);
  border-radius: 20px;
  cursor: pointer;
  width: 30%;
}
.submit {
  text-align: center;
}
@media screen and (max-width: 768px) {
  .reset-pass {
    width: 100%;
  }
  form {
    border: none;
  }
}
</style>
