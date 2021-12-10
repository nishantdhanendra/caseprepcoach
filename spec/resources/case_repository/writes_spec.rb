require "rails_helper"

RSpec.describe CaseRepositoryResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "case_repositories",
          attributes: {},
        },
      }
    end

    let(:instance) do
      CaseRepositoryResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { CaseRepository.count }.by(1)
    end
  end

  describe "updating" do
    let!(:case_repository) { create(:case_repository) }

    let(:payload) do
      {
        data: {
          id: case_repository.id.to_s,
          type: "case_repositories",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      CaseRepositoryResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { case_repository.reload.updated_at }
      # .and change { case_repository.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:case_repository) { create(:case_repository) }

    let(:instance) do
      CaseRepositoryResource.find(id: case_repository.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { CaseRepository.count }.by(-1)
    end
  end
end
