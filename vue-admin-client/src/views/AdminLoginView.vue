<template>
  <div class="admin-login">
    <h1>Admin Login</h1>
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
  max-width: 420px;
  margin: 30px auto;
}
form {
  background: white;
  text-align: left;
  padding: 40px;
  border: 1px solid;
  border-radius: 10px;
}
label {
  color: rgb(26, 24, 24);
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
input {
  display: block;
  padding: 10px 6px;
  width: 100%;
  box-sizing: border-box;
  border: none;
  border-bottom: 1px solid #ddd;
  color: #555;
}
.submit {
  text-align: center;
}
</style>
