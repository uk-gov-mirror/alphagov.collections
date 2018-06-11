require 'test_helper'

module Api
  describe OrganisationPresenter do
    include OrganisationsHelpers

    describe '#present' do
      context 'when an organisation payload from content-store payload is passed on' do
        it 'presents the organisation as it used to in the whitehall app' do
          presented_organisation = Api::OrganisationPresenter.new(
            content_store_ministerial_department_fixture
          ).present

          assert_equal presented_organisation, expected_whitehall_organisation
        end
      end
    end
  end
end
