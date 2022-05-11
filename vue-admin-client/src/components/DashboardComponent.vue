<template>
  <main>
    <div class="cards">
      <div class="card-single">
        <div>
          <h1 id="customer"></h1>
          <span>Happy Clients</span>
        </div>
        <div>
          <span class="fas fa-users"></span>
        </div>
      </div>
      <div class="card-single">
        <div>
          <h1 id="project"></h1>
          <span>Projects Done!</span>
        </div>
        <div>
          <span class="fas fa-clipboard"></span>
        </div>
      </div>
      <div class="card-single">
        <div>
          <h1 id="order"></h1>
          <span>Confirmed Orders</span>
        </div>
        <div>
          <span class="fas fa-shopping-bag"></span>
        </div>
      </div>
      <div class="card-single">
        <div>
          <h1>
            <sup>$</sup>
            <p id="income"><b>k</b></p>
          </h1>
          <span>weekly Income</span>
        </div>
        <div>
          <span class="fab fa-google-wallet"></span>
        </div>
      </div>
    </div>
    <div class="recent-grid">
      <div class="projects">
        <div class="card">
          <div class="card-header">
            <h3 class="heading">Recent Projects</h3>
            <button>See all <span class="fas fa-arrow-right"></span></button>
          </div>
          <div class="card-body">
            <div class="table-responsive">
              <table width="100%">
                <thead>
                  <tr>
                    <td>Project Title</td>
                    <td>Department</td>
                    <td>Status</td>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>UI/UX Design</td>
                    <td>UI Team</td>
                    <td><span class="status purple"></span>review</td>
                  </tr>
                  <tr>
                    <td>Web Dev</td>
                    <td>Frontend</td>
                    <td><span class="status pink"></span>pending</td>
                  </tr>
                  <tr>
                    <td>Ushop App</td>
                    <td>Mobile Team</td>
                    <td><span class="status orange"></span>active</td>
                  </tr>
                  <tr>
                    <td>UI/UX Design</td>
                    <td>UI Team</td>
                    <td><span class="status purple"></span>review</td>
                  </tr>
                  <tr>
                    <td>Web Dev</td>
                    <td>Frontend</td>
                    <td><span class="status pink"></span>pending</td>
                  </tr>
                  <tr>
                    <td>Ushop App</td>
                    <td>Mobile Team</td>
                    <td><span class="status orange"></span>active</td>
                  </tr>
                  <tr>
                    <td>UI/UX Design</td>
                    <td>UI Team</td>
                    <td><span class="status purple"></span>review</td>
                  </tr>
                  <tr>
                    <td>Web Dev</td>
                    <td>Frontend</td>
                    <td><span class="status pink"></span>pending</td>
                  </tr>
                  <tr>
                    <td>Ushop App</td>
                    <td>Mobile Team</td>
                    <td><span class="status orange"></span>active</td>
                  </tr>
                  <tr>
                    <td>UI/UX Design</td>
                    <td>UI Team</td>
                    <td><span class="status purple"></span>review</td>
                  </tr>
                  <tr>
                    <td>Web Dev</td>
                    <td>Frontend</td>
                    <td><span class="status pink"></span>pending</td>
                  </tr>
                  <tr>
                    <td>Ushop App</td>
                    <td>Mobile Team</td>
                    <td><span class="status orange"></span>active</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
      <div class="customers">
        <div class="card">
          <div class="card-header">
            <h3 class="heading">New customer</h3>
            <button>Sell all<span class="fas fa-arrow-right"></span></button>
          </div>

          <div class="card-body">
            <div class="customer">
              <div class="info">
                <img
                  src="https://assets.codepen.io/3853433/internal/avatars/users/default.png?format=auto&version=1617122449&width=40&height=40"
                  alt=""
                />
                <div>
                  <h4>lion Emusky</h4>
                  <small>CEO @ TLS</small>
                </div>
              </div>
              <div class="contact">
                <span class="fas fa-user-circle"></span>
                <span class="fas fa-comment"></span>
                <span class="fas fa-phone"></span>
              </div>
            </div>

            <div class="customer">
              <div class="info">
                <img
                  src="https://assets.codepen.io/3853433/internal/avatars/users/default.png?format=auto&version=1617122449&width=40&height=40"
                  alt=""
                />
                <div>
                  <h4>Ion Emusky</h4>
                  <small>C0O @ AFK</small>
                </div>
              </div>
              <div class="contact">
                <span class="fas fa-user-circle"></span>
                <span class="fas fa-comment"></span>
                <span class="fas fa-phone"></span>
              </div>
            </div>

            <div class="customer">
              <div class="info">
                <img
                  src="https://assets.codepen.io/3853433/internal/avatars/users/default.png?format=auto&version=1617122449&width=40&height=40"
                  alt=""
                />
                <div>
                  <h4>El-lion musky</h4>
                  <small>CEO @ FOMO</small>
                </div>
              </div>
              <div class="contact">
                <span class="fas fa-user-circle"></span>
                <span class="fas fa-comment"></span>
                <span class="fas fa-phone"></span>
              </div>
            </div>

            <div class="customer">
              <div class="info">
                <img
                  src="https://assets.codepen.io/3853433/internal/avatars/users/default.png?format=auto&version=1617122449&width=40&height=40"
                  alt=""
                />
                <div>
                  <h4>John Bezos</h4>
                  <small>CEO @ Mazon</small>
                </div>
              </div>
              <div class="contact">
                <span class="fas fa-user-circle"></span>
                <span class="fas fa-comment"></span>
                <span class="fas fa-phone"></span>
              </div>
            </div>

            <div class="customer">
              <div class="info">
                <img
                  src="https://assets.codepen.io/3853433/internal/avatars/users/default.png?format=auto&version=1617122449&width=40&height=40"
                  alt=""
                />
                <div>
                  <h4>Beelz Gai8</h4>
                  <small>CEO @ Mycroft</small>
                </div>
              </div>
              <div class="contact">
                <span class="fas fa-user-circle"></span>
                <span class="fas fa-comment"></span>
                <span class="fas fa-phone"></span>
              </div>
            </div>

            <div class="customer">
              <div class="info">
                <img
                  src="https://assets.codepen.io/3853433/internal/avatars/users/default.png?format=auto&version=1617122449&width=40&height=40"
                  alt=""
                />
                <div>
                  <h4>Jeam Krook</h4>
                  <small>CEO @ Penapple</small>
                </div>
              </div>
              <div class="contact">
                <span class="fas fa-user-circle"></span>
                <span class="fas fa-comment"></span>
                <span class="fas fa-phone"></span>
              </div>
            </div>

            <div class="customer">
              <div class="info">
                <img
                  src="https://assets.codepen.io/3853433/internal/avatars/users/default.png?format=auto&version=1617122449&width=40&height=40"
                  alt=""
                />
                <div>
                  <h4>Cris Coya</h4>
                  <small>CEO @ PenCode</small>
                </div>
              </div>
              <div class="contact">
                <span class="fas fa-user-circle"></span>
                <span class="fas fa-comment"></span>
                <span class="fas fa-phone"></span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </main>
