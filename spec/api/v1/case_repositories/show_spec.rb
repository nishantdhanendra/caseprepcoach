require 'rails_helper'

RSpec.describe "case_repositories#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/case_repositories/#{case_repository.id}", params: params
  end

  describe 'basic fetch' do
    let!(:case_repository) { create(:case_repository) }

    it 'works' do
      expect(CaseRepositoryResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('case_repositories')
      expect(d.id).to eq(case_repository.id)
    end
  end
end
