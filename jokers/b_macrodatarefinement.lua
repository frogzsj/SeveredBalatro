SMODS.Joker {
	key = "macrodatarefinement",
	config = { extra = { repetitions = 1 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.repetitions } }
	end,
	rarity = 2,
	atlas = "svrd_atlas",
	pos = { x = 6, y = 0 },
	cost = 7,
	-- unlocked = true,
	-- discovered = true,
	calculate = function(self, card, context)
        if context.cardarea == G.play and context.repetition and not context.repetition_only then
			if not context.other_card.debuff and IsHappy(context.other_card:get_id()) then
                return {
                    message = localize("k_again_ex"),
                    repetitions = card.ability.extra.repetitions,
                    card = card,
                }
            end
        end
	end
}