</template>
<style scoped>
* {
  padding: 0;
  margin: 0;
  font-family: "Rajdhani", sans-serif;
  box-sizing: border-box;
  outline: none;
  user-select: none;
  list-style-type: none;
  text-decoration: none;
  transition: all 400ms;
  overflow-x: hidden;
}

/* ===================== */
@import url("https://fonts.googleapis.com/css2?family=Cinzel+Decorative:wght@400;700&display=swap");

body {
  background: rgba(0, 0, 0, 0.1);
  /* background: url(https://image.freepik.com/free-vector/abstract-gradient-shapes-background_79603-156.jpg); */
  backdrop-filter: blur(10px);
}

.main-wrapper {
  background: rgba(0, 0, 0, 0.1);
  backdrop-filter: blur(6px);
}
.user-wrapper b {
  filter: brightness(150%);
}

.video-1,
.video-2 {
  z-index: -999;
  position: fixed;
  width: fit-content;
  height: 100%;
  top: 0;
}

.video-2 {
  visibility: hidden;
}
.light .video-2 {
  visibility: visible;
}
.light .video-1 {
  display: none;
}
.search {
  position: relative;
  width: 40px;
  height: 60px;
  border-radius: 30px;
  transition: var(--transition);
  box-shadow: 0 0 0 5px rgba(183, 204, 235, 0.378);
  overflow: hidden;
}

