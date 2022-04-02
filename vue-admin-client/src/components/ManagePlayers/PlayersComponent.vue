<template>
  <div class="container">
    <div class="interior">
      <a class="btn" href="#add-modal">Add Player</a>
    </div>
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
        <tr v-for="player in getplayers" :key="player.playerId">
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
    <div id="add-modal" class="modal-window">
      <div>
        <a href="#" title="Close" class="modal-close">Close</a>
        <form @submit.prevent="addPlayer">
          <div class="row" id="multiCollapseExample1">
            <div class="col">
              <div class="collapse multi-collapse">
                <div class="card card-body">
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group">
                        <input
                          type="text"
                          class="form-control"
                          v-model="form.playerName"
                          placeholder="Player Name"
                        />
                      </div>
                    </div>
                    <!--  col-md-6   -->

                    <div class="col-md-6">
                      <div class="form-group">
                        <input
                          type="text"
                          class="form-control"
                          v-model="form.eplTeamId"
                          placeholder="Team"
                        />
                      </div>
                    </div>
                    <!--  col-md-6   -->
                  </div>

                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group">
                        <input
                          type="text"
                          class="form-control"
                          v-model="form.position"
                          placeholder="Player Position"
                        />
                      </div>
                    </div>
                    <!--  col-md-6   -->

                    <div class="col-md-6">
                      <div class="form-group">
                        <input
                          type="text"
                          class="form-control"
                          v-model="form.currentPrice"
                          placeholder="Price"
                        />
                      </div>
                    </div>
                    <!--  col-md-6   -->
                  </div>
                  <hr />
                  <h2>Availablity</h2>
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group">
                        <input
                          type="text"
                          class="form-control"
                          v-model="form.injuryStatus"
                          placeholder="injuryStatus"
                        />
                      </div>
                    </div>
                    <!--  col-md-6   -->

                    <div class="col-md-6">
                      <div class="form-group">
                        <input
                          type="text"
                          class="form-control"
                          v-model="form.injuryMessage"
                          placeholder="Injury Detail"
                        />
                      </div>
                    </div>
                    <!--  col-md-6   -->
                  </div>
                </div>
              </div>
            </div>
          </div>
          <button type="submit" class="btn btn-primary">Submit</button>
        </form>
      </div>
    </div>
  </div>
</template>
<script>
import store from "../../store/index";

export default {
  name: "PlayersComponent",
  data() {
    return {
      form: {
        playerName: "",
        eplTeamId: "",
        position: "",
        currentPrice: "",
        availablity: {
          injuryStatus: "",
          injuryMessage: "",
        },
      },
    };
  },
  computed: {
    getplayers() {
      return store.state.Player.players;
    },
  },
  methods: {
    addPlayer() {
      store.dispatch("Player/addPlayer", this.form);
    },
  },
  beforeMount() {
    this.$store.dispatch("Player/getallplayers");
  },
};
</script>

<style lang="scss" scoped>
.modal-window {
  position: fixed;
  background-color: rgba(255, 255, 255, 0.25);
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  z-index: 999;
  visibility: hidden;
  opacity: 0;
  pointer-events: none;
  transition: all 0.3s;
  &:target {
    visibility: visible;
    opacity: 1;
    pointer-events: auto;
  }
  & > div {
    width: 400px;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    padding: 2em;
    background: rgb(77, 73, 73);
  }
  header {
    font-weight: bold;
  }
  h1 {
    font-size: 150%;
    margin: 0 0 15px;
  }
}

.modal-close {
  color: #aaa;
  line-height: 50px;
  font-size: 80%;
  position: absolute;
  right: 0;
  text-align: center;
  top: 0;
  width: 70px;
  text-decoration: none;
  &:hover {
    color: black;
  }
}

/* Demo Styles */

html,
body {
  height: 100%;
}

html {
  font-size: 18px;
  line-height: 1.4;
}

body {
  font-family: apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen-Sans,
    Ubuntu, Cantarell, "Helvetica Neue", sans-serif;
  font-weight: 600;
  background-image: linear-gradient(to right, #7f53ac 0, #657ced 100%);
  color: black;
}

a {
  color: inherit;
}

.container {
  display: grid;
  justify-content: center;
  align-items: center;
  height: 30vh;
}

.modal-window {
  & > div {
    border-radius: 1rem;
  }
}

.modal-window div:not(:last-of-type) {
  margin-bottom: 15px;
}

small {
  color: lightgray;
}

.btn {
  background-color: rgb(72, 20, 196);
  padding: 1em 1.5em;
  border-radius: 1rem;
  text-decoration: none;
  i {
    padding-right: 0.3em;
  }
}

input {
  border: 2px solid #eeeeee;
  height: 46px;
  margin: 10px 0 0 0;
  padding: 1%;
  font-size: 1.2em;
  line-height: 1.5em;
  color: #333333;
  letter-spacing: 0.01em;
  font-style: normal;
  font-weight: 300;
  font-family: source-sans-pro;
}
table {
  width: 750px;
  border-collapse: collapse;
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
