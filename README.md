Your goal is to make an application that resembles the following

###Features:

* The user can enter their location (lat, lng)
  * **IMPORTANT** The location entered by the user must be stored in `NSUserDefaults` so that they don't have to re-enter it the next time the app launches.

* Pull weather data from http://forecast.io. You can use **8040fc5b15adaaafabbe7de9c3ff5458** as your API key or you can get your own. Each API key can make 1000 free requests per day.

> https://api.forecast.io/forecast/APIKEY/LAT,LNG

* Parse the JSON in a way that you feel is appropriate for handling the data. There's no "right" way to do this so use your judgement.

* You need to create a custom table view cells that is visually similar to the one in the reference provided.
  * On the left is the day of the week. You can find some example code at the following gist:
  * In the middle is the icon representing the weather for that day. These icon names are provided by the API. The images themselves are already in your assets bundle.
  * On the right is the tempurature (high - low)

* When you tap on a cell, the application should navigate the user to a detail page where they can view more information about that day's weather.