.search:hover,
.search:active,
.search:focus {
  width: 400px;
}

body.light .search.active {
  width: 350px;
}

.search .icon {
  position: relative;
  top: 0;
  left: 0;
  width: 40px;
  height: 60px;
  border-radius: 50px;
  display: flex;
  justify-content: center;
  align-items: center;

  cursor: pointer;
}
.search:hover .search-rotate {
  transform: rotate(100deg);
  position: absolute;
}
.search .icon::before {
  content: "";
  position: absolute;
  width: 15px;
  height: 15px;
  border-radius: 50%;
  border: 3px solid var(--new-content);
  transform: translate(-4px, -4px);
}

.search .icon::after {
  content: "";
  position: absolute;
  width: 3px;
  height: 12px;
  background: var(--new-content);
  transform: translate(6px, 6px) rotate(315deg);
}

.search .input {
  position: relative;
  width: 300px;
  height: 60px;
  left: 60px;
  /* top: -100%; */
  transition: var(--transition);
  display: flex;
  justify-content: center;
  align-items: center;
}

.search .input input {
  position: absolute;
  top: 0;
  width: 100%;
  height: 100%;
  border: none;
  font: 600 1.2rem rajdhani;
  background: var(--orange);
  -webkit-text-fill-color: transparent;
  -webkit-background-clip: text;
  background-clip: text;
  outline: none;
  padding-left: 10px;
}
.dis-wrap {
  position: absolute;
  top: 5rem;
  display: flex;
  justify-content: center;
  left: 55%;
  z-index: auto;
  background: #000;
  border-radius: 12px;
  padding: 10px;
  animation: fade 1s ease-in infinite;
}

.dis-warn {
  position: absolute;
  top: 5rem;
  display: flex;
  justify-content: center;
  left: 55%;
  z-index: auto;
  background: #000;
  border-radius: 12px;
  padding: 10px;
}

@keyframes fade {
  50% {
    opacity: 0.2;
  }
}
.display {
  text-transform: uppercase;
  font: 600 2rem rajdhani;
  background: linear-gradient(45deg, #cc03c9, #009dff, #00ffff);
  -webkit-text-fill-color: transparent;
  -webkit-background-clip: text;
  background-clip: text;
}
.light .display {
  filter: brightness(140%);
}
/* ======================= */
.light .search {
  box-shadow: 0 2px 2px 2px #e70558;
}

.light .search .icon::before {
  border: 3px solid #e70558;
}

.light .search .icon::after {
  background: var(--pink);
}

/* ===================== */

.switch {
  position: absolute;
  top: 99px;
  left: calc(50% - 75px);
  max-height: 80px;
  max-width: 160px;
  display: flex;
  justify-content: center;
  align-items: center;
}

#toggle {
  position: relative;
  display: block;
  width: 80px;
  height: 60px;
  border-radius: 50px;
  backdrop-filter: blur(6px);
  box-shadow: inset 0 5px 6px rgb(0 0 0 / 27%), inset 0 3px 6px rgb(0 0 0 / 6%),
    inset 0 -5px 6px rgb(0 0 0 / 21%);
  cursor: pointer;
  transition: var(--transition);
}
#toggle:hover {
  width: 160px;
}
#toggle:after {
  content: "LIGHT";
  position: absolute;
  left: 84px;
  top: 13px;
  color: #ffffff00;
  font-weight: 600;
  font-size: 29px;
}

#toggle:hover:after,
#dashboard:hover,
#kleenpulse:hover {
  text-transform: uppercase;
  background: linear-gradient(-140deg, #fff, #0ff, #ff004c, #ffcc00, #0ff);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-size: 200% 200%;
  animation: anime 6s linear infinite;
}

#toggle .fas.fa-moon,
#toggle .fas.fa-sun {
  position: absolute;
  left: 27px;
  top: 21px;
  z-index: 2;
  font-size: 1.6rem;
}
#toggle .fas.fa-sun {
  opacity: 0;
}

