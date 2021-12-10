require 'rails_helper'

RSpec.describe "case_repositories#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/case_repositories/#{case_repository.id}"
  end

  describe 'basic destroy' do
    let!(:case_repository) { create(:case_repository) }

    it 'updates the resource' do
      expect(CaseRepositoryResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { CaseRepository.count }.by(-1)
      expect { case_repository.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
