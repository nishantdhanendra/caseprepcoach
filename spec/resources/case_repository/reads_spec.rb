require "rails_helper"

RSpec.describe CaseRepositoryResource, type: :resource do
  describe "serialization" do
    let!(:case_repository) { create(:case_repository) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(case_repository.id)
      expect(data.jsonapi_type).to eq("case_repositories")
    end
  end

  describe "filtering" do
    let!(:case_repository1) { create(:case_repository) }
    let!(:case_repository2) { create(:case_repository) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: case_repository2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([case_repository2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:case_repository1) { create(:case_repository) }
      let!(:case_repository2) { create(:case_repository) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      case_repository1.id,
                                      case_repository2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      case_repository2.id,
                                      case_repository1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
