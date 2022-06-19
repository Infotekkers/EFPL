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
    <div class="actions">
      <button class="tertiary" @click.prevent="$router.go(-1)">
        {{ $t("Back") }}
      </button>
      <button @click="handleSubmit">{{ $t("submit") }}</button>
    </div>
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
h3 {
  color: var(--neutral-600);
  font-weight: 500;
  font-size: var(--text-base);
}

.forgot-pass {
  position: absolute;
  left: 50%;
  top: 50%;
  transform: translate(-50%, -50%);
  max-width: 600px;
  width: 90vw;
  padding: var(--spacing-large);
}
form {
  text-align: left;
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
  padding: var(--spacing-small) var(--spacing-large);
  margin-top: var(--spacing-regular);
  border-radius: 20px;
  cursor: pointer;
}

.actions {
  display: flex;
  justify-content: flex-end;
}

.tertiary {
  background: none;
  color: var(--nuetral-200);
}
.submit {
  text-align: center;
}
@media screen and (max-width: 768px) {
  form {
    border: none;
  }
}
</style>
