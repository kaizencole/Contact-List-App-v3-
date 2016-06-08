# require 'active_record'
# require_relative 'contact'
require_relative 'db'
# require 'csv'
# require 'pg'
# require 'pry'


# DB = PG.connect({
#   host: 'localhost',
#   dbname: 'contactlist',
#   user: 'development',
#   password: 'development'
# })

# # Interfaces between a user and their contact list. Reads from and writes to standard I/O.
class ContactList < ActiveRecord::Base
  attr_accessor :name, :phone, :email
  attr_reader :id

  def initialize
    @id = id
    @name = name
    @phone = phone
    @email = phone
  end

  # def self.all
  #   db.exec('SELECT * FROM contacts;').each do |row|
  #       puts row
  #   end
  # end

    # def self.saved?
    #   !!@id
    # end

  # def self.save(name, email)
  #   # return false if saved?
  #   result = db.exec(
  #     "INSERT INTO contact (name, email)" +
  #     "VALUES ($1, $2)"
  #   )
  # end

  # def self.create(name, email)
  #   new_contact = db.exec_params("INSERT INTO contacts(name, email) VALUES ($1, $2)", [name, email])
  #     # return new_contact if new_contact.save
  # end
  #
  # def self.find(id)
  #   search_result = db.exec_params('SELECT * FROM contacts WHERE id=$1;', [id]).map do |row|
  #     puts row['name'], row['email']
  #   end
  # end
  #
  # def self.find_by_name(name)
  #   db.exec_params('SELECT * FROM contacts WHERE name ILIKE $1;', ["%#{name}%"]).map do |row|
  #     puts row['name'], row['email']
  #   end
  # end
  #
  # def self.update(update_name, update_email)
  #   db.exec_params('SELECT * FROM contacts WHERE update_name ILIKE $1;', ["%#{update_name}%"]).each do |row|
  #     INSERT INTO contacts (row['name'], row['email']) VALUES (update_name AND update_email)
  #   end
  # end

  # def display_contact(row)
  #   Contact.new(name=row['name'], email=row['email'])
  # end

  # def instance_from_row(row)
  #   Contact.new()
  # end

end

  # def saved?
  #   !!@id
  # end

  # def save
  #   # return false if saved?
  #   result = DB.exec_params(
  #     "INSERT INTO contact (name, phone, email) " +
  #     "VALUES ($1, $2, $3) RETURNING id",
  #     [@name, @phone, @email]
  #   )
  #   @id = result.first['id'].to_i
  # end

  # def create(data)
  #   new_contact = Contact.new(data)
  #     return new_contact if new_contact.save
  # end

  # def find(id)
  #   result = DB.exec_params('SELECT * FROM contact WHERE id=$1::int;', [id]).map do |row|
  #     instance_from_row(row)
  #   end
  #   result.first
  # end

  # def find_by_name(name)
  #     DB.exec_params('SELECT * FROM contact WHERE name ILIKE $1;', ["%#{name}%"]).map do |row|
  #       instance_from_row(row)
  #     end
  #   end

  # def update
  #   return true if saved?
  #   result = DB.exec_params(
  #     "INSERT INTO contact (name, phone, email) " +
  #     "VALUES ($1, $2, $3) RETURNING id",
  #     [@name, @phone, @email]
  #   )
  #   @id = result.first['id'].to_i
  # end

  # def destroy
  #   return false unless saved?
  #   DB.exec_params("DELETE FROM countries WHERE id=$1::int;", [@id])
  # end
# end

#   # TODO: Implement user interaction. This should be the only file where you use `puts` and `gets`.
 # def available_commands

  puts
  puts "============== CONTACT LIST APP =============="
  puts
  puts "Here is a list of available commands:"
  puts
  puts "   new - Create a new contact"
  puts "   list - List all contacts"
  puts "   show - Show a contact"
  puts "   search - Search contacts"
  puts "   update - Update contact"
  puts "   delete - Delete contact"
  puts
  puts "=============================================="
  puts

  @command = gets.chomp

  puts "=============================================="

 if @command == 'list'
  Contact.all.each do |contact|
    puts contact.name + " " + contact.email
  end
 end

if @command == 'new'
  puts "Name?"
  name = gets.chomp
  puts "Email?"
  email = gets.chomp
  Contact.create(name: name, email: email)
end

if @command == 'show'
  puts "ID?"
  id = gets.chomp.to_i
  c = Contact.find(id.to_i)
  puts "#{c.name}, #{c.email}, #{c.id}"
end

if @command == 'search'
  puts "Name?"
  name = gets.chomp
  c = Contact.find_by_name(name)
  puts "#{c.name}, #{c.email}, #{c.id}"
end

if @command == 'update'
  puts "Which contact?"
  search_name = gets.chomp

  c = Contact.find_by_name(search_name)

  puts "What's the new email?"
  update_email = gets.chomp
  c.email = update_email
  c.save

  puts "#{c.name}, #{c.email}, #{c.id}"
end

if @command == 'delete'
  puts "Which contact?"
  search_name = gets.chomp

  c = Contact.find_by_name(search_name)
  c.destroy

  puts "#{search_name}'s information has been deleted."
end
