require 'rspec'
require 'sqlite3'

require_relative "../db.rb"
include Todo

describe DB do
  describe 'setting up environment' do
    DB.create_database('test').should be_an_instance_of SQLite3::Database
  end
  
end
