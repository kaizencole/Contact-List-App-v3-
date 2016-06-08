require 'csv'
require 'active_record'

# Represents a person in an address book.
# The ContactList class will work with Contact objects instead of interacting with the CSV file directly
class Contact < ActiveRecord::Base
end

class Phone
  belongs_to Contact
end

  # attr_accessor :name, :email

  # Creates a new contact object
  # @param name [String] The contact's name
  # @param email [String] The contact's email address
  # def initialize(name, email)
  #   # TODO: Assign parameter values to instance variables.
  #   @name = name
  #   @email = email
  # end


  # Provides functionality for managing contacts in the csv file.
  # class << self

    # @contacts_array = CSV.read('contacts.csv')
    #   @contacts_array.each do |contact|
    #     contact = Contact.new(contact[0], contact[1])
    #     # puts contacts.name
    #   end
    # end

    # Opens 'contacts.csv' and creates a Contact object for each line in the file (aka each contact).
    # @return [Array<Contact>] Array of Contact objects
    # def all
    #   # TODO: Return an Array of Contact instances made from the data in 'contacts.csv'.
    #   contacts_array = []
    #
    #   CSV.foreach('contacts.csv') do |contact|
    #      contact = Contact.new(contact[0], contact[1])
    #      contacts_array << contact
    #    end

    #   contacts_array
    #
    # end


#     # Creates a new contact, adding it to the csv file, returning the new contact.
#     # @param name [String] the new contact's name
#     # @param email [String] the contact's email
#
#     def create(name, email)
# #       # TODO: Instantiate a Contact, add its data to the 'contacts.csv' file, and return it.
#       csv_array = Contact.new(name, email)
#       CSV.open("contacts.csv", "a") do |csv|
#         csv << [name, " " + email]
#       end
#
#     end
#   # ...


#     # Find the Contact in the 'contacts.csv' file with the matching id.
#     # @param id [Integer] the contact id
# #     # @return [Contact, nil] the contact with the specified id. If no contact has the id, returns nil.
#     def find(id)
# #       # TODO: Find the Contact in the 'contacts.csv' file with the matching id.
# #       Contact.all[id.to_i - 1]
# #
# #     end
#   end
# # end

#     # Search for contacts by either name or email.
#     # @param term [String] the name fragment or email fragment to search for
#     # @return [Array<Contact>] Array of Contact objects.
#     def search(term)
#       # TODO: Select the Contact instances from the 'contacts.csv' file whose name or email attributes contain the search term.
#     end

#   end

# end
