SMODS.Joker {
	key = "hellyr",
	config = { extra = {
		chips = 500,
		chip_mod = 125,
		is_mdr_member = true,
	}},
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.chips, card.ability.extra.chip_mod } }
	end,
	eternal_compat = false,
	rarity = 2,
	atlas = "svrd_atlas",
	pos = { x = 1, y = 1 },
	cost = 7,
	-- unlocked = true,
	-- discovered = true,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				chip_mod = card.ability.extra.chips,
				message = localize({ type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips } }),
				colour = G.C.CHIPS,
			}
		elseif 
			context.end_of_round 
			and context.game_over == false
			and not context.blueprint
			and not context.individual
			and not context.repetition
			and not context.retrigger_joker
		then
			card.ability.extra.chips = card.ability.extra.chips - card.ability.extra.chip_mod
			return {
				message = localize({ type = "variable", key = "svrd_minus_chips", vars = { card.ability.extra.chip_mod } }),
				colour = G.C.CHIPS,
			}
		end
	end
}
