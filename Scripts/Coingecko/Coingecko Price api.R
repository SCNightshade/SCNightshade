#Coingecko function script

Coin_price <- function(coin, coin2 = "", vs_coin = "USD") {
  url <-    paste0("https://api.coingecko.com/api/v3/simple/price?",
                               "ids=", coin,
                   #A if statement to make it optional to select a second coin
                   if(coin2 != "") {
                     paste0("%2C", coin2)
                   },
                               "&vs_currencies=", vs_coin)
  res <- jsonlite::fromJSON(url)
  #Res creates a list so forcing it to be a dataframe
  price <- as.data.frame(res)
  #making a dataframe depends on the amount of coins, and if not done will it just be a row
  if(coin2 != "") { 
     data.frame(Coins = c(coin, coin2),
                Price = c(price[1,1], price[1,2]))
  } else {
    data.frame(Coins = c(coin),
               Price = c(price[1,1]))
  }
}


