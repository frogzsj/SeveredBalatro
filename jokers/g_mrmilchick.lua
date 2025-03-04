SMODS.Joker {
	key = "mrmilchick",
	config = { extra = { consumables = 2 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.consumables } }
	end,
	rarity = 2,
	atlas = "svrd_atlas",
	pos = { x = 4, y = 1 },
	cost = 6,
	-- unlocked = true,
	-- discovered = true,
	calculate = function(self, card, context)
		local card_ix = GetIndex(G.jokers.cards, card)
		if
			context.setting_blind
			and not (context.blueprint_card or self).getting_sliced
			and card_ix
			and G.jokers.cards[card_ix + 1]
			and not G.jokers.cards[card_ix + 1].ability.eternal
			and not G.jokers.cards[card_ix + 1].getting_sliced
		then
			local d_card = G.jokers.cards[card_ix + 1]
			d_card.getting_sliced = true
			G.GAME.joker_buffer = G.GAME.joker_buffer - 1
			G.E_MANAGER:add_event(Event({
				func = function()
					G.GAME.joker_buffer = 0
					card:juice_up(0.3, 0.4)
					card_eval_status_text(card, "extra", nil, nil, nil, {
						message = localize("svrd_grow"),
						colour = HEX("163f38"),
						no_juice = true,
					})
					d_card:start_dissolve({ HEX("163f38") }, nil, 1.6)
					play_sound("slice1", 0.96 + math.random() * 0.08)

					local empty_slots = G.consumeables.config.card_limit - #G.consumeables.cards
					local consumables_to_add = math.min(card.ability.extra.consumables, empty_slots)
					while consumables_to_add > 0 do
						play_sound("timpani")
						local forced_key = get_random_consumables("mrmilchick", 2)
						local _card = create_card("Consumeables", G.consumables, nil, nil, nil, nil, forced_key.config.center_key, "blessing")
						_card:add_to_deck()
						G.consumeables:emplace(_card)
						card:juice_up(0.3, 0.4)
						consumables_to_add = consumables_to_add - 1
					end

					return true
				end,
			}))

			return nil, true
		end
	end
}

-- From cryptid
function center_no(center, m, key, no_no)
	if no_no then
		return center[m] or (G.GAME and G.GAME[m] and G.GAME[m][key]) or false
	end
	return center_no(center, "no_"..m, key, true)
end

	function get_random_consumables(seed, amount)
    -- set up excluded flags - these are the kinds of consumables we DON"T want to have generating
	excluded_flags = excluded_flags or { "hidden", "no_doe", "no_grc" }
	local selection = "n/a"
	local passes = 0
	local tries = 500
	while true do
		tries = tries - 1
		passes = 0
        -- create a random consumable naively
		local key = pseudorandom_element(pool or G.P_CENTER_POOLS.Consumeables, pseudoseed(seed or "grc")).key
		selection = G.P_CENTERS[key]
        -- check if it is valid
		if selection.discovered or not no_undiscovered then
			for k, v in pairs(excluded_flags) do
				if not center_no(selection, v, key, true) then
					--Makes the consumable invalid if it"s a specific card unless it"s set to 
					--I use this so cards don"t create copies of themselves (eg potential inf Blessing chain, Hammerspace from Hammerspace...)
					if not banned_card or (banned_card and banned_card ~= key) then
						passes = passes + 1
					end
				end
			end
		end
        -- use it if it"s valid or we"ve run out of attempts
		if passes >= #excluded_flags or tries <= 0 then
			if tries <= 0 and no_undiscovered then
				return G.P_CENTERS["c_strength"]
			else
				return selection
			end
		end
	end
end

