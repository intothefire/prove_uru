class ProveUru::FreeAddress
  attr_accessor :line_1, :line_2, :line_3, :line_4, :line_5, :line_6, :line_7, :line_8
  
  def to_prove_hash
    {
      "Line1" => :line_1,
      "Line2" => :line_2,
      "Line3" => :line_3,
      "Line4" => :line_4,
      "Line5" => :line_5,
      "Line6" => :line_6,
      "Line7" => :line_7,
      "Line8" => :line_8,
      "Line9" => :line_9
    }
  end
  
end




