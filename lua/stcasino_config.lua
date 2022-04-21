--[[
Welcome to the STCasinoSuite config file!
Firstly, thank you for using my addon. It truly means a lot to me.
Secondly, if you want to help me out financially, help yourself out too:
https://freebitco.in/?r=6080578 <== absolutely free Bitcoin, no catch <3
Thirdly, if you look through the entity code, and you see the very obvious
repetition that could be avoided by functions, I know.
But hey, what I did works, so why change it? A couple KB won't hurt.
Fourthly, if you don't want this addon to break, keep these values as
natural numbers (no negatives or decimals).
Lastly, if you find any bugs or exploits, please let me know immediately.
http://discord.gg/Tg8SUDv
]]--

STC_CONFIG = {} --LEAVE THIS LINE ALONE OR NONE OF THIS WILL WORK

STC_CONFIG.CoinFlipCost = 500 --How much should the Coin Flip game cost?
--Reward will always be 2x this

STC_CONFIG.DoubleOrNothingCost = 100 --How much should the Double or Nothing game cost?
--Reward will always be 2x, 4x, 8x, etc.

STC_CONFIG.GasCashCost = 250 --How much should the Gas Cash game cost?
--Please only make this a multiple of 50, unexpected things may happen otherwise!

--Jack's Pot machine values
STC_CONFIG.JPCost = 175 --Cost to roll once
STC_CONFIG.JPRibbon = 450 --Reward for triple ribbons
STC_CONFIG.JPCoins = 750 --Reward for triple coin stacks
STC_CONFIG.JPCashEach = 75 --Reward for each dollar sign
STC_CONFIG.JPLightning = 375 --Reward for triple lightnings
STC_CONFIG.JPMusic = 300 --Reward for triple musical notes
STC_CONFIG.JP8Ball = 1125 --Reward for triple 8-balls
STC_CONFIG.JPStar = 1500 --Reward for triple stars
STC_CONFIG.JPAdd = 175 --How much to add to the jackpot every roll

STC_CONFIG.LoanMax = 20000 --The highest amount you can take out in a loan

--Raging Rubies machine values
STC_CONFIG.RRCost = 100 --Cost to roll once
STC_CONFIG.RRHeart = 600 --Reward for triple hearts
STC_CONFIG.RRBells = 1000 --Reward for triple bells
STC_CONFIG.RRCashEach = 100 --Reward for each money wad
STC_CONFIG.RRDrive = 500 --Reward for triple hard drives
STC_CONFIG.RRClock = 400 --Reward for triple clocks
STC_CONFIG.RRCar = 1500 --Reward for triple cars
STC_CONFIG.RRColor = 4000 --Reward for triple color wheels (wild card)
STC_CONFIG.RRRuby = 2000 --Reward for triple rubies

STC_CONFIG.WildCallPrice = 100 --Cost to play Wild Call
STC_CONFIG.WildCallSingle = 1000 --Reward if you get one number right (10% chance)
STC_CONFIG.WildCallDouble = 10000 --Reward if you get both numbers right (1% chance)

STC_CONFIG.LottoTicketPrice = 100 --Price to buy one lottery ticket