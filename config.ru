require "sinatra"
require "sinatra/reloader" if development?
require_relative "controllers/users_controller.rb"

run UsersController
