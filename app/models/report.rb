class Report < ActiveRecord::Base
  validates_presence_of :route_id, :comment, :lat, :lon
  validates_numericality_of :route_id
  validates_numericality_of :lon, :less_than => 0
  validates_numericality_of :lat, :greater_than => 0
end
