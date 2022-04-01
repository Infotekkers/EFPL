<template>
  <div class="container">
    <router-link to="/addplayer" class="btn btn-primary"
      >AddPlayer
    </router-link>
    <table>
      <thead>
        <tr>
          <th>ID</th>
          <th>Player Name</th>
          <th>Team</th>
          <th>Position</th>
          <th>Price</th>
          <th>Action</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="player in Players" :key="player">
          <td data-column="First Name">{{ player.playerId }}</td>
          <td data-column="Last Name">{{ player.playerName }}</td>
          <td data-column="Job Title">{{ player.eplTeamId }}</td>
          <td data-column="Twitter">{{ player.position }}</td>
          <td data-column="Twitter">{{ player.price }}</td>
          <td data-column="Twitter">
            <div class="btn-group" role="group">
              <router-link
                :to="{ name: 'viewPlayer', params: { id: player.playerId } }"
                class="btn btn-primary"
                >View
              </router-link>
              <router-link
                :to="{ name: 'editplayer', params: { id: player.playerId } }"
                class="btn btn-primary"
                >Edit
              </router-link>
              <button
                class="btn btn-danger"
                @click="deletePlayer(player.playerId)"
              >
                Delete
              </button>
            </div>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</template>
<script>
import store from "../../store/index";
export default {
  data() {
    return {
      Players: {}
    };
  },
  methods:{
   

  },
  computed: {
    getplayers() {
       this.Players = this.$store.Player.state.Players
    }
 
  }, 
  created() {
    this.$store.dispatch("Player/getallplayers")
  }
};
</script>
<style scoped>
table {
  width: 750px;
  border-collapse: collapse;
  margin: 50px auto;
}

/* Zebra striping */
tr:nth-of-type(odd) {
  background: #eee;
}

th {
  background: #3498db;
  color: white;
  font-weight: bold;
}

td,
th {
  padding: 10px;
  border: 1px solid #ccc;
  text-align: left;
  font-size: 18px;
}

/* 
Max width before this PARTICULAR table gets nasty
This query will take effect for any screen smaller than 760px
and also iPads specifically.
*/
@media only screen and (max-width: 760px),
  (min-device-width: 768px) and (max-device-width: 1024px) {
  table {
    width: 100%;
  }

  /* Force table to not be like tables anymore */
  table,
  thead,
  tbody,
  th,
  td,
  tr {
    display: block;
  }

  /* Hide table headers (but not display: none;, for accessibility) */
  thead tr {
    position: absolute;
    top: -9999px;
    left: -9999px;
  }

  tr {
    border: 1px solid #ccc;
  }

  td {
    /* Behave  like a "row" */
    border: none;
    border-bottom: 1px solid #eee;
    position: relative;
    padding-left: 50%;
  }

  td:before {
    /* Now like a table header */
    position: absolute;
    /* Top/left values mimic padding */
    top: 6px;
    left: 6px;
    width: 45%;
    padding-right: 10px;
    white-space: nowrap;
    /* Label the data */
    content: attr(data-column);

    color: #000;
    font-weight: bold;
  }
}
</style>
