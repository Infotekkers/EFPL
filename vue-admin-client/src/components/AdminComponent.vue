<template>
  <div>
    <router-link :to="{ name: 'settings' }">Settings</router-link> |
    <router-link :to="{ name: 'Fixtures' }">Fixtures</router-link> |
    <router-link :to="{ name: 'Teams' }">Teams</router-link>

    <router-view />
  </div>
</template>
