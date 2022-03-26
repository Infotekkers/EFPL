<template>
  <div class="admin-login">
    <h1>this is admin login page</h1>
    <form>
      <label>Email:</label>
      <input type="email" required v-model="email" />
      <label>Password:</label>
      <input type="password" required v-model="password" />
      <div class="submit"><button>Login</button></div>
    </form>
  </div>
</template>

<style>
.admin-login {
  max-width: 500px;
  margin: 30px auto;
}
form {
  width: 100%;
  background: white;
  text-align: left;
  padding: 40px;
  border-radius: 10px;
}
label {
  color: #aaa;
  display: inline-block;
  margin: 25px 0 15px;
  font-size: 0.6rem;
  font-weight: bold;
  text-transform: uppercase;
}
button {
  background: rgb(43, 31, 156);
  color: white;
  border: 0;
  padding: 10px 20px;
  margin-top: 20px;
  border-radius: 20px;
  cursor: pointer;
}
.submit {
  text-align: center;
}
</style>
