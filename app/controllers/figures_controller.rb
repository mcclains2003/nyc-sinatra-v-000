class FiguresController < ApplicationController

  get '/figures' do 
    @figures = Figure.all
    erb :"/figures/index"
  end

  get '/figures/new' do 
    erb :"/figures/new"
  end

  get '/figures/:id' do 
    @figure = Figure.find_by_id(params[:id])
    erb :"/figures/show"
  end

  post '/figures' do 
    @figure = Figure.create(params["figure"])
    @figure.titles << Title.create(params["title"]) if params["title"]["name"] != ""
    @figure.landmarks << Landmark.create(params["landmark"]) if params["landmark"]["name"] != ""
    @figure.save
  end

  get '/figures/:id/edit' do 
    @figure = Figure.find_by_id(params[:id])
    erb :"/figures/edit"
  end

  post '/figures/:id' do 
    @figure = Figure.find_by_id(params[:id])
    @figure.update(params["figure"])
    @figure.titles << Title.create(params["title"]) if params["title"]["name"] != ""
    @figure.landmarks << Landmark.create(params["landmark"]) if params["landmark"]["name"] != ""
    @figure.save

    redirect "/figures/#{@figure.id}"
  end

end