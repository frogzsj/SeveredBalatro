SMODS.Joker {
	key = "exportshall",
	config = { extra = { odds = 2 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { ""..(G.GAME and G.GAME.probabilities.normal or 1), card.ability.extra.odds } }
	end,
	rarity = 2,
	atlas = "svrd_atlas",
	pos = { x = 5, y = 3 },
	cost = 5,
	-- unlocked = true,
	-- discovered = true,
	blueprint_compat = false,
	calculate = function(self, card, context)
        if context.before then
            card.ability.extra.card_to_destroy = context.full_hand[#context.full_hand]
        elseif context.destroying_card and not context.blueprint then
            if context.destroying_card == card.ability.extra.card_to_destroy then
                return {
                    extra = { juice_card = card },
					message = localize("svrd_destroyed"),
					colour = G.C.MULT,
                    remove = true,
                }
            end
        end
    end
}
