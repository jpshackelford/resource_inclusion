require File.expand_path("../../spec_helper", __FILE__)

describe CommentsController do

  before :each do
    
    @comment = Comment.new(      
      :text  => 'my comment', 
      :user  => User.new(        
        :login_id      => 'ping',
        :display_name  => 'Ping the Duck',
        :email         => 'ping@yellow-river.tld'    
    ))
    
  end
  
  describe "GET index" do
    
    before :each do
      Comment.should_receive(:all).and_return( [@comment] )
    end
    
    it "includes user in the xml" do
      get :index, :format => 'xml'
      response.body.should have_xpath("/comments/comment/user/display-name")
    end
    
    it "includes user in the json" do
      get :index, :format => 'json'
      response.body.should == [@comment].to_json(:include => :user ) 
    end
  end
  
  describe "GET show" do
    
    before :each do
      Comment.should_receive(:find).and_return( @comment )
    end

    it "includes user in the xml" do      
      get :show, {:id => '1', :format => 'xml'} 
      response.body.should have_xpath("/comment/user/display-name")
    end
    
    it "includes user in the json" do
      get :show, {:id => '1', :format => 'json'} 
      response.body.should == @comment.to_json( :include => :user ) 
    end
    
  end

  
end