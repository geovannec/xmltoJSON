require 'rubygems'
require 'open-uri'
require 'date'
require 'net/http'
require 'json'
require 'byebug'
require 'time'
require 'crack'


dateAndHour = (DateTime.now).strftime "%Y-%m-%d %H:%M"

def getXML url,firstRoot,secondRoot,dateAndHour	
	xml = (reader(url,"#{firstRoot}/#{secondRoot}")).to_s
	node = Crack::XML.parse(xml).to_json
	object = (JSON.parse(node))
	object['date'] = dateAndHour
	byebug
	return objeto[secondRoot][secondRoot]
end

def mongoConnector
	client = Mongo::Client.new([ '127.0.0.1:27017' ], :database => 'dbname')
	db = client.database
	return db
end

def insertMany doc,col,connection
	collection = connection[col]
	result = collection.insert_many(doc)
	puts result.inserted_count
end
