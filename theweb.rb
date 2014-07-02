require 'rubygems'
require 'bundler/setup'
require 'sinatra'
enable :sessions

# Set port for compatability with nitrous.io
configure :development do
  set :bind, '0.0.0.0'
  set :port, 3000
end


get '/' do
	  erb  :dashboard 
end 

post '/number' do
	@number_of_randoms = session[:number_of_randoms] || 0
	@number_of_randoms += 1
	session[:number_of_randoms] = @number_of_randoms
	number_as_string = params.fetch('number').to_i
	@the_number = rand(number_as_string)
	erb :number
end

get '/about' do 
		erb :about
end
