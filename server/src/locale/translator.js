// const { translate } = require("free-translate");

const translate = require("google-translate-api");

const translateString = async (stringToTranslate) => {
  //   try {
  //     const translatedText = await translate(stringToTranslate, {
  //       from: "en",
  //       to: "am",
  //     });

  //     return translatedText;
  //   } catch (e) {
  //     return null;
  //   }

  translate(stringToTranslate, { to: "am" })
    .then((res) => {
      console.log(res.text);
    })
    .catch((err) => {
      console.error(err);
    });
};

module.exports = { translateString };
