<template>
  <div class="about">
    <h1>This is an about page</h1>
  </div>
</template>

<script>
import axiosToken from "../services/AxiosTokenInstance";

export default {
  async beforeMount() {
    const teams = await axiosToken.get(
      `${process.env.VUE_APP_API_BASE_URL}/teams/all`
    );

    console.log(teams);
  },
};
</script>
