module ClinicalTrial
  attr_accessor :name, :age

  def set_attr(name, age)
      @name = name
      @age = age
  end
end

class Clinician
  include ClinicalTrial
   
  attr_accessor :speciality, :region, :status

  def initialize(name, age, speciality, region)
      set_attr(name, age)
      @speciality = speciality
      @region = region
      @status = determine_status
  end

  def determine_status
      if(self.region == "India" && self.speciality != "dentist")
          return  "Active"
      else
          return "Inactive"
      end
  end
end


class Patient
  include ClinicalTrial
  @@consented = 0
  @@unconsented = 0;
  attr_accessor :email, :contact, :gender, :consent

  def self.consented_patients
      return @@consented
  end
  def self.unconsented_patients
      return @@unconsented
  end
  def self.consent_percentage
      return (@@consented * 100) / (@@consented + @@unconsented)
  end

  def initialize(name, age, email, contact, gender, consent)
      set_attr(name, age)
      @email = email
      @contact = contact
      @gender = gender
      @consent = consent
      if consent == "consented"
          @@consented = @@consented + 1
      else
          @@unconsented = @@unconsented + 1
      end
  end

  def eligible_for_trial?
      return (self.gender == "male" && self.age >= 12) || (self.gender == "female" && self.age >= 15)
  end
end



patientsArray = [
  Patient.new("aadesh", 23, "gj@c.com", 12345678, "male", "consented"),
  Patient.new("bcde", 22, "a@b.com", 78945612, "female", "consented"),
  Patient.new("lkjh", 28, "a@b.com", 65874932, "male", "consented"),
  Patient.new("abcd", 25, "a@b.com", 14785236, "female", "unconsented"),
  Patient.new("pqrs", 33, "a@b.com", 96325874, "male", "consented"),
  Patient.new("jk", 34, "a@b.com", 85236974, "female", "consented"),
  Patient.new("olm", 26, "a@b.com", 75315975, "male", "consented")
]

puts "consented_patients = #{Patient.consented_patients}"
puts "unconsented_patients = #{Patient.unconsented_patients}"
puts "consented_percentage = #{Patient.consent_percentage}"
puts "\n"

patientsArray.each{
  |patient| puts("#{patient.name} is #{patient.eligible_for_trial? ? "elgible" : "not eligible"} for trial")
}

puts "\n"

c1 = Clinician.new("clinician1", 35, "dentist", "India")

puts "Clinician status = #{c1.status}"