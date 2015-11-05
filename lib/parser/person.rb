require 'date'

# Person: Represents a person record consisting of: 
#   First Name, 
#   Last Name,
#   Gender,
#   Date of Birth, and 
#   Favorite Color.
#
class Person
  attr_accessor :first_name, :last_name, :gender, :favorite_color, :date_of_birth 
  
  # Returns the Gender as either 'Male' or 'Female'.
  def gender
    @gender = case @gender[0].to_s.downcase 
              when 'f'
                'Female'
              when 'm'
                'Male'
              else
                ''
              end
  end
  
  def date_of_birth
    # Dates with a US format ("mm/dd/YYYY") need to be parsed and formatted as follows in Ruby 2.0
    # Else just return the formatted date as desired.
    if @date_of_birth.include? "/"
      d = Date.strptime(@date_of_birth.strip.gsub(/\s+/, ""),"%m/%d/%Y").strftime('%-m/%-d/%Y')
    else
      d = DateTime.strptime(@date_of_birth,"%m-%d-%Y").strftime("%-m/%-d/%Y")  
    end
    @date_of_birth = d
  rescue
    raise ArgumentError, "Invalid date."
  end
  
  # Overwrite the .to_s method to return the presented data in the desired format.
  def to_s
    "#{@last_name.strip} #{@first_name.strip} #{gender.strip} #{date_of_birth.strip} #{@favorite_color.strip}"
  end
end