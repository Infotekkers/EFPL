
# Importing flask module in the project is mandatory
# An object of Flask class is our WSGI application.
import numpy as np
from joblib import dump, load
import math
from flask import Flask
from flask import request
from flask import Response
import json
from dotenv import load_dotenv
import os

ml_app = Flask(__name__)
load_dotenv()


@ml_app.route('/fdr', methods=['POST'])
def fixture_difficulty_rating():
    all_data = json.loads(request.data)['data']
    final_result = []
    for data in all_data:
        mlInfo = data['mlInfo']
        formInfo = data['form']
        homeTeamFormInfo = formInfo['homeTeam']
        awayTeamFormInfo = formInfo['awayTeam']

        homeTeamFormScore = 12
        awayTeamFormScore = 0

        # home team calc
        homeTeamFormScore = homeTeamFormScore + \
            (homeTeamFormInfo['result'][0]**0.6 * 2 +
             homeTeamFormInfo['result'][1]**0.5 * 2 +
             homeTeamFormInfo['result'][2]**0.4 * 2 +
             homeTeamFormInfo['result'][3]**0.3 * 2)

        homeTeamFormScore = homeTeamFormScore + \
            ((1.5**0.4 * homeTeamFormInfo['goalsFor'][0]) +
             (1.5**0.3 * homeTeamFormInfo['goalsFor'][1]) +
             (1.5**0.2 * homeTeamFormInfo['goalsFor'][2]) +
             (1.5**0.1 * homeTeamFormInfo['goalsFor'][3]))

        homeTeamFormScore = homeTeamFormScore - \
            ((1.2**0.4 * homeTeamFormInfo['goalsAgainst'][0]) +
             (1.2**0.3 * homeTeamFormInfo['goalsFor'][1]) +
                (1.2**0.2 * homeTeamFormInfo['goalsAgainst'][2]) +
                (1.2**0.1 * homeTeamFormInfo['goalsAgainst'][3]))

        # away team calc
        awayTeamFormScore = awayTeamFormScore + \
            (awayTeamFormInfo['result'][0]**0.6 * 2 +
             awayTeamFormInfo['result'][1]**0.5 * 2 +
             awayTeamFormInfo['result'][2]**0.4 * 2 +
             awayTeamFormInfo['result'][3]**0.3)

        awayTeamFormScore = awayTeamFormScore + \
            ((1.5**0.4 * awayTeamFormInfo['goalsFor'][0]) +
             (1.5**0.3 * awayTeamFormInfo['goalsFor'][1]) +
             (1.5**0.2 * awayTeamFormInfo['goalsFor'][2]) +
             (1.5**0.1 * awayTeamFormInfo['goalsFor'][3]))

        awayTeamFormScore = awayTeamFormScore - \
            (((1.2**0.4 * awayTeamFormInfo['goalsAgainst'][0]) +
             (1.2**0.3 * awayTeamFormInfo['goalsFor'][1]) +
             (1.2**0.2 * awayTeamFormInfo['goalsAgainst'][2]) +
             (1.2**0.1 * awayTeamFormInfo['goalsAgainst'][3])))

        def predict_home_score(data):

            # select lables to use
            score_data = np.array([data])

            # import model
            htm = clf = load('HTM.joblib')

            return(round(htm.predict(score_data)[0]))

        def predict_away_score(data):

            # select lables to use
            score_data = np.array([data])

            # import model
            htm = clf = load('ATM.joblib')

            return(round(htm.predict(score_data)[0]))

        def predict_score(data):
            return [predict_home_score(data),
                    predict_away_score(data)]

        predicted_score = predict_score(mlInfo)
        pdiff = abs(predicted_score[0] - predicted_score[1])

        if(pdiff == 0):
            if(predicted_score[0] > predicted_score[1]):
                homeTeamFormScore = homeTeamFormScore - 5
            elif (predicted_score[0] < predicted_score[1]):
                awayTeamFormScore = awayTeamFormScore - 5
        elif(1 < pdiff < 2):
            if(predicted_score[0] > predicted_score[1]):
                homeTeamFormScore = homeTeamFormScore + 5
            elif (predict_score[0] < predicted_score[1]):
                awayTeamFormScore = awayTeamFormScore + 5
        elif(3 < pdiff < 5):
            if(predicted_score[0] > predicted_score[1]):
                homeTeamFormScore = homeTeamFormScore + 10
            elif (predicted_score[0] < predicted_score[1]):
                awayTeamFormScore = awayTeamFormScore + 10

        elif(6 < pdiff < 8):
            if(predicted_score[0] > predicted_score[1]):
                homeTeamFormScore = homeTeamFormScore + 15
            elif (predicted_score[0] < predicted_score[1]):
                awayTeamFormScore = awayTeamFormScore + 15
        elif(8 < pdiff < 11):
            if(predicted_score[0] > predicted_score[1]):
                homeTeamFormScore = homeTeamFormScore + 20
            elif (predicted_score[0] < predicted_score[1]):
                awayTeamFormScore = awayTeamFormScore + 20
        elif(pdiff > 12):
            if(predicted_score[0] > predicted_score[1]):
                homeTeamFormScore = homeTeamFormScore + 30
            elif (predicted_score[0] < predicted_score[1]):
                awayTeamFormScore = awayTeamFormScore + 30

                #    elif(3 < pdiff < 5){}
                #    elif(6 < pdiff < 8){}
                #     elif(8 < pdiff < 11){}else{}
        fdr = 1
        try:
            if(homeTeamFormScore > awayTeamFormScore):
                fdr = (round((homeTeamFormScore/awayTeamFormScore)/2))
            elif(awayTeamFormScore > homeTeamFormScore):
                fdr = (round((homeTeamFormScore/awayTeamFormScore)/2))
        except:
            fdr = 1

        final_result.append(fdr)

    print(final_result)
    return {
        "fdr": final_result
    }


@ml_app.route("/initial-price/<name>", methods=['GET'])
def initial_price(name):
    with open("data/player-history-et.json", encoding='cp850') as f:
        playerIds = json.load(f)
    with open("data/player-history-x-et.json", encoding='cp850') as f:
        playerHistory = json.load(f)
    with open("model/initial-price-model.json", encoding='cp850') as f:
        model = json.load(f)

    for index in range(len(playerIds)):
        if (playerIds[index]['name'] in name or name in playerIds[index]['name']):
            print(index, name, playerIds[0])
    return Response('{"price":2}', status=260, mimetype='application/json')


if __name__ == '__main__':
    ml_app.run(port=os.getenv("PORT") or 5001, debug=True)
