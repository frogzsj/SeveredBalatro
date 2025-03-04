SMODS.Joker {
	key = "opticsanddesign",
	config = { extra = { jokers = {
		"j_castle", "j_campfire", "j_obelisk", "j_shortcut",
		"j_splash", "j_supernova", "j_dusk", "j_mystic_summit",
	}}},
	loc_vars = function(self, info_queue, card)
		return { vars = { } }
	end,
	rarity = 2,
	atlas = "svrd_atlas",
	pos = { x = 6, y = 3 },
	cost = 5,
	-- unlocked = true,
	-- discovered = true,
	calculate = function(self, card, context)
		if context.ending_shop and not card.debuff then
			G.GAME.joker_buffer = G.GAME.joker_buffer + 1
			local jkr = pseudorandom_element(card.ability.extra.jokers, pseudoseed('opticsanddesign'))
			G.E_MANAGER:add_event(Event({
				func = function() 
					local card = create_card('Joker', G.jokers, nil, 0, nil, nil, jkr)
					card:add_to_deck()
					G.jokers:emplace(card)
					card:start_materialize()
					G.GAME.joker_buffer = 0
					return true
				end
			}))
			card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {
				message = localize("k_plus_joker"),
				colour = HEX("163f38"),
			})
		end
	end
}
