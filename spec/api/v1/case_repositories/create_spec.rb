require 'rails_helper'

RSpec.describe "case_repositories#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/case_repositories", payload
  end

  describe 'basic create' do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: 'case_repositories',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(CaseRepositoryResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { CaseRepository.count }.by(1)
    end
  end
end
