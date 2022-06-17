<template>
  <aside v-if="showSidebar">
    <button class="collapse-sidebar">
      <span>&#11164;</span>
    </button>
    <div class="sidebar-wrapper">
      <!-- Home -->
      <div class="sidebar__link">
        <router-link to="/admin/home">{{ $t("home") }}</router-link>
      </div>

      <!-- Fixtures -->
      <div class="sidebar__link">
        <router-link to="/admin/fixtures">{{ $t("Fixtures") }}</router-link>
      </div>

      <!-- Teams -->
      <div class="sidebar__link">
        <router-link to="/admin/teams">{{ $t("Teams") }}</router-link>
      </div>

      <!-- Players -->
      <div class="sidebar__link">
        <router-link to="/admin/players">{{ $t("Players") }}</router-link>
      </div>

      <!-- settings -->
      <div class="sidebar__link">
        <router-link to="/admin/settings">{{ $t("Settings") }}</router-link>
      </div>
    </div>
  </aside>
</template>

<script>
import store from "../store/index";

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
  computed: {
    showSidebar() {
      return store.state.Global.showSidebar;
    },
  },
};
</script>

<style lang="scss" scoped>
aside {
  position: relative;
  background: var(--neutral-50);
  box-shadow: 1px 0 4px 0 var(--neutral-200);
  .collapse-sidebar {
    padding: var(--spacing-3xsmall) var(--spacing-xsmall);
    font-size: var(--text-base);
    border: none;

    background: var(--neutral-400);

    position: absolute;
    top: 0;
    left: 100%;
  }

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
</style>
