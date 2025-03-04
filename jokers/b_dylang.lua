SMODS.Joker {
	key = "dylang",
	config = { extra = {
		x_chips = 1.2,
		is_mdr_member = true,
	}},
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.x_chips } }
	end,
	rarity = 3,
	atlas = "svrd_atlas",
	pos = { x = 3, y = 3 },
	cost = 8,
	-- unlocked = true,
	-- discovered = true,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play
			and not context.other_card.debuff and IsScary(context.other_card:get_id()) then
				return {
					message = localize({ type = "variable", key = "svrd_mult", vars = { card.ability.extra.x_chips } }),
					colour = G.C.CHIPS,
					card = context.other_card,
					Xchip_mod = card.ability.extra.x_chips,
				}
		end
	end
}
