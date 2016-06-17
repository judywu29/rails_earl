class Parcel < ActiveRecord::Base
  belongs_to :cadastra_search
  # has_many :parcel_linkages, dependent: :destroy
  # has_many :parcel_identity_linkages
  # serialize :children_plan_number

end
