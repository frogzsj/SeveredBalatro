SMODS.Joker {
	key = "perpetuitywing",
	config = { extra = { mult = 4 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult } }
	end,
	rarity = 3,
	atlas = "svrd_atlas",
	pos = { x = 2, y = 1 },
	cost = 9,
	-- unlocked = true,
	-- discovered = true,
	blueprint_compat = false,
    calculate = function(self, card, context)
		if card.debuff then return true end
        if context.cards_destroyed and not context.blueprint then
            for i, val in ipairs(context.glass_shattered) do
				CopyCardToDeck(val, card, G)	
            end
			return true
        elseif context.remove_playing_cards and not context.blueprint then
            for i, val in ipairs(context.removed) do
				CopyCardToDeck(val, card, G)
            end
			return true
        end
    end
}

function CopyCardToDeck(c, svrd_joker, _g)
	_g.E_MANAGER:add_event(Event({
		func = function()
			_g.playing_card = (_g.playing_card and _g.playing_card + 1) or 1
			local _card = copy_card(c, nil, nil, _g.playing_card)
			_card:add_to_deck()
			_g.deck.config.card_limit = _g.deck.config.card_limit + 1
			_g.deck:emplace(_card)
			table.insert(_g.playing_cards, _card)
			playing_card_joker_effects({ true })
			card_eval_status_text(svrd_joker, "extra", nil, nil, nil, {
				message = localize("k_copied_ex"),
				colour = _g.C.FILTER,
				instant = true,
			})
			_card:start_materialize()
			delay(0.5)
			return true
		end
	}))
end
