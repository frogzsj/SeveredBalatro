SMODS.Joker {
	key = "malice",
	config = { extra = { repetitions = 1 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult } }
	end,
	rarity = "svrd_temper",
	atlas = "svrd_atlas",
	pos = { x = 5, y = 4 },
	cost = 7,
	-- unlocked = true,
	-- discovered = true,
	calculate = function(self, card, context)
        if context.cardarea == G.play and
			context.repetition and
			not context.repetition_only and
			not context.other_card.debuff and
			context.other_card:is_suit("Spades")
		then
			return {
				message = localize("k_again_ex"),
				repetitions = card.ability.extra.repetitions,
				card = card,
			}
        end
	end
}
