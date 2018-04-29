goog = read.csv(file = "HistoricalQuotes (1).csv", head = TRUE, sep = ",")

```

```{r}
#The function ts is used to create time-series objects.
myTs <- ts(goog$Close, start = c(2007, 11), end = c(2017, 10), frequency = 12)
myTs

```

```{r}

plot(myTs, col='red')

```
3.2 Use the ses function from the forecast package to get a forecast based
on simple exponential smoothing for the next 12 months, and plot the
forecast.
```{r}
library(forecast)
```
```{r}
mySes <- ses(myTs, alpha = 0.5)
plot(mySes, col = "red")
```
3.3 Estimate an exponential smoothing model using the ets function with
default parameters. Then pass the model as input to the forecast function
to get a forecast for the next 12 months, and plot the forecast (both
                                                                 functions are from the forecast package).

```{r}
myEts <- ets(myTs)
myEts
```

```{r}
f<-forecast(myEts, h=12, fan =TRUE)
a<-plot(f, col='red')
```


3.4 Print a summary of the model estimated in the previous exercise, and
find the automatically estimated structure of the model. Does it include
trend and seasonal components? If those components are present are they
additive or multiplicative?
  
  ```{r}
summary(a)
```
```{r}
decompose(myTs)
```
Additive components present

3.5 Find a function in the forecast package that estimates the BATS model
(exponential smoothing state space model with Box-Cox transformation,
  ARMA errors, trend and seasonal components). Use it to estimate the
model with a dumped trend, and make a forecast. Plot the forecast.

```{r}
myBats<-bats(myTs)
myBats
```
```{r}
plot(myBats)
```

```{r}
f1<-forecast(myBats, h=12, fan=TRUE)
plot(f1,col='red')
```