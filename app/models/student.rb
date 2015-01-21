require_relative '../../db/config'

class Student < ActiveRecord::Base
  def name
    first_name = self.first_name.to_s
    last_name = self.last_name.to_s
    return "#{first_name} #{last_name}"
  end

  def age
    now = Time.now.utc.to_date
    now.year - birthday.year - ((now.month > birthday.month || (now.month == birthday.month && now.day >= birthday.day)) ? 0 : 1)
  end

#Regex for email stolen from internet
    validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
    validates :email, :uniqueness => true
    validates :age, :exclusion => { in: (0..5)}
#Regex worked out according to error message output in terminal. I.e. the format is "(510) 555-1212 x4567" not as in question..
    validates :phone, :format => { :with =>  /\(\d{3}\) \d{3}-\d{4}/ }

end

class Teacher < ActiveRecord::Base