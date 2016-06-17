
require 'csv'
require 'json'

class CadastraSearchController < ApplicationController

  before_action :get_cadastra_data_search_object, :only => [:show, :plan_details, :tree_show]

  def cadastra_search_new
  end

  def cadastra_search
    create_search(cadastra_params[:lot_plan_list].split(","))
  end

  def show
    @plan_details = @cadastra_data_search.plan_details.order(submission_date: :desc)
    @monuments = @cadastra_data_search.monuments
  end

  def plan_details
    plans = @cadastra_data_search.plan_details
    current_parcel = plans.find params[:plan_id]

    @plan_number, @lots = current_parcel[:plan_number], current_parcel[:lots].gsub("|", ",")

    @linkages = plans.where(plan_number: current_parcel[:linkage_plan_numbers].split("|")).order(submission_date: :desc)
  end



  def tree_show

   # puts @plan_details.inspect
    @linkages = { "nodes" => [] }
    @cadastra_data_search.plan_details.find_each do |p|
      @linkages["nodes"] << { "index" => p.plan_number,
                            "links" => p.linkage_plan_numbers.split("|"),
                            "plan_number_date" => "#{p.plan_number} (#{p.submission_date})",
                            "surveyor" => p.surveyor,
                            "description" => "",
                            "compiled" =>   p.compiled,
                            "field_note_flag" => p.field_note_flag,
                            "id" => p.id}
    end
    @linkages = @linkages.to_json
    logger.debug @linkages.inspect
    # puts linkage_json.inspect


    # plan_number_and_children = cadastra_data_search.plan_details.pluck(:plan_number, :children_plan_number).to_ary
    # copy_of_plan_number_and_children = plan_number_and_children
    # @children = []
    # all_nodes = []
    # plan_number_and_children.inject([]) do |arr, pair|
    #   #find a node, may cause it's been added before when it's a child of other node, have to update its children
    #   if child_node = all_nodes.select{|node| node[:name] == pair[0] }[0]
    #
    #   end
    #   node = {name: pair[0],  children: []}
    #   (pair[1] - pair[0]).uniq.each do |child|
    #     unless child_node = all_nodes.select{|node| node[:name] == child }[0]
    #       child_node = { name: child, children: []}
    #       all_nodes << child_node
    #     end
    #     node[:children] << child_node
    #     all_nodes.each do |node|
    #       if node[:name] == node[:name]
    #
    #       end
    #     end
    #     all_nodes << node
    #     @children << node
    #   end
    # end
    #
    #
    # children = all_children.to_ary.inject([]) do |arr, children|
    #   arr << children[1].unshift(children[0])
    #   arr
    # end.map(&:uniq).sort_by{|l| -l.size}
    # #
    # puts children.inspect
    # copy_of_children = children.clone
    # # #filter out all the subsets
    # children.each do |i|
    #   copy_of_children.delete_if{ |j| (i.size > j.size) && (i&j) == j }
    # end
    # puts copy_of_children.inspect
    #
    # @children = []
    # copy_of_children.each do |child|
    #   @children << child.reverse.inject({}) do |new_node, number|
    #     new_node.empty? ? (new_node = {name: number}) : new_node = {name: number, children: [new_node] }
    #   end
    # end
    # @children = { name: 'root', children: @children }
    # puts @children.inspect
    #
    # all_linkages = cadastra_data_search.plan_details.pluck(:plan_number, :linkage_plan_numbers)
    # puts all_linkages.inspect
    # linkages = all_linkages.to_ary.inject([]) do |linkages, linkage|
    #   linkages << linkage[1].split("|").unshift(linkage[0])
    # end.map(&:uniq).sort_by{|l| -l.size}#.map(&:reverse)
    # puts linkages.inspect
    #
    # copy_of_linkages = linkages.clone
    # # #filter out all the subsets
    # linkages.each do |i|
    #   copy_of_linkages.delete_if{ |j| (i.size > j.size) && (i&j) == j }
    # end
    # puts copy_of_linkages.inspect
    #to build the hash structure:
    # @linkages = []
    # copy_of_linkages.each do |linkage|
    #   @linkages << linkage.reverse.inject({}) do |new_node, number|
    #     new_node.empty? ? (new_node = {name: number}) : new_node = {name: number, children: [new_node] }
    #   end
    # end
    # @linkages = { name: 'root', children: @linkages }
    # puts @linkages.inspect

    # logger.debug @linkages.inspect
    # @linkages = @linkages.to_json
  end

  def upload
    uploaded_io = params[:lot_plan_list]
    lot_plan_list = []
    CSV.foreach(uploaded_io.path, skip_blanks: true, converters: :all, :quote_char => "\x00") do |row|
      lot_plan_list << row.join("/").chomp.strip
    end if uploaded_io
    create_search(lot_plan_list)
  end

  private
  def cadastra_params
    params.require(:cadastra_search).permit(:lot_plan_list)
  end

  def get_cadastra_data_search_object
    @cadastra_data_search = CadastraSearch.find(params[:id])
  end

  def create_search(lot_plan_list = [])
    if lot_plan_list.empty?
      flash[:notice] = "Not Valid lot plan number."
      render action: 'cadastra_search_new'
    else
      @cadastra_data_search = CadastraSearch.create!
      @cadastra_data_search.cadastra_data_search(lot_plan_list.map(&:chomp).map(&:strip))
      redirect_to controller:'cadastra_search', action: 'show', id: @cadastra_data_search.id
    end
  end

end
