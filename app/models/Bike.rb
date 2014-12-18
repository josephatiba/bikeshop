class Bike
  include Mongoid::Document
  field :name, type: String
  field :brand, type: String
  field :speed, type: Float
end