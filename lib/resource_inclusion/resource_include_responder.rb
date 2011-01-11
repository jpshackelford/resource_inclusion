module ResourceInclusion

  module ResourceIncludeResponder
    def display(resource, given_options={})
      given_options.store( :include, *controller.included_resources )
      super
    end
  end
  
end