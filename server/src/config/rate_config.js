//
const rateLimit = require("express-rate-limit");

// Allow local
const allowlist = ["::1"];

const rateLimiterConfig = rateLimit({
  windowMs: 60 * 1000, // 15 minutes
  max: 1000, // Limit each IP to 100 requests per `window` (here, per 15 minutes)
  standardHeaders: true, // Return rate limit info in the `RateLimit-*` headers
  legacyHeaders: false, // Disable the `X-RateLimit-*` headers
  message: "Maximum Request Limit Rate Reached.",
  skip: (request, response) => allowlist.includes(request.ip),
});

module.exports = rateLimiterConfig;
