//
const rateLimit = require("express-rate-limit");

const rateLimiterConfig = rateLimit({
  windowMs: 60 * 1000, // 15 minutes
  max: 10, // Limit each IP to 100 requests per `window` (here, per 15 minutes)
  standardHeaders: true, // Return rate limit info in the `RateLimit-*` headers
  legacyHeaders: false, // Disable the `X-RateLimit-*` headers
  message: "Maximum Request Limit Rate Reached.",
});

module.exports = rateLimiterConfig;
