<template>
  <div>
    <h1>Settings</h1>
    <div>
      <router-link :to="{ name: 'forgot-password' }"
        ><button>
          <h3>Reset</h3>
        </button></router-link
      >
    </div>

    <button @click="logOutAdmin">
      <h3>LogOut</h3>
    </button>
  </div>
</template>

<script>
export default {
  methods: {
    logOutAdmin() {
      this.$store.dispatch("logOutAdmin");
    },
  },
};
</script>
