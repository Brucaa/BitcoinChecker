//
//  bitcoinModel.swift
//  BitcoinChecker
//
//  Created by Milos Jovanovic on 24/04/2019.
//  Copyright © 2019 Milos Jovanovic. All rights reserved.
//

import Foundation

let baseURL = "https://apiv2.bitcoinaverage.com/indices/global/ticker/BTC"
let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
let symbolArray = ["$", "R$", "$", "¥", "€", "£", "$", "Rp", "₪", "₹", "¥", "$", "kr", "$", "zł", "lei", "₽", "kr", "$", "$", "R"]
var currencySelected = ""
var finalURL = ""
