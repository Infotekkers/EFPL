<template>
  <div>
    <h1>Contact Page</h1>

    <form @submit.prevent="handleSubmit">
      <label>{{ $t("Email") }}:</label>
      <select v-model="info.receiverEmail" required>
        <option hidden disabled selected value>
          -- {{ $t("select email") }}--
        </option>
        <option value="mikealexiv565@gmail.com">{{ $t("Dev -1") }}</option>
        <option value="sorrysoup156@gmail.com">{{ $t("Dev -2") }}</option>
      </select>
      <div></div>

      <div class="emailBody">
        <textarea
          placeholder="write something.... "
          required
          v-model="info.emailBody"
          style="height: 200px"
        ></textarea>
      </div>

      <div class="submit">
        <button>{{ $t("submit") }}</button>
      </div>
    </form>
    <p v-if="isLoading">{{ $t("Loading") }}</p>
  </div>
</template>

<script>
export default {
  data() {
    return {
      info: { receiverEmail: "", emailBody: "" },
      isLoading: null,
    };
  },
  methods: {
    async handleSubmit() {
      this.isLoading = true;
      this.$store.dispatch("sendEmail", this.info);
      this.isLoading = false;
    },
  },
};
</script>

<style scoped>
@import "../assets/design-system.css";
input[type="email"],
select,
textarea {
  width: 60%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 5px;
  box-sizing: border-box;
  margin-top: 6px;
  margin-bottom: 16px;
  resize: vertical;
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
  background-color: #04aa6d;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}
</style>
