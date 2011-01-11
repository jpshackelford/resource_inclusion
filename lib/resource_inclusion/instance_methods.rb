module ResourceInclusion
  module InstanceMethods   
    
    def included_resources
      self.class.send(:instance_variable_get, :@included_resources)
    end
     
  end
end