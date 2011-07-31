
class ProveUru::AuthenticationResult
  ATTRIBUTES = [
    :authentication_id, :timestamp, :no_retry, :user_breakpoint, :authentication_count,
    :profile_id, :profile_name, :profile_version, :profile_revision, :profile_state,
    :result_codes, :score, :band_text
  ].freeze

  ATTRIBUTES.each do |attr|
    attr_accessor attr
  end
   
  def initialize(args = nil)
    ATTRIBUTES.each do |a|
      if (args.key?(a))
        instance_variable_set("@#{a}", args[a])
      end
    end
  end

  def inspect
    ATTRIBUTES.inject({ }) do |h, attr|
      h[attr] = instance_variable_get("@#{attr}")
      h
    end
  end
  
end

# {
#   :authenticate_by_profile_response=>{
#     :authenticate_by_profile_result=>{
#       :authentication_id=>"db6d46ed-e44d-4f96-a101-f81252d54fa3", 
#       :timestamp=>nil, :no_retry=>nil, :user_breakpoint=>"6", :authentication_count=>"15", 
#       :profile_id=>"6e7c1e73-3471-4777-ae35-24283761a4da", :profile_name=>"Core KYC Check", :profile_version=>"1", :profile_revision=>"0", :profile_state=>"PS_EFF", 
#       :result_codes=>{
#         :item_check=>[
#           {:type=>"Standard", :name=>"Mortality", :description=>"Provides checking of a name at an address against the \"Halo Register\" data.", :comment=>{:result_code=>[{:description=>"No middle initial specified by user.", :@code=>"101"}, {:description=>"No/insufficient details supplied by user for address #2", :@code=>"112"}, {:description=>"No/insufficient details supplied by user for address #3", :@code=>"113"}, {:description=>"No/insufficient details supplied by user for address #4", :@code=>"114"}]}, :match=>{:result_code=>{:description=>"Halo source indicates this person is not deceased at address #1", :@code=>"1071"}}, :@id=>"10"}, 
#           {:type=>"ElectoralRoll", :name=>"Electoral Roll (Edited) / PAF", :description=>"Provides authentication of name and address including 5 year history and date of birth.", :comment=>{:result_code=>[{:description=>"No middle initial specified by user.", :@code=>"101"}, {:description=>"First year of residence for address #1 not supplied by user.", :@code=>"151"}, {:description=>"Last year of residence for address #1 not supplied by user. Applying default.", :@code=>"161"}, {:description=>"No date of birth is available on the electoral roll at address #1", :@code=>"131"}, {:description=>"No/insufficient details supplied by user for address #2", :@code=>"112"}, {:description=>"No/insufficient details supplied by user for address #3", :@code=>"113"}, {:description=>"No/insufficient details supplied by user for address #4", :@code=>"114"}]}, :match=>{:result_code=>[{:description=>"Address #1 details are valid", :@code=>"1001"}, {:description=>"Surname details matched address #1", :@code=>"1011"}]}, :warning=>{:result_code=>{:description=>"Forename alias matched address #1", :@code=>"4091"}}, :@id=>"1"}, 
#           {:type=>["Telephone", "URUTelephoneCheckResultCodes"], :name=>"Land Telephone", :description=>"Provides authentication against land telephone number and ex-directory status.", :comment=>{:result_code=>{:description=>"Execution of this item check was ignored (profile conditions were not met).", :@code=>"2"}}, :@id=>"6"}, 
#           {:type=>"CallID", :name=>"CallID (Money Laundering)", :description=>"Provides authentication of name, address and date of birth against CallID for a Money Laundering Check.", :comment=>{:result_code=>{:description=>"Execution of this item check was ignored (profile conditions were not met).", :@code=>"2"}}, :@id=>"55"}
#         ]
#       }, 
#       :score=>"1011", 
#       :band_text=>"3. PASS Age & KYC"
#     }, 
#     :@xmlns=>"https://www.prove-uru.co.uk/"
#   }
# } 