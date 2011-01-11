require File.expand_path('test_helper', File.dirname(__FILE__))

Debugger.start

class Comment
  extend ActiveModel::Naming
  
#  include ActiveModel::Serializers::JSON
#  include ActiveModel::Serializers::Xml
#  
#  attr_accessor :text, :attributes
#  
#  def initialize( attributes )
#    @attributes = attributes
#  end
  
end

class CommentsController < ApplicationController
  
  respond_to :xml, :json

  include_resource :user
  
  def index
    @comments = Comment.all
    debugger
    respond_with(@comments)    
  end
  
  def show
    @comment = Comment.find(params[:id])
    debugger
    respond_with(@comment)    
  end
  
end


class IndexActionBaseTest < ActionController::TestCase
  
  tests CommentsController
  
  def setup
    @routes = TestRoutes      
    @mock_comment = mock() #Comment.new('text' => 'my comment')
  end
  
  def test_index_xml
    assert_equal [:user], @controller.included_resources
    
    Comment.expects(:all).returns([@mock_comment])
    @request.accept = 'application/xml'
    @mock_comment.expects(:to_xml).with( has_entry({:include => :user}))  
      
    get :index
    assert_response :success
  end
  
  def test_show_xml
    
    assert_equal [:user], @controller.included_resources
    
    Comment.expects(:find).with('1').returns( @mock_comment )
    @request.accept = 'application/xml'    
    @mock_comment.expects(:to_xml).with(has_entry({:include => :user}))
    
#   debugger
          
    get :show, :id => '1'
    assert_response :success
    assert_equal @mock_comment, assigns(:comment)
  end
#
#  def test_json
#    Comment.expects(:find).with('1').returns( @mock_comment )
#    @request.accept = 'application/json'
#    # @mock_comment.expects(:to_json).with( has_entry({:include => :user}))
#      
#    get :show, :id => '1'
#    assert_response :success
#    assert_equal '', @response.body
#  end

end