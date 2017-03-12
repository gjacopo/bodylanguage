#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Mar 10 23:15:09 2017

@author: gjacopo
"""

from __future__ import print_function

import requests

import pandas as pd
import numpy as np#analysis:ignore
from matplotlib import pyplot as plt

try:
    from fbprophet import Prophet
except:
    raise IOError('fprophet package is required')
    
PROTOCOL        = "http"
API_LANG        = "en"
API_FMT         = "json"
API_DOMAIN      = 'ec.europa.eu/eurostat/wdds'
API_VERS        = 2.1
API_URL         = "{}://{}/rest/data/v{}/{}/{}".format(
                  PROTOCOL, API_DOMAIN, API_VERS, API_FMT, API_LANG
                  )

GEO             = "EU28"
# TIME : all

# price indexes
INDICATOR       = "prc_hicp_midx"
CODE            = "TOT_X_FUEL" #"CP00"
INDEX           = "I15"
URL             = "{}/{}?geo={}&coicop={}&unit={}".format(
                  API_URL, INDICATOR, GEO, CODE, INDEX)

# unemployment
INDICATOR       = "une_rt_m"
UNIT            = "THS_PER"
AGE             = "TOTAL"
SEX             = "T"
S_ADJ           = "SA"

URL             = "{}/{}?geo={}&unit={}&age={}&sex={}&s_adj={}".format(
                  API_URL, INDICATOR, GEO, UNIT, AGE, SEX, S_ADJ)

# tour accomodation
# http://appsso.eurostat.ec.europa.eu/nui/show.do?dataset=tour_occ_nim&lang=en
INDICATOR       = (u'tour_occ_nim', "Tour accomodation")
UNIT            = (u'NR', "Number of nights")
NACE_R2         = (u'I551', "Hotels; holiday and other short-stay accommodation...")
INDIC_TO        = (u'B006', "Nights spent, total")

URL             = "{}/{}?geo={}&unit={}&nace_r2={}&indic_to={}".format(
                  API_URL, INDICATOR[0], GEO, UNIT[0], NACE_R2[0], INDIC_TO[0])

def get_response(url):
    # request the URL
    session = requests.session()
    try:
        response = session.head(url)
        response.raise_for_status()
    except:
        raise IOError("ERROR: wrong request formulated")  
    else:
        print ("OK: status={}".format(response.status_code))
    
    # load the data
    try:    
        response = session.get(url)
    except:
        raise IOError('error retrieveing response from URL')    
    
    if API_FMT == 'json':
        resp = response.json()
    elif API_FMT == 'unicode':
        resp = response.text
       
    return resp
    

def build_dataframe(resp):
    lbl2idx = resp['dimension']['time']['category']['index']
    idx2lbl = {v:k for (k,v) in lbl2idx.items()}
    data = resp['value']
    data = {idx2lbl[int(k)]:v for (k,v) in data.items()}

    try:
        assert None # not needed, and also because it adds a day date
        from datetime import datetime
        table = {datetime.strptime(k.replace('M','-'), '%Y-%m'): v      \
                 for (k,v) in data.items()}
        # instead we will use pandas.datetime below
    except:
        table = {k.replace('M','-'):v for (k,v) in data.items()}
    
    # the input to Prophet is always a dataframe with two columns: ds and y. 
    # create data frame with columns ds (date type) and y, the time series.
    df = pd.DataFrame(list(table.items()), columns=['ds','y'])
    # df = df[df['y'].notnull()]
     
    #fig = df.sort_values('ds').plot(x='ds',y='y')
    #fig.set_title("Historical data")
    
    df.sort_values('ds', inplace=True)
    df.head(); df.tail()
    
    ds_last = df['ds'].values[-1]

    df['ds'] = pd.to_datetime(df['ds'])
    return df, ds_last
    
resp = get_response(URL)
df, ds_last = build_dataframe(resp)  

xlabel = "Time"
ylabel = "{} : {} - {}".format(INDICATOR[0], INDIC_TO[1], GEO)  
fig = plt.figure(facecolor='w', figsize=(10, 6))
ax = fig.add_subplot(111)
ax.plot(df['ds'], df['y'], 'k.')
ax.plot(df['ds'], df['y'], ls='-', c='#0072B2')
ax.grid(True, which='major', c='gray', ls='-', lw=1, alpha=0.2)
ax.set_xlabel(xlabel, fontsize=14); ax.set_ylabel(ylabel, fontsize=14)
fig.suptitle("Historical data (last: {})".format(ds_last), fontsize=16)
fig.tight_layout()

#From the source [webpage](https://research.fb.com/prophet-forecasting-at-scale/):

#At its core, the Prophet procedure is an additive regression model with four main components:

#A piecewise linear or logistic growth curve trend. Prophet automatically detects changes in trends by selecting changepoints from the data.
#A yearly seasonal component modeled using Fourier series.
#A weekly seasonal component using dummy variables.
#A user-provided list of important holidays.


# Stan http://mc-stan.org
NYEARS=5

def predict_prophet(df, nyears):
    # we fit the model by instantiated a new Prophet object.
    m = Prophet(growth = "linear", yearly_seasonality=True, weekly_seasonality=False)
    # we call its fit method and pass in the historical dataframe. 
    # fit a non-linear additive model
    m.fit(df)
    
    # we extend into the future a specified number of days using the helper method Prophet.make_future_dataframe
    future = m.make_future_dataframe(periods=12*nyears, freq='M')
    fcst = m.predict(future)
    # fcst[['ds', 'yhat', 'yhat_lower', 'yhat_upper']].tail()
    return m, fcst
    
    
m, fcst = predict_prophet(df, NYEARS)

fig = m.plot(fcst, uncertainty=True) 
plt.axvline(pd.to_datetime(ds_last), color='r', linestyle='--', lw=2)
plt.xlabel(xlabel, fontsize=14); plt.ylabel(ylabel, fontsize=14)
fig.suptitle("Forecast data ({} years)".format(NYEARS), fontsize=16)
#plt.xlabel('xlabel')
#plt.ylabel('ylabel')
fig.savefig('tour_occ_nim_predict.png')
    
fig = m.plot_components(fcst, uncertainty=True);
fig.suptitle("Forecast components", fontsize=16)

if __name__ == "__main__":
