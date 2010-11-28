class Station < ActiveRecord::Base
  belongs_to :client 
  has_and_belongs_to_many :geo_queries
end
