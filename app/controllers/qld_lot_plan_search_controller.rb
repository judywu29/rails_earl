class QldLotPlanSearchController < ApplicationController

  def lot_plan_search_new

  end

  def lot_plan_search
    plan_number = history_params[:plan_number]
    # if lot_plan_number.include?("/")
      #doing the search
      parser = QldLotPlanSearch.cif_parser(plan_number)
      @plan_detail = parser.plan_detail
      @parcels = parser.parcels.select { |parcel| parcel[:parcel_type] == 'parcel' }

      @observation_group = parser.observation_group
      @monuments = parser.monuments
    # else
    #   flash[:notice] = "Not Valid lot plan number."
    #   render action: 'lot_plan_search_new'
    #
    # end
  end

  private
  def history_params
    params.require(:qld_lot_plan_search).permit(:plan_number)
  end
end
