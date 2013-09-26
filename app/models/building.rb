class Building < ActiveRecord::Base
  validates_presence_of :street_address
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :postal_code

  validates :state, inclusion:{ in: %w(
    Alabama Alaska Arizona Arkansas California Colorado Connecticut Delaware DC Florida Georgia
    Hawaii Idaho Illinois Indiana Iowa Kansas Kentucky Louisiana Maine Maryland Massachusetts Michigan
    Minnesota Mississippi Missouri Montana Nebraska Nevada New Hampshire New Jersey New Mexico New York North Carolina
    North Dakota Ohio Oklahoma Oregon Pennsylvania Rhode Island South Carolina South Dakota Tennessee Texas Utah
    Vermont Virginia Washington West Virginia Wisconsin Wyoming ),
    message: "%{value} is not a valid state"
  }

  validates_numericality_of :postal_code

end
