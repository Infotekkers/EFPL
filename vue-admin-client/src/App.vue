<template>
  <div class="wrapper">
    <aside>
      <button class="collapse-sidebar">
        <span>&#11164;</span>
      </button>
      <div class="sidebar-wrapper">
        <div class="sidebar__link">
          <router-link to="/">Home</router-link>
        </div>
        <div class="sidebar__link">
          <router-link to="/about">About</router-link>
        </div>
      </div>
    </aside>

    <main>
      <!-- eslint-disable-next-line -->
      <router-view />
    </main>
  </div>
</template>

<script>
export default {
  data() {
    return {
      sidebar: 1,
    };
  },
  methods: {
    toggleSidebar(e) {
      const sidebar = document.querySelector(".sidebar-wrapper");

      if (this.sidebar) {
        sidebar.style.display = "none";
        e.target.innerHTML = "&#11166;";
        this.sidebar = 0;
      } else {
        sidebar.style.display = "flex";
        e.target.innerHTML = "&#11164;";
        this.sidebar = 1;
      }
    },
  },
  mounted() {
    const toggle = document.querySelector(".collapse-sidebar");
    toggle.addEventListener("click", this.toggleSidebar);
  },
};
</script>

<style>
@import "./assets/design-system.css";

#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

nav {
  padding: 30px;
}

nav a {
  font-weight: bold;
  color: #2c3e50;
}

nav a.router-link-exact-active {
  color: #42b983;
}
</style>

<style lang="scss">
.wrapper {
  height: 100vh;
  display: flex;

  .collapse-sidebar {
    padding: var(--spacing-3xsmall) var(--spacing-xsmall);
    font-size: var(--text-base);
    border: none;

    background: var(--neutral-400);

    position: absolute;
    top: 0;
    left: 100%;
  }

  aside {
    position: relative;
    background: var(--neutral-50);
    box-shadow: 1px 0 4px 0 var(--neutral-200);

    .sidebar-wrapper {
      padding: 0 var(--spacing-regular);
      width: 250px;
      height: 100%;

      display: flex;
      flex-direction: column;
      justify-content: center;
    }

    .sidebar__link {
      display: flex;
      align-items: center;
      margin-bottom: var(--spacing-xsmall);

      &:before {
        content: "";
        width: 30px;
        height: 30px;

        background: var(--neutral-400);
        border-radius: 50%;
        display: block;
      }

      a {
        padding: var(--spacing-small);
        text-decoration: none;

        font-size: var(--text-regular);
        font-weight: 500;
        color: var(--neutral-900);
      }
    }

    .sidebar__link.active {
    }
  }

  main {
    background: var(--neutral-100);
    flex-grow: 1;
  }
}
</style>
