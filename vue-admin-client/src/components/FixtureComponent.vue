<template>
  <div class="fixture" @click="goToDetailPage">
    <div class="date-info">{{ formatDate }}</div>

    <div v-if="fixture" :class="index % 2 == 0 ? 'grey' : 'white'">
      <span class="homeTeam">{{ fixture.homeTeam }}</span>
      <span class="gameTime">{{ formatTime }}</span>
      <span class="awayTeam"> {{ fixture.awayTeam }}</span>
    </div>
  </div>
</template>

<style scoped>
.fixture {
  margin-top: 36px;
}
.grey {
  background: grey;
}

.white {
  background: white;
}
.date-info {
  text-align: center;
  margin-bottom: 4px;
}
.homeTeam,
.awayTeam {
  font-size: 24px;
}

.gameTime {
  margin: 0 24px;
}
</style>

<script>
import router from "../router/index";
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

    formatTime() {
      const value = new Date(this.fixture.schedule);
      let hour =
        value.getHours() < 9 ? `0${value.getHours()}` : value.getHours();
      let minute =
        value.getMinutes() < 9 ? `0${value.getMinutes()}` : value.getMinutes();

      return `${hour}:${minute}`;
    },
  },

  methods: {
    goToDetailPage() {
      router.push({
        path: "/fixture/detail",
        query: { id: this.fixture.matchId },
      });
    },
  },
};
</script>
