class FoodsController < ApplicationController
  def search
    foods = if !names.empty? && !category.empty?
              Category.where("name LIKE ?", category)
                .first.try(:foods).try(:where, food_sql_query, *names)
            elsif category.empty?
              Food.where(food_sql_query, *names)
            elsif names.empty?
              Category.where("name LIKE ?", category).first.try(:foods)
            end.try(:order, :name) || []
    render json: foods
  end

  private

  # Only allow a trusted parameter "white list" through.
  def food_params
    params.require(:food).permit(:name)
    params.require(:food).permit(:category)
  end

  def food_sql_query
    return "name LIKE ?" if names.is_a? String
    query = "name LIKE ?"
    (names.length-1).times do
      query << " OR name LIKE ?"
    end

    query
  end

  def names
    return '' unless params[:name].present?
    return '%' + params[:name] + '%' if params[:name].is_a? String
    params[:name].map do |name|
      name.is_a?(String) ? ['%' + name + '%'] : ['%' + name.first + '%']
    end
  end

  def category
    @_category ||= params[:category] || ''
  end
end
