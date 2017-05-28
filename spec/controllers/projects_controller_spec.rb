require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do
    it "creates project and redirects with all parameters set" do
      post :create, params: { project: { title: 'Something wonderful', requirements: '...', skill_level: 'senior' } }
      expect(response).to redirect_to(projects_path)
      expect(assigns(:action).project.title).to eq('Something wonderful')
    end

    it 'creates project and redirects with only reqd parameters set' do
      post :create, params: { project: { title: 'Title', requirements: 'Requirements' } }
      expect(response).to redirect_to(projects_path)
      expect(assigns(:action).project.title).to eq('Title')
    end

    it 'does not create the project and renders new' do
      post :create, params: { project: { title: '', requirements: '...' } }
      expect(response).to render_template(:new)
      expect(assigns(:project)).to be_present
      expect(assigns(:project)).not_to be_persisted
    end
  end
end
