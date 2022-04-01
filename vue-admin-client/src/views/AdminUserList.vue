<template>
  <div>
    <div v-for="admin in allAdmins" :key="admin.id">
      {{ admin.email }} <button @click="logInAdmin(admin)">Login</button>
    </div>
  </div>
</template>

<script>
import { mapGetters, mapActions } from "vuex";
export default {
  methods: {
    ...mapActions(["loadAdmins", "logInAdmin"]),
  },
  computed: {
    ...mapGetters(["allAdmins"]),
  },
  created() {
    this.loadAdmins();
  },
};
</script>

<style></style>
