require "rails_helper"

RSpec.describe "case_repositories#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/case_repositories", params: params
  end

  describe "basic fetch" do
    let!(:case_repository1) { create(:case_repository) }
    let!(:case_repository2) { create(:case_repository) }

    it "works" do
      expect(CaseRepositoryResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["case_repositories"])
      expect(d.map(&:id)).to match_array([case_repository1.id,
                                          case_repository2.id])
    end
  end
end
