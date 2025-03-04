SMODS.Joker {
	key = "svrdfloor",
	config = { extra = { xmult = 1, xmult_gain = 0.1 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.xmult_gain, card.ability.extra.xmult } }
	end,
	rarity = 2,
	atlas = "svrd_atlas",
	pos = { x = 5, y = 2 },
	cost = 6,
	-- unlocked = true,
	-- discovered = true,
    calculate = function(self, card, context)
        if context.cards_destroyed then
			if not context.blueprint and #context.glass_shattered > 0 then
				UpgradeSvrdFloor(card, #context.glass_shattered)
			end
        elseif context.remove_playing_cards then
			if not context.blueprint and #context.removed > 0 then
				UpgradeSvrdFloor(card, #context.removed)
			end
        elseif context.cardarea == G.jokers and context.joker_main then
            return {
				colour = G.C.MULT,
                message = localize({
					type="variable",
					key="a_xmult",
					vars={card.ability.extra.xmult},
				}),
                Xmult_mod = card.ability.extra.xmult,
            }
        end
    end
}

function UpgradeSvrdFloor(card, upgrades)
	card.ability.extra.xmult = card.ability.extra.xmult + upgrades * card.ability.extra.xmult_gain
	delay(0.2)
	card_eval_status_text(card, "extra", nil, nil, nil, {
		message = localize({
			type="variable",
			key="svrd_xmult_gain",
			vars={upgrades * card.ability.extra.xmult_gain},
		}),
		colour = G.C.MULT,
	})
	delay(0.5)
end
