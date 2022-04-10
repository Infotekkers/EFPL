import axios from "axios";

const axiosInstance = axios.create({});

axiosInstance.interceptors.request.use((config) => {
  let params = new URLSearchParams();

  params.append("auth", "token");
  config.params = params;
  return config;
});

export default axiosInstance;
