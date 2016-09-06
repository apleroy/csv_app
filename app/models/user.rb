class User

  attr_reader :id, :name, :username, :email, :address_line1, :address_line2,
    :address_city, :address_zip, :phone, :website

  def initialize(attributes = {})
    @id = attributes['id']
    @name = attributes['name']
    @username = attributes['username']
    @email = attributes['email']
    @address_line1 = attributes['address']['street']
    @address_line2 = attributes['address']['suite']
    @address_city = attributes['address']['city']
    @address_zip = attributes['address']['zipcode']
    @phone = attributes['phone']
    @website = attributes['website']
  end

  def address1
    self.address_line1
  end

end