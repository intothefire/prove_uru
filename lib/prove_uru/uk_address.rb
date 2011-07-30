class ProveUru::UkAddress
  attr_accessor :fixed_format, :free_format, :first_year_of_residence, :last_year_of_residence

  def to_prove_hash
    return_hash = {}
    
    return_hash = return_hash.merge!({"FixedFormat" => self.fixed_format.to_prove_hash}) unless self.fixed_format.nil?
    return_hash = return_hash.merge!({"FreeFormat" => self.free_format.to_prove_hash}) unless self.free_format.nil?
    return_hash = return_hash.merge!({"FirstYearOfResidence" => self.first_year_of_residence }) unless self.first_year_of_residence.nil?
    return_hash = return_hash.merge!({"LastYearOfResidence" => self.last_year_of_residence }) unless self.last_year_of_residence.nil?
    
    return_hash
  end
  
end