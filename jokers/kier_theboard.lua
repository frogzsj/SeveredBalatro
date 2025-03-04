SMODS.Joker {
	key = "theboard",
	config = { extra = { xmult = 1.25, xchips = 1.5, gold = 2 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.xmult, card.ability.extra.xchips, card.ability.extra.gold } }
	end,
	rarity = 2,
	atlas = "svrd_atlas",
	pos = { x = 1, y = 3 },
	cost = 7,
	-- unlocked = true,
	-- discovered = true,
	calculate = function(self, card, context)
		if context.individual and not context.other_card.debuff then
			if context.cardarea == G.play and context.other_card:is_face() then
				return pseudorandom_element({
					{
						message = localize({ type = "variable", key = "svrd_mult", vars = { card.ability.extra.xchips } }),
						colour = G.C.CHIPS,
						Xchip_mod = card.ability.extra.xchips,
						card = context.other_card,
					},
					{
						message = localize({ type = "variable", key = "svrd_mult", vars = { card.ability.extra.xmult } }),
						colour = G.C.MULT,
						Xmult_mod = card.ability.extra.xmult,
						card = context.other_card,
					},
					{
						colour = G.C.GOLD,
						dollars = card.ability.extra.gold,
						card = context.other_card,
					}
				}, pseudoseed("theboard"))
			end
		end
	end
}
