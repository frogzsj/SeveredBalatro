SMODS.Joker {
	key = "dread",
	config = { extra = { gold = 2 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult } }
	end,
	rarity = "svrd_temper",
	atlas = "svrd_atlas",
	pos = { x = 4, y = 4 },
	cost = 8,
	-- unlocked = true,
	-- discovered = true,
	calculate = function(self, card, context)
		if context.individual and not context.other_card.debuff then
			if context.cardarea == G.play and context.other_card:is_suit("Hearts") then
				return {
					colour = G.C.MONEY,
					card = context.other_card,
					dollars = card.ability.extra.gold,
				}
			end
		end
	end
}
