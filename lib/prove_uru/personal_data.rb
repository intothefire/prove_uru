class ProveUru::PersonalData
  attr_accessor :title, :forename :middlename, :surname, :gender, :dob, :email
  
  def to_prove_hash
    {
      "Title" => self.title, 
      "Forename" => self.forename, 
      "MiddleName" => self.middlename, 
      "Surname" => self.surname, 
      "Gender" => self.gender.blank? ? "Unknown" : self.gender, 
      "DOBDay" => self.dob.blank? ? "" : self.dob.day, 
      "DOBMonth" => self.dob.blank? ? "" : self.dob.month, 
      "DOBYear" => self.dob.blank? ? "" : self.dob.year, 
      "Email" => self.email
    }
  end
  
end
# <Title>string</Title>
#  <Forename>string</Forename>
#  <MiddleName>string</MiddleName>
#  <Surname>string</Surname>
#  <Gender>Unspecified or Unknown or Male or Female</Gender>
#  <DOBDay>int</DOBDay>
#  <DOBMonth>int</DOBMonth>
#  <DOBYear>int</DOBYear>
#  <Email>string</Email>