.light #toggle .fas.fa-moon {
  opacity: 0;
}
.light #toggle .fas.fa-sun {
  opacity: 1;
  top: 16px;
  font-size: 1.9rem;
  background: var(--pink);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
}

#toggle .indicator {
  position: absolute;
  left: 0;
  top: 0;
  width: 80px;
  height: 100%;
  background: #c3c2c2;
  cursor: pointer;
  border-radius: 50%;
  transform: scale(0.9);
  box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2), inset 0 10px 3px var(--indicator);
}

#toggle:hover .indicator {
  box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2), inset 0 -10px 3px var(--indicator);
}

#toggle .indicator:active,
body.light #toggle .indicator:active {
  transform: scale(0.7);
}

/* #toggle.active .indicator {
    left: calc(160px / 2);
} */

/* DARK MODE STYLING BEGINS HERE! */

body.light #toggle {
  background: #000b11;
  box-shadow: inset 2px 11px 5px rgb(0 0 0), inset 0 4px 13px #d20260,
    inset 0 4px 0px #d20260;
}

body.light #toggle:after {
  content: "DARK";
  position: absolute;
  left: 83px;
  top: 13px;
  font-weight: 600;
  font-size: 29px;
}

body.light #toggle .indicator {
  background: transparent;
  cursor: pointer;
  border-radius: 50%;
  transform: scale(0.9);
  box-shadow: 0 3px 12px rgb(0 0 0), inset 0 4px 4px #d20260,
    inset 0 -2px 4px #d20260;
}

body.light #toggle:hover .indicator {
  box-shadow: 0 3px 12px rgb(0 0 0), inset 0 1px 1px #d20260,
    inset 0 -7px 0px #d20260;
}

body.light .switch {
  background: transparent;

  overflow: hidden;
  display: block;
}

body.light .card-single {
  box-shadow: 0 0 10px #00d9ff;
  border-radius: 10px;
}

body.light .card-single:hover {
  box-shadow: 0 0 0px;
}

body.light .card-single:hover h1 {
  color: var(--content-BG);
}

body.light .card-single div:last-child span {
  color: var(--dark-text);
}

body.light header {
  border-bottom: 1px solid rgba(6, 204, 239, 0.548);
  box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.6);
}

body.light header h2 {
  color: cyan;
}

body.light .sidebar {
  box-shadow: 5px 0 20px rgba(0, 0, 0, 0.7);
  z-index: 999;
}

.light .sidebar li a span {
  font-size: 1.5rem;
  filter: brightness(140%);
  background: var(--orange);
  -webkit-text-fill-color: transparent;
  -webkit-background-clip: text;
  background-clip: text;
}

body.light .sidebar-menu a:hover {
  background: transparent;
  color: #0ff;
  padding-top: 0.7rem;
  padding-bottom: 1rem;
  border-radius: 30px 0 0 30px;
  border: 1px solid #0ff;
}

body.light .card-single:hover {
  background: linear-gradient(45deg, #00616c, #00f7ff);
  filter: brightness(100%);
}

body.light .card-header {
  border-bottom: 1px solid var(--dark-text);
}

body.light thead tr {
  border-top: 1px solid #d20260;
  border-bottom: 1px solid #d20260;
}

body.light td {
  color: #fff;
}

body.light .contact span {
  color: var(--dark-text);
}

body.light .card-header button:hover {
  background: transparent;
  border: 1px solid cyan;
  color: cyan;
}

/* DARK MODE STYLING ENDS HERE! */

#pop-wrap {
  display: none;
  font-size: 4vmin;
  position: fixed;
  width: auto;
  min-width: 20vw;
  height: auto;
  top: 50%;
  left: 50%;
  text-align: center;
  transform: translate(-50%, -50%);
}

#pop-wrap .pop-up {
  background: var(--main-color);
  -webkit-text-fill-color: transparent;
  text-fill-color: transparent;
  -webkit-background-clip: text;
  background-clip: text;
}

