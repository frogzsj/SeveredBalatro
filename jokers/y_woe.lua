SMODS.Joker {
	key = "woe",
	config = { extra = { xchips = 1.5 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.xchips } }
	end,
	rarity = "svrd_temper",
	atlas = "svrd_atlas",
	pos = { x = 2, y = 4 },
	cost = 8,
	-- unlocked = true,
	-- discovered = true,
	calculate = function(self, card, context)
		if context.individual and not context.other_card.debuff then
			if context.cardarea == G.play and context.other_card:is_suit("Clubs") then
				return {
					message = localize({ type = "variable", key = "svrd_mult", vars = { card.ability.extra.xchips } }),
					colour = G.C.CHIPS,
					card = context.other_card,
					Xchip_mod = card.ability.extra.xchips,
				}
			end
		end
	end
}
