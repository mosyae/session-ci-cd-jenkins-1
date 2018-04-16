require_relative "ruby_app"
require 'sinatra'

set :port, 5005
set :environment, :production

main_phonebook = PhoneBook.new

post '/add_contact' do
  data = JSON.parse request.body.read
  main_phonebook.add_contact(data)
  "Contact #{data} was added successfully!"
end

get '/get_contacts' do
  main_phonebook.get_pb.to_json
end

get '/health' do
  "I'm healthy!!!"
end