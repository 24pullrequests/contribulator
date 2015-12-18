require "rails_helper"

RSpec.describe Api::ProjectsController, type: :controller do
  describe "GET #index" do
    let!(:project) { create(:project, github_id: 123) }

    before do
      get :index
    end

    it "status" do
      expect(response.status).to eq(200)
    end

    it "data contains the project" do
      expect(JSON.parse(response.body)['data'].map { |e| e['id'] }).to eq(%w(123))
    end

    it "meta total_records" do
      expect(JSON.parse(response.body)['meta']['total_records']).to eq(1)
    end
  end

  describe "GET #show" do
    context 'success' do
      let!(:project) { create(:project, github_id: 123, owner: 'jack', name: 'foo') }

      before do
        get :show, id: 123
      end

      it "responds successfully with an HTTP 200 status code" do
        expect(response).to have_http_status(200)
      end

      it "github_id" do
        expect(JSON.parse(response.body)['data']['id']).to eq('123')
      end

      it "attributes" do
        expect(JSON.parse(response.body)['data']['attributes']).to eq(
          'owner' => 'jack',
          'github_id' => 123,
          'name' => 'foo',
          'name_with_owner' => 'jack/foo',
          'score' => 20
        )
      end

      it "links" do
        expect(JSON.parse(response.body)['data']['links']).to eq(
          'self' => 'http://test.host/api/projects/123'
        )
      end
    end

    context '404' do
      before do
        get :show, id: 999
      end

      it "404" do
        expect(response).to have_http_status(404)
      end

      it "errors" do
        expect(JSON.parse(response.body)['errors'].first['title']).to eq('Record not found')
      end
    end
  end
end
