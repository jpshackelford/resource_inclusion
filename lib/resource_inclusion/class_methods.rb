module ResourceInclusion
  module ClassMethods
    
    protected
   
    # Pass arguments to the serializer with the :include option, e.g.
    # object.to_xml(:include => your_args).
    def include_resource(*args)
      
      @included_resources = args.dup.freeze
      
      # TODO Is there a shortcut for appending a responder?
      unless self.responder.include?( ResourceInclusion::ResourceIncludeResponder )
        klass = Class.new( self.responder )
        klass.send(:include, ResourceInclusion::ResourceIncludeResponder)
        self.responder = klass        
      end
    
    end
    
    alias include_resources include_resource
    
  end
end