class PlanDetail < ActiveRecord::Base
  belongs_to :cadastra_search
  # has_many :plan_lots, dependent: :destroy
  # has_one :plan_linkages, dependent: :destroy

  # serialize :children_plan_number
  serialize :existing_parcels

end
