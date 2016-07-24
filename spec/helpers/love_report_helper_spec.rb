require 'rails_helper'
#Entry.record_timestamps = false

# Specs in this file have access to a helper object that includes
# the InvitePartnerHelper. For example:
#
# describe InvitePartnerHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe LoveReportHelper, type: :helper do
  describe 'averages' do
    context 'this week' do
      subject(:profile) { FactoryGirl.create(:profile, :with_partner_entries) }

      it 'calculates an average' do
        expect(average_rating(subject)).to eql 3
      end

      it 'handles entries with nil rating' do
        subject.partners_entries.last.update(:rating => nil)
        expect(average_rating(subject)).to eql 3
      end
    end

    context 'last week' do
      subject(:profile) { FactoryGirl.create(:profile, :with_partner_entries_last_week) }

      it 'calculates an average' do
        expect(last_weeks_average_rating(subject)).to eql 2
      end
    end
  end
end