/* ===========SIDEBAR========== */
.sidebar {
  width: 250px;
  position: fixed;
  left: 0;
  top: 0;
  height: 100%;
  background: rgba(0, 0, 0, 0.2);
  backdrop-filter: blur(6px);
  box-shadow: 5px 0 10px rgba(0, 0, 0, 0.3);
  z-index: 100;
  transition: width 300ms;
}

.sidebar-brand {
  height: 90px;
  padding: 1rem 0rem 1rem 2rem;
  /* 	color:#fff; */
}

.sidebar-brand span {
  display: inline-block;
  padding-right: 1rem;
}

.sidebar-brand h2 span:last-child,
.sidebar-brand h2 span:first-child {
  filter: brightness(140%);
  background: var(--pink);
  -webkit-text-fill-color: transparent;
  -webkit-background-clip: text;
  background-clip: text;
  text-transform: uppercase;
}

.sidebar-menu li {
  width: 100%;
  margin-bottom: 1.7rem;
  padding-left: 1rem;
}

.sidebar-menu a {
  padding-left: 1rem;
  display: block;
  color: var(--off-white);
  text-transform: uppercase;
  font-weight: 500;
  font-size: 1.1rem;
  overflow: hidden;
}

.sidebar-menu a:hover {
  /* background: var(--off-white); */
  /* color: var(--icon-color); */
  padding-top: 0.7rem;
  padding-bottom: 1rem;
  border: 1px solid rgba(255, 255, 255, 0.62);
  background: rgba(0, 0, 0, 0.2);
  backdrop-filter: blur(6px);
  border-radius: 30px 0 0 30px;
}

.sidebar-menu a span:first-child {
  font-size: 1.5rem;
  padding-right: 1rem;
  transform: translatey(5px);
}

.sidebar-menu {
  margin-top: 1rem;
}

#nav-toggle:checked + .sidebar {
  width: 70px;
}

#nav-toggle:checked + .sidebar {
  width: 70px;
}

#nav-toggle:checked + .sidebar .sidebar-brand,
#nav-toggle:checked + .sidebar li {
  padding-left: 1rem;
  text-align: center;
}

#nav-toggle:checked + .sidebar li a {
  padding-left: 0rem;
}

#nav-toggle:checked + .sidebar .sidebar-brand h2 span:last-child,
#nav-toggle:checked + .sidebar li a span:last-child {
  display: none;
}

/* ===========SIDEBAR========== */

#nav-toggle:checked ~ .main-content {
  margin-left: 70px;
}

#nav-toggle:checked ~ .main-content header {
  width: calc(100% - 70px);
  left: 70px;
}

.main-content {
  transition: margin-left 300ms;
  margin-left: 250px;
  background: rgba(0, 0, 0, 0.2);
}

/* ====GLASSMORPHISM CHANGE HERE!==== */
header {
  /* 	background:#fff; */
  background: var(--new-BG);
  display: flex;
  justify-content: space-between;
  padding: 1rem 1.5rem;
  box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2);
  position: fixed;
  left: 250px;
  width: calc(100% - 250px);
  top: 0;
  z-index: 100;
  transition: left 300ms;
}

#nav-toggle {
  display: none;
}

/* ====GLASSMORPHISM CHANGE HERE!==== */
header h2 {
  color: #fff;
  text-transform: uppercase;
}

header label span {
  font-size: 1.7rem;
  padding-left: 1rem;
}

.search-wrapper {
  border: 1px solid #ccc;
  border-radius: 30px;
  height: 50px;
  display: flex;
  align-items: center;
  overflow-x: hidden;
}

.search-wrapper:focus,
.search-wrapper:hover {
  border: 1px solid var(--icon-color);
}

.search-wrapper input {
  height: 100%;
  padding: 0.5rem;
  border: none;
  background: transparent;
}

input {
  color: #fff;
  font-size: 15px;
}

.search-wrapper span {
  display: inline-block;
  padding: 0rem 1rem;
  font-size: 1.5rem;
  color: var(--new-content);
}

.user-wrapper {
  display: flex;
  align-items: center;
  padding: 0 10px;
}
.light .user-wrapper {
  border-left: 4px solid #ea0565;
}

