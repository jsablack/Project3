require 'sinatra/base'

require './controllers/ApplicationController'
require './controllers/UserController'
require './controllers/CommentController'
require './controllers/LocationController'
require './controllers/HomeController'



require './models/UserModel'
require './models/CommentModel'
require './models/LocationModel'
require './models/HomeModel'


map('/') {run ApplicationController}
map('/users') {run UserController}
map('/comments') {run CommentController}
map('/locations') {run LocationController}
map('/home') {run HomeController}
