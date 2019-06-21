require_relative '../interest_calculator'
require 'timecop'

describe InterestCalculator do
  subject { InterestCalculator.new(term: 12, principal: 10000, rate: 1.0) }

  describe "#prepaid_interest" do
    context "with no days before the next month" do
      it "should return zero" do
        allow(subject).to receive(:num_days).and_return(0)
        expect(subject.prepaid_interest).to eq 0
      end
    end
  end
  
  describe "#num_days" do
    context "with no days before the next month" do
      it "should return zero" do
        Timecop.freeze(Date.new(2019, 3, 1)) do
          expect(subject.num_days).to eq 0
        end
      end
    end

    context "with 2 days before the next month" do
      it "should return 2" do
        Timecop.freeze(Date.new(2019, 3, 30)) do
          expect(subject.num_days).to eq 2
        end
      end
    end    
  end

  describe "#next_month" do
    context "with a given date" do
      it "return the next month" do
        # verify edge case for new year
        expect(subject.next_month(from_date: Date.new(2018, 5,24))).to eq Date.new(2018,6,1)
      end
    end
    context "at the end of the year" do
      it "return the next month in new year" do
        expect(subject.next_month(from_date: Date.new(2018, 12,24))).to eq Date.new(2019,1,1)
      end
    end
  end
end
