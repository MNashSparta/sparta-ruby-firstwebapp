class UsersController < Sinatra::Base

  $users = [{
    id:0,
    name: "John Smith",
    email: "js@yahoo.com"
    },
    {
    id:1,
    name: "Bob Smith",
    email: "bs@gmail.com"
    },
    {
    id:2,
    name: "Steve Smith",
    email: "ss@volkswagon.de"
    }]

  # sets root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__), '..')

  # sets the view directory correctly
  set :views, Proc.new { File.join(root, "views") }

  configure :development do
    register Sinatra::Reloader
  end

  # INDEX
  get "/" do
    @title = "Current Users"
    @users = $users
    erb :"users/index"
  end

  # More specific routes go first
  # NEW
  get "/new" do
    "Show: this is the new form"
  end

  # SHOW
  get "/:id" do
    id = params[:id].to_i
    @title = $users[id][:name]
    @users = $users[id]
    erb :"users/user"
  end





  # EDIT
  get "/:id/edit" do
    id = params[:id]
  end

  # CREATE
  # post "/" do
  #
  # end

  #UPDATE
  put "/:id" do
    id = params[:id]
    "SHOW: #{id} PUT"
  end

  # DESTROY
  delete "/:id" do
    id = params[:id]
    "SHOW: #{id} DELETE"
  end



end
