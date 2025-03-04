SMODS.Joker {
	key = "wellnesssession",
	config = { extra = { gold = 1 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.gold } }
	end,
	rarity = 2,
	atlas = "svrd_atlas",
	pos = { x = 6, y = 1 },
	cost = 5,
	-- unlocked = true,
	-- discovered = true,
	calculate = function(self, card, context)
		if context.individual and not context.other_card.debuff then
			if context.cardarea == G.play and IsHappy(context.other_card:get_id()) then
				return {
					colour = G.C.MONEY,
					card = context.other_card,
					dollars = card.ability.extra.gold,
				}
			end
		end
	end
}
