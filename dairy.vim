if !has('python')
  echo "Error: Required vim compiled with +python"
	finish
endif

function! DairyTitle()

python << EOF

import vim
from datetime import datetime
from json import load
from urllib2 import urlopen

city_name = "beijing" #this is the default city for me
no_weather = False

#check if city is customized
if !exists("g:weather_city_name")
	let city_name = vim.eval("g:weather_city_name")

#do not add weather information
if !exists("g:no_weather")
	let no_weather = True

try:
	#get the current date
	insert_line = ""
	now = datetime.now()
	insert_line += "Date: " + now.ctime()+ "\t\t "
	
	#get the current weather information
	if not no_weather:
		weather = urlopen('http://openweathermap.org/data/2.1/find/name?q=' + city_name) 
		cities = load(weather)
		if cities['count'] != 0:
			city = cities['list'][0]
			#put these fields to be configurable
			insert_line += "Temp: " + str(city['main']['temp'] - 273.15) + " "
			insert_line += "Hum: " + str(city['main']['humidity']) + " "
			insert_line += "Wind: " + str(city['wind']['speed']) + " "

	cursor_index = vim.current.window.cursor[0] - 1 #get the line number in the current window
	current_buffer = vim.current.buffer 
	if current_buffer[cursor_index] == "": #how about a line with spaces or tabs
		current_buffer[cursor_index] = insert_line 
	else:
		current_buffer[cursor_index:cursor_index] = [insert_line]


except Exception, e:
	print e

EOF

endfunction
