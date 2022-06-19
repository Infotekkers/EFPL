const teamData = [
  // Saint George S.C 1
  {
    teamName: "Saint George S.C",
    teamNameAmh: "ቅዱስ ጊዮርጊስ",
    foundedIn: 1935,
    teamStadium: "Addis Ababa Stadium",
    teamCity: "Addis Ababa",
    stadiumCapacity: 34000,
    teamCoach: "Zlatko Krmpotić",
    teamLogo: "/uploads/teams/St-George.png",
    teamPosition: {
      teamPoint: 0,
      won: 0,
      lost: 0,
      Draw: 0,
      goalDifferntial: 0,
      goalAgainst: 0,
      goalFor: 0,
    },
  },

  // "Welayta Dicha" 2
  {
    teamName: "Wolaita Dicha S.C",
    teamNameAmh: "ወላይታ ዲቻ",
    foundedIn: 2009,
    teamStadium: "Wolaita Sodo Stadium",
    teamCity: "Wolaita Sodo",
    stadiumCapacity: 30000,
    teamCoach: "Tsegaye Kidane-mariyam",
    teamLogo: "/uploads/teams/Wolaita-dicha.png",
    teamPosition: {
      teamPoint: 0,
      won: 0,
      lost: 0,
      Draw: 0,
      goalsFor: 0,
      goalsAgainst: 0,
      goalDifferential: 0,
    },
  },

  // "Hawassa" 3
  {
    teamName: "Hawassa Kenema S.C",
    teamNameAmh: "ሀዋሳ ከነማ",
    foundedIn: 1977,
    teamStadium: "Awassa Kenema Stadium",
    teamCity: "Hawassa",
    stadiumCapacity: 15000,
    teamCoach: "Mulugeta Mihret",
    teamLogo: "/uploads/teams/Hawassa-Ketema.jpg",
    teamPosition: {
      teamPoint: 0,
      won: 0,
      lost: 0,
      Draw: 0,
      goalsFor: 0,
      goalsAgainst: 0,
      goalDifferential: 0,
    },
  },

  // "Fasil Ketema" 4
  {
    teamName: "Fasil Kenema S.C",
    teamNameAmh: "ፋሲል ከነማ",
    foundedIn: 1968,
    teamStadium: "Fasiledes Stadium",
    teamCity: "Gondar",
    stadiumCapacity: 20000,
    teamCoach: "Seyoum Kebede",
    teamLogo: "/uploads/teams/Fasil-Kenema.png",
    teamPosition: {
      teamPoint: 0,
      won: 0,
      lost: 0,
      Draw: 0,
      goalsFor: 0,
      goalsAgainst: 0,
      goalDifferential: 0,
    },
  },

  // "Adama City" 5
  {
    teamName: "Adama City S.C",
    teamNameAmh: "አዳማ ከተማ",
    foundedIn: 1991,
    teamStadium: "Abebe Bikila Stadium",
    teamCity: "Adama",
    stadiumCapacity: 4000,
    teamCoach: "Zeray Mulu",
    teamLogo: "/uploads/teams/Adama-City.png",
    teamPosition: {
      teamPoint: 0,
      won: 0,
      lost: 0,
      Draw: 0,
      goalsFor: 0,
      goalsAgainst: 0,
      goalDifferential: 0,
    },
  },

  // "Sidama Coffee" 6
  {
    teamName: "Sidama Coffee S.C",
    teamNameAmh: "ሲዳማ ቡና",
    foundedIn: 2006,
    teamStadium: "Hawasa Metropolitan Stadium",
    teamCity: "Sidama",
    stadiumCapacity: 25000,
    teamCoach: "Gebremedin Haile",
    teamLogo: "/uploads/teams/Sidama-Coffee.jpg",
    teamPosition: {
      teamPoint: 0,
      won: 0,
      lost: 0,
      Draw: 0,
      goalsFor: 0,
      goalsAgainst: 0,
      goalDifferential: 0,
    },
  },

  // "Bahir Dar Kenema" 7
  {
    teamName: "Bahir Dar Kenema S.C",
    teamNameAmh: "ባህር ዳር ከነማ",
    foundedIn: 1973,
    teamStadium: "Bahir Dar Stadium",
    teamCity: "Bahir Dar",
    stadiumCapacity: 60000,
    teamCoach: "Fasil Tekalegn",
    teamLogo: "/uploads/teams/Bahir-Dar.png",
    teamPosition: {
      teamPoint: 0,
      won: 0,
      lost: 0,
      Draw: 0,
      goalsFor: 0,
      goalsAgainst: 0,
      goalDifferential: 0,
    },
  },

  // "Ethiopian Coffee" 8
  {
    teamName: "Ethiopian Coffee S.C",
    teamNameAmh: "ኢትዮጵያ ቡና",
    foundedIn: 1976,
    teamStadium: "Addis Ababa Stadium",
    teamCity: "Addis Ababa",
    stadiumCapacity: 35000,
    teamCoach: "Kassaye Arage",
    teamLogo: "/uploads/teams/Ethiopian-Coffee.jpg",
    teamPosition: {
      teamPoint: 0,
      won: 0,
      lost: 0,
      Draw: 0,
      goalsFor: 0,
      goalsAgainst: 0,
      goalDifferential: 0,
    },
  },

  // "Wolkite Ketema" 9
  {
    teamName: "Wolkite City F.C",
    teamNameAmh: "ወልቂጤ ከተማ",
    foundedIn: 2010,
    teamStadium: "Wolkite Stadium",
    teamCity: "Wolkite",
    stadiumCapacity: 5000,
    teamCoach: "Paulos Getachew",
    teamLogo: "/uploads/teams/Wolkite-City.png",
    teamPosition: {
      teamPoint: 0,
      won: 0,
      lost: 0,
      Draw: 0,
      goalsFor: 0,
      goalsAgainst: 0,
      goalDifferential: 0,
    },
  },

  // "Arba Minch" 10
  {
    teamName: "Arba Minch City F.C",
    teamNameAmh: "አርባምንጭ",
    foundedIn: 2000,
    teamStadium: "Arba Minch Stadium",
    teamCity: "Arba Minch",
    stadiumCapacity: 5000,
    teamCoach: "Mesay Teferi",
    teamLogo: "/uploads/teams/Arba-Minch.jpg",
    teamPosition: {
      teamPoint: 0,
      won: 0,
      lost: 0,
      Draw: 0,
      goalsFor: 0,
      goalsAgainst: 0,
      goalDifferential: 0,
    },
  },

  // "Defence Force" 11
  {
    teamName: "Defence Force S.C",
    teamNameAmh: "የመከላከያ ሰራዊት",
    foundedIn: 1938,
    teamStadium: "Addis Ababa Stadium",
    teamCity: "Addis Ababa",
    stadiumCapacity: 35000,
    teamCoach: "Yohannes Sahle",
    teamLogo: "/uploads/teams/Defense-Force.png",
    teamPosition: {
      teamPoint: 0,
      won: 0,
      lost: 0,
      Draw: 0,
      goalsFor: 0,
      goalsAgainst: 0,
      goalDifferential: 0,
    },
  },

  // "Hadiya Hossana" 12
  {
    teamName: "Hadiya Hossana F.C",
    teamNameAmh: "ሀዲያ ​​ሆሣዕና",
    foundedIn: 2006,
    teamStadium: "Abiy Hersamo Stadium",
    teamCity: "Hosaena",
    stadiumCapacity: 5000,
    teamCoach: "Ashenafi Bekele",
    teamLogo: "/uploads/teams/Hadiya-Hossana.png",
    teamPosition: {
      teamPoint: 0,
      won: 0,
      lost: 0,
      Draw: 0,
      goalsFor: 0,
      goalsAgainst: 0,
      goalDifferential: 0,
    },
  },

  // "Dire Dawa Kenema" 13
  {
    teamName: "Dire Dawa City S.C",
    teamNameAmh: "ድሬዳዋ ከተማ",
    foundedIn: 1982,
    teamStadium: "Dire Dawa Stadium",
    teamCity: "Dire Dawa",
    stadiumCapacity: 18000,
    teamCoach: "Zemariam Woldegiorgis",
    teamLogo: "/uploads/teams/Dire-Dawa.png",
    teamPosition: {
      teamPoint: 0,
      won: 0,
      lost: 0,
      Draw: 0,
      goalsFor: 0,
      goalsAgainst: 0,
      goalDifferential: 0,
    },
  },

  // "Addis Ababa City" 14
  {
    teamName: "Addis Ababa City F.C",
    teamNameAmh: "አዲስ አበባ ከተማ",
    foundedIn: 1986,
    teamStadium: "Addis Ababa Stadium",
    teamCity: "Addis Ababa",
    stadiumCapacity: 5000,
    teamCoach: "Ismail Abubeker",
    teamLogo: "/uploads/teams/Addis-Ababa.png",
    teamPosition: {
      teamPoint: 0,
      won: 0,
      lost: 0,
      Draw: 0,
      goalsFor: 0,
      goalsAgainst: 0,
      goalDifferential: 0,
    },
  },

  // "Jimma Kenema" 15
  {
    teamName: "Jimma Aba Jifar F.C",
    teamNameAmh: "ጅማ አባ ጅፋር",
    foundedIn: 1983,
    teamStadium: "Jimma Stadium",
    teamCity: "Jimma",
    stadiumCapacity: 15000,
    teamCoach: "Zemariam Damtew",
    teamLogo: "/uploads/teams/Jimma-Aba.png",
    teamPosition: {
      teamPoint: 0,
      won: 0,
      lost: 0,
      Draw: 0,
      goalsFor: 0,
      goalsAgainst: 0,
      goalDifferential: 0,
    },
  },

  // "Sebeta City" 16
  {
    teamName: "Sebeta City F.C",
    teamNameAmh: "ሰበታ ከተማ",
    foundedIn: 2005,
    teamStadium: "Sebeta Stadium",
    teamCity: "Sebeta",
    stadiumCapacity: 5000,
    teamCoach: "Abraham Mebratu",
    teamLogo: "/uploads/teams/Sebeta-City.png",
    teamPosition: {
      teamPoint: 0,
      won: 0,
      lost: 0,
      Draw: 0,
      goalsFor: 0,
      goalsAgainst: 0,
      goalDifferential: 0,
    },
  },
];

const formData = [
  [2, 2, 2, 2],
  [2, 2, 2, 1],
  [2, 1, 2, 1],
  [2, 1.5, 1, 2],
  [1, 1, 1, 2],
  [1.5, 1, 2, 1.5],
  [1.5, 1.5, 1, 1],
  [2, 1.5, 2, 1.5],
  [1, 2, 1, 2],
  [2, 1, 2, 1],
  [2, 1.5, 2, 1.5],
  [1, 1, 2, 2],
];

module.exports = { teamData, formData };