.user-wrapper img {
  border-radius: 50%;
  margin-right: 1rem;
}

.user-wrapper div h4 {
  color: #fff;
}

.user-wrapper small {
  display: inline-block;
  color: #e0e0e0;
}

body.light h4 {
  background: var(--orange);
  -webkit-text-fill-color: transparent;
  text-fill-color: transparent;
  -webkit-background-clip: text;
  background-clip: text;
}

/* ====GLASSMORPHISM CHANGE HERE!==== */
main {
  padding: 1rem 1.5rem;

  min-height: calc(100vh - 90px);
}

/* ====GLASSMORPHISM CHANGE HERE!==== */
.heading {
  color: #fff;
}

body.light .heading {
  filter: brightness(140%);
  background: var(--pink);
  -webkit-text-fill-color: transparent;
  text-fill-color: transparent;
  -webkit-background-clip: text;
  background-clip: text;
}

.cards {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  grid-gap: 1.2rem;
  margin-top: 1rem;
  padding: 10px;
  overflow: hidden;
  height: auto;
}

.card-single {
  display: flex;
  justify-content: space-between;
  background: rgba(0, 0, 0, 0.2);
  backdrop-filter: blur(16px);
  padding: 1.2rem;
  border-radius: 5px;
  box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
  overflow: hidden;
  filter: brightness(120%);
  transition: all 400ms;
}
.cards .card-single {
  height: 150px;
}
.card-single:hover {
  transform: scale(1.04);
  border-radius: 25px;
}

.card-single div:last-child span {
  font-size: 3rem;
  background: var(--pink);
  -webkit-text-fill-color: transparent;
  text-fill-color: transparent;
  -webkit-background-clip: text;
  background-clip: text;
}

.card-single div:first-child span {
  text-transform: uppercase;
  color: #fff;
}

.card-single:hover,
.card:hover,
.light .card {
  background: rgba(0, 0, 0, 0.564);
}

.light .card:hover {
  background: rgba(0, 0, 0, 0.713);
}

.card-single:hover h1,
.card-single:hover div:last-child span {
  filter: brightness(140%);
}

.card-single:hover h1,
.card-single:hover div:last-child span {
  filter: brightness(140%);
}

.recent-grid {
  margin-top: 3.5rem;
  display: grid;
  grid-gap: 2rem;
  grid-template-columns: 65% auto;
}

.card {
  /* 	background:#fff; */
  background: rgba(0, 0, 0, 0.2);
  backdrop-filter: blur(16px);
  border-radius: 10px;
}

/* =========COUNTER=========== */
sup,
b {
  background: var(--moon);
  -webkit-text-fill-color: transparent;
  text-fill-color: transparent;
  -webkit-background-clip: text;
  background-clip: text;
}

@property --num {
  syntax: "<integer>";
  initial-value: 0;
  inherits: false;
}

#customer,
#project,
#order,
#income {
  counter-reset: num var(--num);
}

#customer {
  animation: customer 5s forwards ease-in;
}

#project {
  animation: project 10s forwards ease-in-out;
}

#order {
  animation: order 12s forwards ease-in-out;
}

#income {
  display: inline;
  animation: income 15s forwards ease-in;
}

#income::before,
#customer::before,
#project::before,
#order::before {
  content: counter(num);
  background: var(--moon);
  -webkit-text-fill-color: transparent;
  -webkit-background-clip: text;
  background-clip: text;
}

.card-single:hover #income,
.card-single:hover #customer,
.card-single:hover #project,
.card-single:hover #order {
  animation-play-state: paused;
}

@keyframes income {
  from {
    --num: 0;
  }

  to {
    --num: 600;
  }
}

@keyframes customer {
  from {
    --num: 0;
  }

  to {
    --num: 1334;
  }
}

@keyframes project {
  from {
    --num: 0;
  }

  to {
    --num: 6969;
  }
}

@keyframes order {
  from {
    --num: 0;
  }

  to {
    --num: 5124;
  }
}

/* =========COUNTER=========== */

.card-header,
.card-body {
  padding: 1rem;
}

.card-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  border-bottom: 1px solid var(--dark-text);
  text-transform: uppercase;
  transition: var(--transition) !important;
}

