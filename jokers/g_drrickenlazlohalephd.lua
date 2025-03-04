SMODS.Joker {
	key = "drrickenlazlohalephd",
	config = { extra = { chips = 25, mult = 0.5 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.chips, card.ability.extra.mult } }
	end,
	rarity = 1,
	atlas = "svrd_atlas",
	pos = { x = 5, y = 1 },
	cost = 3,
	-- unlocked = true,
	-- discovered = true,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play and not context.other_card.debuff then
			if pseudorandom("drrickenlazlohalephd") < G.GAME.probabilities.normal / 4 then
				return {
					mult = -card.ability.extra.mult,
					card = context.other_card,
				}
			else
				return {
					chips = card.ability.extra.chips,
					card = context.other_card,
				}
			end
		end
	end
}
