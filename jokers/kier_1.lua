SMODS.Joker {
	key = "kier",
	config = { extra = 1 },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra } }
	end,
	rarity = 3,
	atlas = "svrd_atlas",
	pos = { x = 4, y = 0 },
	cost = 10,
	-- unlocked = true,
	-- discovered = true,
	calculate = function(self, card, context)
		if context.retrigger_joker_check and not context.retrigger_joker and not context.other_joker ~= self then
			local k_or_d = _.includes({"j_svrd_kier", "j_svrd_dieter"}, context.other_card.config.center.key)
			if k_or_d then return nil, true end
			if G.jokers.cards[#G.jokers.cards] == context.other_card and not context.other_card.debuff then
				return {
					message = localize("k_again_ex"),
					repetitions = card.ability.extra,
					card = context.other_card,
				}
			end
			return nil,true
		end
	end
}
