require "prove_uru/version"

require 'rails'
require 'active_support/core_ext/numeric/time'
require 'active_support/dependencies'
require 'set'
require 'savon'



module ProveUru
  autoload :Authenticate,            'prove_uru/authenticate'
  autoload :AuthenticationResult,            'prove_uru/authentication_result'
  autoload :ProfileList,            'prove_uru/profile_list'
  autoload :Profile,                'prove_uru/profile'
  autoload :FreeAddress,            'prove_uru/free_address'
  autoload :FixedAddress,           'prove_uru/fixed_address'
  autoload :UkData,           'prove_uru/uk_data'
  autoload :UkAddress,           'prove_uru/uk_address'
  autoload :PersonalData,           'prove_uru/personal_data'
  
  XML_NAMESPACE = "https://www.prove-uru.co.uk/"
  TEST_BASE_URL = "https://pilot.prove-uru.co.uk:8443/"
  LIVE_BASE_URL = "https://www.prove-uru.co.uk:8443/"
  
  PROVE_SERVICE_ROOT = "URUWS"
  
  mattr_accessor :current_version
  @@current_version = "10a"
  
  mattr_accessor :test_mode
  @@test_mode = false
  
  mattr_accessor :account_name
  @@account_name = nil
  
  mattr_accessor :password
  @@password = nil
  
  def self.setup
    yield self
  end
  
  def self.get_service_wsdl
    root = @@test_mode ?  TEST_BASE_URL : LIVE_BASE_URL
    "#{root}#{PROVE_SERVICE_ROOT}/URU#{@@current_version}.asmx?wsdl"
  end
  
  def self.create_client
    ::Savon::Client.new do
      wsdl.document = self.get_service_wsdl
      wsdl.namespace = XML_NAMESPACE
    end
  end
  
  def self.merge_prove_password_hash(options = {})
    raise "ProveURU Account Name and/or Password Have Not Been Set" if @@account_name.nil? || @@password.nil?
    
    password_hash = {
      "AccountName" => @@account_name,
      "Password" => @@password
    }
    
    options.merge!(password_hash)
  end
  
end
