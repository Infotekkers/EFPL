<template>
  <div class="forgot-pass">
    <form @submit.prevent>
      <h3>{{ $t("forgot password") }}</h3>
      <div class="form-group">
        <label>
          {{
            $t("Reset link will be sent to the email you enter below")
          }}</label
        >
        <input type="email" required v-model="email" />
      </div>
    </form>
    <button @click="handleSubmit">Submit</button>
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

<style scoped>
.forgot-pass {
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
  .forgot-pass {
    width: 100%;
  }
  form {
    border: none;
  }
}
</style>
