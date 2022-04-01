<template>
  <div>
    <router-link :to="{ name: 'settings' }">Settings</router-link> |
    <router-link :to="{ name: 'about' }">About</router-link> |

    <router-view />
  </div>
</template>
