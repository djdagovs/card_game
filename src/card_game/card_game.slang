div.fixed-stats data-item=::CardGame.master_observer.dom_id
  == ::CardGame.master_observer.content
div data-item=dom_id data-subscribe=""
  div#hand
    - hand.each_with_index do |card,idx|
      span.card-holder
        img.card src=card_image(card) data-item="#{dom_id}-card-#{idx}" data-event-attributes="src" data-events="click"
  div#chat-room
    == chat_room.content
  div#stats
    span.game-name = "game: #{name}"
    span.cards-remaining
      | Cards Remaining in deck: 
      - # workaround: Slang can't handle quotes in dom_id(""), so use dom_id(%{})
      span data-item="#{dom_id(%[cards-remaining])}"
        = deck.size
h3 GameObserver (events from server's perspective)
div.observed-events
  div.connected-event
    span.header.direction In/Out
    span.header.user User 
    span.header.sender WebObject
    span.header.dom_item DOM Target
    span.header.action Action
div.observed-events data-item=game_observer.dom_id data-subscribe="" data-maxChildren=game_observer.max_items
  == game_observer.content
