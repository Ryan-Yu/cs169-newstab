require 'spec_helper'

describe ArticlesController, :type => :controller do


  # # This should return the minimal set of attributes required to create a valid
  # # Article. As you add validations to Article, be sure to
  # # adjust the attributes here as well.

  # let(:valid_attributes) { { "url" => "MyURL", "initial_comment" => "hello" , "user_id" => 1} }

  # # This should return the minimal set of values that should be in the session
  # # in order to pass any filters (e.g. authentication) defined in
  # # ArticlesController. Be sure to keep this updated too.
  # let(:valid_session) { {} }

  # describe "GET index" do
  #   it "assigns all articles as @articles" do
  #     article = Article.create! valid_attributes
  #     get :index, {}, valid_session
  #     assigns(:articles).should eq([article])
  #   end
  # end

  # describe "GET show" do
  #   it "assigns the requested article as @article" do
  #     article = Article.create! valid_attributes
  #     get :show, {:id => article.to_param}, valid_session
  #     assigns(:article).should eq(article)
  #   end
  # end

  # describe "GET new" do
  #   it "assigns a new article as @article" do
  #     sign_in
  #     get :new, {}, valid_session
  #     assigns(:article).should be_a_new(Article)
  #   end
  # end

  # describe "GET edit" do
  #   it "assigns the requested article as @article" do
  #     article = Article.create! valid_attributes
  #     get :edit, {:id => article.to_param}, valid_session
  #     assigns(:article).should eq(article)
  #   end
  # end

  # describe "POST create" do
  #   describe "with valid params" do
  #     it "creates a new Article" do
  #       user = sign_in
  #       articles = double('usersarticles')
  #       allow(articles).to receive(:build).and_return(Article.create! valid_attributes)
  #       allow(user).to receive(:articles).and_return(articles)
  #       expect {
  #         post :create, {:article => valid_attributes}, valid_session
  #       }.to change(Article, :count).by(1)
  #     end

  #     it "assigns a newly created article as @article" do
  #       user = sign_in
  #       articles = double('usersarticles')
  #       allow(articles).to receive(:build).and_return(Article.create! valid_attributes)
  #       allow(user).to receive(:articles).and_return(articles)
  #       post :create, {:article => valid_attributes}, valid_session
  #       assigns(:article).should be_a(Article)
  #       assigns(:article).should be_persisted
  #     end

  #     it "redirects to the created article" do
  #       user = sign_in
  #       articles = double('usersarticles')
  #       allow(articles).to receive(:build).and_return(Article.create! valid_attributes)
  #       allow(user).to receive(:articles).and_return(articles)
  #       post :create, {:article => valid_attributes}, valid_session
  #       response.should redirect_to(Article.last)
  #     end
  #   end

  #   describe "with invalid params" do
  #     it "re-renders the 'new' template" do
  #       user = sign_in
  #       articles = double('usersarticles')
  #       article = double('article')
  #       allow(articles).to receive(:build).and_return(article)
  #       allow(article).to receive(:populate_url_fields)
  #       allow(article).to receive(:save).and_return(false)
  #       allow(user).to receive(:articles).and_return(articles)
  #       # Trigger the behavior that occurs when invalid params are submitted
  #       post :create, {:article => { "url" => "invalid value" }}, valid_session
  #       response.should render_template("new")
  #     end
  #   end
  # end

  # describe "PUT update" do
  #   describe "with valid params" do
  #     it "updates the requested article" do
  #       sign_in
  #       article = Article.create! valid_attributes
  #       # Assuming there are no other articles in the database, this
  #       # specifies that the Article created on the previous line
  #       # receives the :update_attributes message with whatever params are
  #       # submitted in the request.
  #       Article.any_instance.should_receive(:update).with({ "url" => "MyString" })
  #       put :update, {:id => article.to_param, :article => { "url" => "MyString" }}, valid_session
  #     end

  #     it "assigns the requested article as @article" do
  #       sign_in
  #       article = Article.create! valid_attributes
  #       put :update, {:id => article.to_param, :article => valid_attributes}, valid_session
  #       assigns(:article).should eq(article)
  #     end

  #     it "redirects to the article" do
  #       sign_in
  #       article = Article.create! valid_attributes
  #       put :update, {:id => article.to_param, :article => valid_attributes}, valid_session
  #       response.should redirect_to(article)
  #     end
  #   end

  #   describe "with invalid params" do
  #     it "assigns the article as @article" do
  #       sign_in
  #       article = Article.create! valid_attributes
  #       # Trigger the behavior that occurs when invalid params are submitted
  #       Article.any_instance.stub(:save).and_return(false)
  #       put :update, {:id => article.id, :article => { "concept" => "invalid value" }}, valid_session
  #       assigns(:article).should eq(article)
  #     end

  #     it "re renders the 'edit' template" do
  #       sign_in
  #       article = Article.create! valid_attributes
  #       # Trigger the behavior that occurs when invalid params are submitted
  #       Article.any_instance.stub(:save).and_return(false)
  #       put :update, {:id => article.id, :article => { "concept" => "invalid value" }}, valid_session
  #       response.should render_template("edit")
  #     end
  #   end
  # end

  # describe "DELETE destroy" do
  #   it "destroys the requested article" do
  #     user = sign_in
  #     articles = double('usersarticles')
  #     allow(user).to receive(:articles).and_return(articles)
  #     article = Article.create! valid_attributes
  #     allow(articles).to receive(:build).and_return(article)
  #     allow(articles).to receive(:find_by_id).and_return(article)
  #     expect {
  #       delete :destroy, {:id => article.id}, valid_session
  #     }.to change(Article, :count).by(-1)

  #   end

  #   it "redirects to the articles list" do
  #     user = sign_in
  #     articles = double('usersarticles')
  #     allow(user).to receive(:articles).and_return(articles)
  #     article = Article.create! valid_attributes
  #     allow(articles).to receive(:build).and_return(article)
  #     allow(articles).to receive(:find_by_id).and_return(article)
  #     delete :destroy, {:id => article.id}, valid_session
  #     response.should redirect_to(articles_url)
  #   end
  # end

end
