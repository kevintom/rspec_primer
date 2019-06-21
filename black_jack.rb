class BlackJack
  CARDS = [2, 3, 4, 5, 6, 7, 8, 9, 10, "J", "Q", "K", "A"]

  attr_reader :deck, :hand

  def initialize
    @deck = []
    populate_deck
    @hand = []
  end
  
  def draw_card
    if card = @deck.pop
      @hand << card
    else
      raise "Empty Deck"
    end
  end

  def value(card)
    case card
    when "J", "Q", "K"
      return 10
    when "A"
      return 11
    else
      return card
    end
  end
  
  def total
    @hand.inject(0) do |sum, card|
      sum += value(card)
    end
  end
  
  def win?
    total == 21
  end

  def reset_hand
    @deck += @hand
    @hand = []
    @deck.shuffle!
  end
  
  def populate_deck
    @deck = (CARDS * 4).shuffle!
  end
end