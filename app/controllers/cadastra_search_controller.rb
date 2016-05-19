
require 'csv'

class CadastraSearchController < ApplicationController

  def cadastra_search_new

  end
  def cadastra_search
    lot_plan_list = cadastra_params[:lot_plan_list]
    lot_plan_arr = lot_plan_list.split(",")
    unless lot_plan_arr.empty?
      #doing the search
      @cadastra_data_search = CadastraSearch.create!
      @cadastra_data_search.cadastra_data_search(lot_plan_arr.map(&:chomp).map(&:strip))
      redirect_to controller:'cadastra_search', action: 'show', id: @cadastra_data_search.id

    else
      flash[:notice] = "Not Valid lot plan number."
      render action: 'cadastra_search_new'
    end
  end

  def show
    cadastra_data_search = CadastraSearch.find(params[:id])
    @plan_details = cadastra_data_search.plan_details
    @monuments = cadastra_data_search.monuments
  end

  def plan_details

    index = params[:index].to_i
    cadastra_data_search = CadastraSearch.find(params[:id])
    plan_details = cadastra_data_search.plan_details
    current_parcel = plan_details[index]

    @plan_number, @lots, linkage_numbers = current_parcel[:plan_number], current_parcel[:lots].gsub("|", ","), current_parcel[:linkage_plan_numbers].split("|")

    @linkages = [current_parcel]
    @linkages += plan_details.select{|plan_detail| linkage_numbers.include?(plan_detail[:plan_number]) }
  end



  def tree_show
    cadastra_data_search = CadastraSearch.find(params[:id])
    all_linkages = cadastra_data_search.plan_details.pluck(:plan_number, :linkage_plan_numbers)
    linkages = all_linkages.to_ary.inject([]) do |linkages, linkage|
      linkages << linkage[1].split("|").unshift(linkage[0])
    end.map(&:uniq).sort_by{|l| -l.size}
    # puts linkages.inspect

    copy_of_linkages = linkages.clone
    # #filter out all the subsets
    linkages.each do |i|
      copy_of_linkages.delete_if{ |j| (i.size > j.size) && (i&j) == j }
    end
    # puts copy_of_linkages.inspect
    #to build the hash structure:
    @linkages = []
    copy_of_linkages.each do |linkage|
      @linkages << linkage.reverse.inject({}) do |new_node, number|
        new_node.empty? ? (new_node = {name: number}) : new_node = {name: number, children: [new_node] }
      end
    end
    @linkages = { name: 'root', children: @linkages }
    # puts @linkages.inspect

    # logger.debug @linkages.inspect
    # @linkages = @linkages.to_json
  end

  def upload
    uploaded_io = params[:lot_plan_list]
    lot_plan_list = []
    if uploaded_io
      CSV.foreach(uploaded_io.path, skip_blanks: true, converters: :all, :quote_char => "\x00") do |row|
        lot_plan_list << row.join("/").chomp.strip
      end
      unless lot_plan_list.empty?
        #doing the search
        @cadastra_data_search = CadastraSearch.create!
        @cadastra_data_search.cadastra_data_search(lot_plan_list)
        redirect_to controller:'cadastra_search', action: 'show', id: @cadastra_data_search.id
      end
    end
    if lot_plan_list.empty?
      flash[:notice] = "No data imported"
      render action: 'cadastra_search_new'
    end
  end

  private
  def cadastra_params
    params.require(:cadastra_search).permit(:lot_plan_list)
  end

end
