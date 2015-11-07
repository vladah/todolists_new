class Profile < ActiveRecord::Base
  belongs_to :user

  validates :gender, inclusion: ['male', 'female']
  validate :first_or_last
  validate :males_no_sue

  def first_or_last
  	if first_name == nil and last_name == nil
      errors.add(:first_name, "First name and last name cannot both be empty")
      errors.add(:last_name, "First name and last name cannot both be empty")
    end
  end

  def males_no_sue
  	errors.add(:first_name, "If you are a male you cannot be called Sue, lol.") if gender == "male" and first_name == "Sue"
  end
  
  def self.get_all_profiles(min_by, max_by)
  	Profile.where("birth_year BETWEEN ? AND ?", min_by, max_by).order("birth_year ASC")
  end
end