.card-header .heading {
  color: var(--off-white);
}

.card-header button {
  background: var(--main-color);
  border-radius: 10px;
  color: var(--off-white);
  font-size: 0.8rem;
  padding: 0.5rem 1rem;
  border: 1px solid var(--main-color);
}

.card-header button:hover {
  background: transparent;
  color: var(--off-white);
  border: 1px solid #fff;
}

.card-header button:hover span {
  transform: translatex(5px);
}

.card-header button span {
  transform: translatey(2px);
}

table {
  border-collapse: collapse;
}

thead tr {
  border-top: 1px solid var(--new-content);
  border-bottom: 1px solid var(--new-content);
}

thead td {
  font-weight: 700;
  text-transform: uppercase;
  letter-spacing: 1.2px;
}

td {
  padding: 0.5rem 1rem;
  font-size: 1rem;
  color: var(--off-white);
}

td .status {
  display: inline-block;
  height: 20px;
  width: 20px;
  border-radius: 50%;
  margin-right: 1rem;
}

tr td:last-child {
  display: flex;
  align-items: center;
}

.status.purple {
  background: var(--purple);
}

.status.pink {
  background: var(--pink);
}

.status.orange {
  background: var(--orange);
}

.table-responsive {
  width: 100%;
  overflow-x: auto;
}

.customer {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 0.5rem 0.7rem;
}

.info {
  display: flex;
  align-items: center;
}

.info img {
  border-radius: 50%;
  margin-right: 1rem;
}

.info h4 {
  font-size: 1rem;
  font-weight: 700;
  color: #fff;
  letter-spacing: 1px;
}

.info small {
  font-weight: 600;
  color: var(--text-grey);
}

.contact span {
  font-size: 1.2rem;
  display: inline-block;
  margin-left: 0.5rem;
  background: var(--pink);
  -webkit-text-fill-color: transparent;
  text-fill-color: transparent;
  -webkit-background-clip: text;
  background-clip: text;
}
@keyframes anime {
  0% {
    background-position: 0% 50%;
  }

  50% {
    background-position: 100% 50%;
  }

  100% {
    background-position: 0% 50%;
  }
}
@media only screen and (max-width: 1200px) {
  .sidebar {
    width: 70px;
  }

  .sidebar {
    width: 70px;
  }

  .sidebar .sidebar-brand,
  .sidebar li {
    padding-left: 1rem;
    text-align: center;
  }
  .sidebar li a {
    margin-bottom: 2rem !important;
  }

  .sidebar li a {
    padding-left: 0rem;
  }

  .light .sidebar li a span {
    font-size: 2rem;
    background: var(--pink);
    -webkit-text-fill-color: transparent;
    text-fill-color: transparent;
    -webkit-background-clip: text;
    background-clip: text;
  }

  .light .sidebar:hover li a span {
    font-size: 1.5rem;
    filter: brightness(140%);
    background: var(--orange);
    -webkit-text-fill-color: transparent;
    -webkit-background-clip: text;
    background-clip: text;
  }

  .sidebar .sidebar-brand h2 span:last-child,
  .sidebar li a span:last-child {
    display: none;
  }

  .main-content {
    margin-left: 70px;
  }

  .main-content header {
    width: calc(100% - 70px);
    left: 70px;
  }

  .sidebar {
    width: 70px;
  }

  .sidebar:hover {
    width: 345px;
    z-index: 200;
    background: rgba(0, 0, 0, 0.2);
    backdrop-filter: blur(6px);
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.4);
  }

  .sidebar:hover .sidebar-brand,
  .sidebar:hover li {
    padding-left: 2rem;
    text-align: left;
  }

  .sidebar:hover li a {
    padding-left: 1rem;
    text-transform: uppercase;
    font-weight: 500;
  }

  .sidebar:hover .sidebar-brand h2 span:last-child,
  .sidebar:hover li a span:last-child {
    display: inline;
  }

  .sidebar:hover .sidebar-brand h2 span:first-child {
    transform: translatey(5px);
  }
}

