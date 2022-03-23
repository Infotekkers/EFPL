<template>
  <div class="container">
    <div>{{ formatDate }}</div>

    <div v-if="fixture" :class="index % 2 == 0 ? 'grey' : 'white'">
      <span>{{ fixture.homeTeam }}</span>
      Vs
      <span> {{ fixture.awayTeam }}</span>
    </div>
  </div>
</template>

<style scoped>
.grey {
  background: grey;
}

.white {
  background: white;
}
</style>

<script>
export default {
  name: "FixtureComponent",
  props: {
    fixture: Object,
    index: Number,
  },

  computed: {
    formatDate() {
      const days = [
        "Monday",
        "Tuesday",
        "Wednesday",
        "Thursday",
        "Friday",
        "Saturday",
        "Sunday",
      ];
      const months = [
        "January",
        "February",
        "March",
        "April",
        "May",
        "June",
        "July",
        "August",
        "September",
        "October",
        "November",
        "December",
      ];
      const value = new Date(this.fixture.schedule);

      const fullDate = `${days[value.getDay()]} ${value.getDate()} ${
        months[value.getMonth()]
      } ${value.getFullYear()}`;

      return fullDate;
    },
  },
};
</script>
