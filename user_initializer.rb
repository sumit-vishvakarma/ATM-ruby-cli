require 'json'
require 'pry-nav'

def user_initializer
  file_path = 'data/user_data.json'
  user_data = JSON.parse(File.read(file_path),symbolize_names: true)
  user_data
end