require 'rails_helper'

RSpec.describe SearchController, type: :controller do
  describe 'GET #index' do
    it 'responds successfully with an HTTP 200 status code' do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('search/index')
    end

    it 'searches for the given query and loads all the projects into @projects' do
      project = create(:project, name: 'pajamas', owner: 'bananas')

      get :index, q: 'bananas'
      expect(assigns(:projects)).to include(project)
    end
  end
end
