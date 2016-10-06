require 'sinatra'
require 'active_record'
require_relative 'environment'
require_relative 'weaponenemy'

get '/api/weapons' do
  name = params['name']
  type = params['type']

  if !name.nil? && !type.nil?
    weapons = Weapon.where(name: name, type: type)
  elsif !name.nil?
    weapons = Weapon.where(name: name)
  elsif !type.nil?
    weapons = Weapon.where(type: type)
  else
    weapons = Weapon.all.order(name: :ASC)
  end

  weapons.to_json
end

post '/api/weapons' do
  Weapon.create(name: params['name'], type: params['type']).to_json
end

put '/api/enemies' do
  name = params['name']
  type = params['type']
  new_name = params['new_name']
  new_type = params['new_type']

  weapons = Weapon.find_by(name: name, type: type)
  weapons.update(name: new_name, type: new_type)

  enemies.to_json
end

delete '/api/enemies' do
  weapons = Weapon.find_by(name: params['name'], type: type = params['type'])
  weapons.destroy
end
