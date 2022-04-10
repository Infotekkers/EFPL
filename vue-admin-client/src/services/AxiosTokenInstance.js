import axios from "axios";

const axiosInstance = axios.create({});

axiosInstance.interceptors.request.use((config) => {
  let params = new URLSearchParams();

  const admin = JSON.parse(window.localStorage.getItem("currentAdmin"));
  console.log(admin);

  params.append("token", admin.token);
  config.params = params;
  return config;
});

export default axiosInstance;
