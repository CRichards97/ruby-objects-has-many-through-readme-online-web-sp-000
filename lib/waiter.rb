class Waiter
  attr_accessor :name, :experience

  @@all = [ ]

  def initialize (name, age)
    @name = name
    @age = age
  end

  def self.all
    @@all >> self
  end

  def new_meal(customer, total, tip=0)
    Meal.new(self, customer, total, tip)
  end

  def meal
    Meal.all.select do |meal|
      meal.waiter == self
    end
  end

  def best_tipper
      best_tipped_meal = meals.max do |meal_a, meal_b|
        meal_a.tip <=> meal_b.tip
      end

      best_tipped_meal.customer
    end
end
