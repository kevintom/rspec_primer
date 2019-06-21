require_relative '../black_jack'

describe BlackJack do
  
 context 'new black jack game' do 
   it 'should start with a new deck' do
     expect(BlackJack.new.deck.count).to eq 52
   end
 end
 
 describe '#draw_card' do
   it 'should populate your hand with a card' do
     black_jack = BlackJack.new
     expect(black_jack.hand.count).to eq 0
     black_jack.draw_card
     expect(black_jack.hand.count).to eq 1
   end
 end
 
 describe "#value" do
   let(:black_jack) { BlackJack.new }
   context "with a number card" do
     it "returns the same value as the card" do
       expect(black_jack.value(5)).to eq 5
       expect(black_jack.value(10)).to eq 10
     end
   end
   context "with a non-number card" do
     it "returns 10" do
       expect(black_jack.value("J")).to eq 10
       expect(black_jack.value("Q")).to eq 10
     end
   end
   context "with an Ace card" do
     it "returns 11" do
       expect(black_jack.value("A")).to eq 11
     end
   end
 end
 
 describe "#reset_hand" do
   it "should empty your hand" do
     black_jack = BlackJack.new
     black_jack.draw_card
     black_jack.draw_card
     expect(black_jack.hand.count).to eq 2
     expect(black_jack.deck.count).to eq 50
     black_jack.reset_hand
     expect(black_jack.deck.count).to eq 52
     expect(black_jack.hand.count).to eq 0
   end
 end
end
