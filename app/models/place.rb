class Place < ApplicationRecord
  has_many :users, through: :trips

=begin
  def country_name=(name)
    self.country = Country.find_or_create_by(name: name)
  end

  def country_name
    self.country ? self.country.name : nil
  end
=end

end