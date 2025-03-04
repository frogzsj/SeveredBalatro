SMODS.Joker {
	key = "mshuang",
	config = { extra = { odds = 3 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { ""..(G.GAME and G.GAME.probabilities.normal or 1), card.ability.extra.odds } }
	end,
	rarity = 2,
	atlas = "svrd_atlas",
	pos = { x = 6, y = 2 },
	cost = 7,
	-- unlocked = true,
	-- discovered = true,
	calculate = function(self, card, context)
		if context.after and not context.individual then
			for i = 1, #G.hand.cards do
				local _c = G.hand.cards[i]
				if _c.base.id > 2 and not _c.debuff
				    and pseudorandom("mshuang") < G.GAME.probabilities.normal / card.ability.extra.odds then
						G.E_MANAGER:add_event(Event({
							func = function()
								card_eval_status_text(card, "extra", nil, nil, nil, {
									message = localize("svrd_mshuang"),
									colour = HEX("ffa3d9"),
									instant = true,
								})
								card:juice_up(0.3, 0.4)
								card_eval_status_text(_c, "extra", nil, nil, nil, {
									message = localize("svrd_mshuang_2"),
									colour = HEX("ffa3d9"),
									instant = true,
								})
								return true
							end,
						}))

						G.E_MANAGER:add_event(Event({
							trigger = "after",
							delay = 0.5,
							func = function()
								_c:flip()
								play_sound("generic1", 0.7, 0.35)
								return true
							end
						}))

						G.E_MANAGER:add_event(Event({
							trigger = "after",
							delay = 0.5,
							func = function()
								local suit_prefix = string.sub(_c.base.suit, 1, 1)..'_'
								local rank_suffix = math.max(_c.base.id - 1, 2)
								if rank_suffix < 10 then rank_suffix = tostring(rank_suffix)
								elseif rank_suffix == 10 then rank_suffix = 'T'
								elseif rank_suffix == 11 then rank_suffix = 'J'
								elseif rank_suffix == 12 then rank_suffix = 'Q'
								elseif rank_suffix == 13 then rank_suffix = 'K'
								elseif rank_suffix == 14 then rank_suffix = 'A'
								end
								_c:set_base(G.P_CARDS[suit_prefix..rank_suffix])
								return true
							end
						}))

						G.E_MANAGER:add_event(Event({
							trigger = "after",
							delay = 0.15,
							func = function()
								_c:flip()
								play_sound("tarot2", 0.85, 0.6)
								_c:juice_up(0.3, 0.4)
								return true
							end
						}))

						delay(0.5)
				end
			end
		end
	end
}
