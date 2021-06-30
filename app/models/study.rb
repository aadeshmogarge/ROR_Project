class Study < ApplicationRecord

  validates :name, :drug, presence: true
  validates :age_limit, numericality: {greater_than: 7}
  validates :phase, numericality: {less_than_or_equal_to: 5}
  
  belongs_to :study_group, optional: true
  belongs_to :study_group, optional: true, touch: true
  has_many :sites
  # This association will enforce you to have related object in the database. Should not be nill or any non existing object.

  has_many :enrollments
  has_many :subjects , through: :enrollments

  has_many :participants

end
