class Api::V1::ProjectsController < ApplicationController  
  #devuelve todos los matches
  def index_all
    #hay que añadir paginación para que no devuelva todos los proyectos
    matches = Match.all
    render json: matches
  end

  #devuelve los matches en los que participa el current_user
  def index_participating
    matches = current_user.matches
    render json: matches
  end


end