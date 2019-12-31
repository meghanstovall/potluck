class Potluck

  attr_reader :date, :dishes

  def initialize(date)
    @date = date
    @dishes = []
  end

  def add_dish(dish)
    @dishes << dish
  end

  def get_all_from_category(category)
    @dishes.find_all {|dish| dish.category == category}
  end

  def menu
    menu_hash = @dishes.reduce({}) do |hash, dish|
      if hash.keys.include?(dish.category)
        hash[dish.category] << dish.name
      else
        hash[dish.category] = [dish.name]
      end
      hash
    end

    final_hash = {}
    menu_hash.each do |pair|
      final_hash[pair.first] = pair.last.sort
    end
    final_hash
  end

  def ratio(category)
    menu_hash = menu
    total_values = menu.values.flatten.length
    cat_values = menu_hash[category].length
    (cat_values / total_values.to_f) * 100
  end
end
