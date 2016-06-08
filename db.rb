require 'pg'
require 'pry'
require 'active_record'
# require_relative 'contact_list'
require_relative 'contact'

ActiveRecord::Base.logger = Logger.new(STDOUT)

puts 'Establishing connection to database ...'
ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  database: 'contactlist',
  username: 'development',
  password: 'development',
  host: 'localhost',
  port: 5432,
  pool: 5,
  encoding: 'unicode',
  min_messages: 'error'
)
puts 'CONNECTED'

puts 'Setting up Database (recreating tables) ...'


# ActiveRecord::Schema.define do
#   drop_table :contacts if ActiveRecord::Base.connection.table_exists?(:contacts)
#   create_table :contacts do |c|
#     t.column :name, :string
#     t.column :email, :string
#   end
#   puts 'Setup DONE'
#
#
#   # create_table :employees do |table|
#   #   table.references :store
#   #   table.column :first_name, :string
#   #   table.column :last_name, :string
#   #   table.column :hourly_rate, :integer
#   #   table.timestamps null: false
#   # end


# end

# def db
#   PG.connect(
#   host: 'localhost',
#   dbname: 'contactlist',
#   user: 'development',
#   password: 'development'
# )
# end
