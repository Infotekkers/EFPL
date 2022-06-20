const mongoose = require("mongoose");
const bcrypt = require("bcryptjs");
const { isEmail, isStrongPassword } = require("validator");


const adminSchema = mongoose.Schema({
    email: {
        type: String,
    
        // Concern Here - Should Email be required?
        required: [true, "Custom Error - Required Value *:Email is required."],
        validate: [isEmail, "input valid email"],
      },
      password: {
        type: String,
        minlength: 8,
        required: true,
    
        // Concern here - is this a message
        validate: [
          isStrongPassword,
          "minimum 8 characters,1uppercase,1lowercase,symbol&number",
        ],
      },
});
adminSchema.pre("save",async function(next){
    const salt = await bcrypt.genSalt();
    this.password = await bcrypt.hash(this.password,salt);
})
module.exports = mongoose.model("Admin",adminSchema)