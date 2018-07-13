class Captain < ActiveRecord::Base
  has_many :boats

  def self.catamaran_operators
    includes(boats: :classifications).where(classifications: {name: 'Catamaran'})
  end

  def self.sailors
    includes(boats: :classifications).where(classifications: {name: 'Sailboat'}).uniq
  end

<<<<<<< HEAD
  def self.motorboaters
=======
  def self.motorboats
>>>>>>> 89b36431061d3eb9ff67772410911b1e24aaeab2
    includes(boats: :classifications).where(classifications: {name: 'Motorboat'}).uniq
  end

  def self.talented_seafarers
<<<<<<< HEAD
    where("id IN (?)", self.sailors.pluck(:id) & self.motorboaters.pluck(:id))
=======
    includes(boats: :classifications).where(classifications: {name: 'Sailboat'},classifications: {name: 'Motorboat'}).all

>>>>>>> 89b36431061d3eb9ff67772410911b1e24aaeab2
  end

  def self.non_sailors
    where.not("id IN (?)", self.sailors.pluck(:id))
  end

end
