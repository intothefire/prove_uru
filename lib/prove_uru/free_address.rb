class ProveUru::FreeAddress
  attr_accessor :line_1, :line_2, :line_3, :line_4, :line_5, :line_6, :line_7, :line_8
  
  def to_prove_hash
    {
      "Line1" => self.line_1,
      "Line2" => self.line_2,
      "Line3" => self.line_3,
      "Line4" => self.line_4,
      "Line5" => self.line_5,
      "Line6" => self.line_6,
      "Line7" => self.line_7,
      "Line8" => self.line_8
    }
  end
  
end




