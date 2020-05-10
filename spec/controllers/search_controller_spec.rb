require 'rails_helper'

RSpec.describe SearchController, type: :controller do
  describe 'GET #index' do
    it 'responds successfully with an HTTP 200 status code' do
      get :index
      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('search/index')
    end

    it 'searches for the given query and loads the projects into @projects' do
      project = create(:project, name: 'pajamas', owner: 'bananas')

      get :index, params: { q: 'bananas' }
      expect(assigns(:projects)).to include(project)
    end

    it 'searches for the given query and filters by language' do
      java_project = create(:project, owner: 'bananas', main_language: 'java')
      ruby_project = create(:project, owner: 'bananas', main_language: 'ruby')

      get :index, params: { q: 'bananas', main_language: 'ruby' }
      expect(assigns(:projects)).to include(ruby_project)
      expect(assigns(:projects)).not_to include(java_project)
    end
  end
end
