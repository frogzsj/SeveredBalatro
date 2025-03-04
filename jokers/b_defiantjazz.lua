SMODS.Joker {
	key = "defiantjazz",
	config = { extra = { } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult } }
	end,
	rarity = 2,
	atlas = "svrd_atlas",
	pos = { x = 0, y = 0 },
	cost = 4,
	-- unlocked = true,
	-- discovered = true,
	calculate = function(self, card, context)
		if context.cardarea == G.jokers and context.before then 
			if context.cardarea == G.jokers and context.before then 
				local text,_ = context.scoring_name
				local hand_to_upgrade = Pick_Random_Hand(text, "defiantjazz", nil)
				update_hand_text({sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3}, {handname=localize(hand_to_upgrade, "poker_hands"),chips = G.GAME.hands[hand_to_upgrade].chips, mult = G.GAME.hands[hand_to_upgrade].mult, level=G.GAME.hands[hand_to_upgrade].level})
				card_eval_status_text(context.blueprint_card or card, "extra", nil, nil, nil, {message = localize("k_level_up_ex")})
				level_up_hand(nil, hand_to_upgrade, nil, 1)
				update_hand_text(
					{ sound = "button", volume = 0.7, pitch = 0.8, delay = 0.5 },
					{
						mult = G.GAME.hands[text].mult,
						chips = G.GAME.hands[text].chips,
						handname = localize(text, "poker_hands"),
						level = G.GAME.hands[text].level,
					}
				)
			end
		end
	end
}

-- From Cryptid mod neutron star
function Pick_Random_Hand(ignore, seed, allowhidden)
	local chosen_hand
	ignore = ignore or {}
	seed = seed or "randomhand"
	if type(ignore) ~= "table" then
		ignore = { ignore }
	end
	while true do
		chosen_hand = pseudorandom_element(G.handlist, pseudoseed(seed))
		if G.GAME.hands[chosen_hand].visible or allowhidden then
			local safe = true
			for i, v in pairs(ignore) do
				if v == chosen_hand then
					safe = false
				end
			end
			if safe then
				break
			end
		end
	end
	return chosen_hand
end