@media only screen and (max-width: 1050px) {
  .cards {
    grid-template-columns: repeat(2, 1fr);
  }

  .recent-grid {
    grid-template-columns: 1fr;
  }

  .dis-wrap,
  .dis-warn {
    top: 5.3rem;
    left: 50%;
  }

  .display {
    font: 600 1.5rem rajdhani;
  }
}

@media only screen and (max-width: 768px) {
  .cards {
    grid-template-columns: 1fr;
  }

  .cards .card-single {
    height: 150px;
  }

  .recent-grid {
    grid-template-columns: 100%;
  }

  .search {
    display: none;
  }

  .sidebar {
    left: -100% !important;
    margin-top: 4.5em;
    height: 95.7%;
    transition: all 400ms;
  }

  header h2 {
    display: flex;
    align-items: center;
    justify-content: flex-start;
    margin-left: 2rem;
  }

  header label {
    border: 1px solid var(--off-white);
    display: flex;
    padding-right: 0rem;
    margin-right: 1rem;
    height: 40px;
    width: 40px;
    border-radius: 50%;
    color: #fff;
    align-items: center;
    justify-content: center !important;
    position: fixed;
    left: 10px;
  }

  .light header label {
    color: #f00170;
    border: 1px solid #00ffff;
  }

  header label span {
    text-align: center;
    padding: 0rem;
  }

  header label:checked span::before {
    display: none;
  }

  .main-content {
    width: 100%;
    margin-left: 0;
  }

  header {
    width: 100% !important;
    left: 0 !important;
  }

  #nav-toggle:checked + .sidebar {
    left: 0 !important;
    z-index: 100;
    width: 50%;
    transition: var(--transition);
  }

  #nav-toggle:checked + .sidebar .sidebar-brand,
  #nav-toggle:checked + .sidebar li {
    padding-left: 2rem;
    text-align: left;
    transition: var(--transition);
  }

  #nav-toggle:checked + .sidebar li a {
    padding-left: 1rem;
  }

  #nav-toggle:checked + .sidebar .sidebar-brand h2 span:last-child,
  #nav-toggle:checked + .sidebar li a span:last-child {
    display: inline;
  }

  #nav-toggle:checked ~ .main-content {
    margin-left: 0 !important;
  }

  header {
    margin-bottom: 0;
  }
}

@media only screen and (min-width: 768px) {
  header label {
    display: none !important;
  }
}

p #Layer_1 {
  height: 40px;
  width: 40px;
  transform: translateY(10px);
  padding: 0;
  animation: scaled 1s linear infinite;
}
@keyframes scaled {
  50% {
    transform: scale(1.1);
  }
}

footer {
  display: flex;
  width: 100%;
  align-content: flex-end;
  color: #fff;
  margin-bottom: 1rem;
}

footer p {
  padding: 0;
  margin: 0;
  width: 100%;
  font-size: 1.5rem;
  text-align: center;
  overflow: hidden;
}
footer p span {
  border-left: 3px solid #fff;
  padding-left: 9px;
}

body.light footer p {
  background: linear-gradient(196deg, #0ff, #ff004c);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  font: 600 2rem teko;
  text-transform: uppercase;
}

@media only screen and (max-width: 560px) {
  main {
    padding-left: 10px;
    padding-right: 10px;
    margin-top: 64px;
  }

  .recent-grid {
    padding: 0;
  }

  header {
    padding: 10px 15px;
  }

  #nav-toggle:checked + .sidebar {
    left: 0 !important;
    width: 300px;
    z-index: 200;
    background: var(--main-color);
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.4);
  }

  .sidebar-menu a:active {
    background: #fff;
    color: var(--icon-color);
    padding-top: 1rem;
    padding-bottom: 1rem;
    border-radius: 30px 0 0 30px;
  }

  body.light .switch {
    top: 80px;
  }
}

::-webkit-scrollbar {
  width: 5px;
}

::-webkit-scrollbar-thumb {
  background: var(--main-color);
  border-radius: 10px;
}

body.light::-webkit-scrollbar {
  background-color: var(--dark-BG);
  width: 8px;
}

body.light::-webkit-scrollbar-thumb {
  background: #13001a;
  border-radius: 10px;
}
</style>
