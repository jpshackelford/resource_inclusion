class ActionController::Base

  # Add the #include_resource and #include_resources macros. 
  def self.resource_inclusion
    
    self.class_eval do
      extend  ResourceInclusion::ClassMethods
      include ResourceInclusion::InstanceMethods
    end
      
  end

end
