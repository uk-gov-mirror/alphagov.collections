require 'test_helper'

describe CitizenReadiness::TaxonLinkPresenter do
  include TaxonHelpers

  let(:content_hash) { education_taxon }
  let(:content_item) { ContentItem.new(content_hash) }
  let(:presenter) { described_class.new(content_item) }

  describe '#link' do
    it 'should return a link' do
      assert_equal("/prepare-eu-exit/education", presenter.link)
    end
  end

  describe '#description' do
    it 'should return description for taxon' do
      assert_equal("Includes studying abroad and Erasmus+", presenter.description)
    end
  end
end
