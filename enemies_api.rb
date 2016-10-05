require 'sinatra'
require_relative 'environment'
require 'active_record'
require_relative 'enemy'

get '/api/enemies' do
  name = params['name']
  species = params['species']

  if !name.nil? && !species.nil?
    enemies = Enemy.where(name: name, species: species)
  elsif !name.nil?
    enemies = Enemy.where(name: name)
  elsif !species.nil?
    enemies = Enemy.where(species: species)
  else
    enemies = Enemy.all.order(name: :ASC)
  end

  enemies.to_json
end

post '/api/enemies' do
  Enemy.create(name: params['name'], species: params['species']).to_json
end

put '/api/enemies' do
  name = params['name']
  species = params['species']
  new_name = params['new_name']
  new_species = params['new_species']

  enemies = Enemy.find_by(name: name, species: species)
  enemies.update(name: new_name, species: new_species)

  enemies.to_json
end

delete '/api/enemies' do
  enemies = Enemy.find_by(name: params['name'], species: species = params['species'])
  enemies.destroy
end
