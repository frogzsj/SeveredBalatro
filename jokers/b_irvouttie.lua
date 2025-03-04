SMODS.Joker {
	key = "outtieirv",
	config = { extra = { odds = 3 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { ""..(G.GAME and G.GAME.probabilities.normal or 1), card.ability.extra.odds } }
	end,
	rarity = 2,
	atlas = "svrd_atlas",
	pos = { x = 2, y = 0 },
	cost = 6,
	-- unlocked = true,
	-- discovered = true,
	calculate = function(self, card, context)
		if context.end_of_round and not context.repetition and context.game_over == false and not context.blueprint then
			if pseudorandom("outtieirv") < G.GAME.probabilities.normal / card.ability.extra.odds then
				G.E_MANAGER:add_event(Event({
					func = function()
						local _ace = Card(
							G.play.T.x + G.play.T.w/2,
							G.play.T.y, G.CARD_W,
							G.CARD_H,
							G.P_CARDS["S_A"],
							G.P_CENTERS.m_svrd_goo,
							{playing_card = G.playing_card}
						)
						card:juice_up(0.3, 0.4)
						_ace:add_to_deck()
						G.deck.config.card_limit = G.deck.config.card_limit + 1
						G.deck:emplace(_ace)
						table.insert(G.playing_cards, _ace)
						playing_card_joker_effects({ true })
						card_eval_status_text(card, "extra", nil, nil, nil, {
							message = localize("svrd_ace_spades"),
							colour = G.C.BLACK,
							instant = true,
						})
						_ace:start_materialize()
						return true
					end
				}))
			else
				return {
					message = localize("k_nope_ex"),
					colour = G.C.MULT,
				}
			end
		end
	end
}
