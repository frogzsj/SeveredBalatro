SVRD = {}

SMODS.Atlas {
  key = "svrd_atlas",
  path = "svrdAtlas.png",
  px = 71,
  py = 95,
}

SMODS.Joker {
	key = 'defiantjazz',
	config = { extra = { } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult } }
	end,
	rarity = 2,
	atlas = 'svrd_atlas',
	pos = { x = 0, y = 0 },
	cost = 4,
	unlocked = true,
	discovered = true,
	calculate = function(self, card, context)
		if context.cardarea == G.jokers and context.before then 
			local text,_ = context.scoring_name
			local hand_to_upgrade = pick_random_hand(text, 'defiantjazz', nil)
			card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_level_up_ex')})
			update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname=localize(hand_to_upgrade, 'poker_hands'),chips = G.GAME.hands[hand_to_upgrade].chips, mult = G.GAME.hands[hand_to_upgrade].mult, level=G.GAME.hands[hand_to_upgrade].level})
			level_up_hand(nil, hand_to_upgrade, nil, 1)
		end
	end
}

SMODS.Joker {
	key = 'retirementparty',
	config = { extra = { mult = 4 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult } }
	end,
	rarity = 2,
	atlas = 'svrd_atlas',
	pos = { x = 1, y = 0 },
	cost = 6,
	unlocked = true,
	discovered = true,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				mult_mod = card.ability.extra.mult,
				message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
			}
		end
	end
}

SMODS.Joker {
	key = 'outtieirv',
	config = { extra = { odds = 3 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { ''..(G.GAME and G.GAME.probabilities.normal or 1), card.ability.extra.odds } }
	end,
	rarity = 2,
	atlas = 'svrd_atlas',
	pos = { x = 2, y = 0 },
	cost = 5,
	unlocked = true,
	discovered = true,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				mult_mod = card.ability.extra.mult,
				message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
			}
		end
	end
}

-- SMODS.Joker {
-- 	key = 'innieirv',
-- 	loc_txt = {
-- 		name = 'Innie Irv',
-- 		text = {
-- 			"???"
-- 		}
-- 	},
-- 	config = { extra = { mult = 4 } },
-- 	loc_vars = function(self, info_queue, card)
-- 		return { vars = { card.ability.extra.mult } }
-- 	end,
-- 	rarity = 1,
-- 	atlas = 'svrd_atlas',
-- 	pos = { x = 3, y = 0 },
-- 	cost = 2,
-- 	unlocked = true,
-- 	discovered = true,
-- 	calculate = function(self, card, context)
-- 		if context.joker_main then
-- 			return {
-- 				mult_mod = card.ability.extra.mult,
-- 				message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
-- 			}
-- 		end
-- 	end
-- }

SMODS.Joker {
	key = 'kier',
	config = { extra = { retriggers = 1 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.retriggers } }
	end,
	rarity = 3,
	atlas = 'svrd_atlas',
	pos = { x = 4, y = 0 },
	cost = 10,
	unlocked = true,
	discovered = true,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				mult_mod = card.ability.extra.mult,
				message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
			}
		end
	end
}

SMODS.Joker {
	key = 'dieter',
	config = { extra = { mult = 4 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult } }
	end,
	rarity = 2,
	atlas = 'svrd_atlas',
	pos = { x = 5, y = 0 },
	cost = 5,
	unlocked = true,
	discovered = true,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				mult_mod = card.ability.extra.mult,
				message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
			}
		end
	end,
	in_pool = function() end
}

SMODS.Joker {
	key = 'macrodatarefinement',
	config = { extra = { chip_mult = 1.2 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.chip_mult } }
	end,
	rarity = 3,
	atlas = 'svrd_atlas',
	pos = { x = 6, y = 0 },
	cost = 8,
	unlocked = true,
	discovered = true,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				mult_mod = card.ability.extra.mult,
				message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
			}
		end
	end
}

SMODS.Joker {
	key = 'fingertrap',
	config = { extra = { mult = 4 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult } }
	end,
	rarity = 3,
	atlas = 'svrd_atlas',
	pos = { x = 0, y = 1 },
	cost = 8,
	unlocked = true,
	discovered = true,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				mult_mod = card.ability.extra.mult,
				message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
			}
		end
	end
}

-- SMODS.Joker {
-- 	key = 'hellyr',
-- 	loc_txt = {
-- 		name = 'Helly R.',
-- 		text = {
-- 			"????"
-- 		}
-- 	},
-- 	config = { extra = { mult = 4 } },
-- 	loc_vars = function(self, info_queue, card)
-- 		return { vars = { card.ability.extra.mult } }
-- 	end,
-- 	rarity = 1,
-- 	atlas = 'svrd_atlas',
-- 	pos = { x = 1, y = 1 },
-- 	cost = 2,
-- 	unlocked = true,
-- 	discovered = true,
-- 	calculate = function(self, card, context)
-- 		if context.joker_main then
-- 			return {
-- 				mult_mod = card.ability.extra.mult,
-- 				message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
-- 			}
-- 		end
-- 	end
-- }

SMODS.Joker {
	key = 'lumonindustries',
	config = { extra = { mult = 4 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult } }
	end,
	rarity = 1,
	atlas = 'svrd_atlas',
	pos = { x = 2, y = 1 },
	cost = 2,
	unlocked = true,
	discovered = true,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				mult_mod = card.ability.extra.mult,
				message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
			}
		end
	end
}

SMODS.Joker {
	key = 'petey',
	config = { extra = { odds = 2 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { ''..(G.GAME and G.GAME.probabilities.normal or 1), card.ability.extra.odds } }
	end,
	rarity = 2,
	atlas = 'svrd_atlas',
	pos = { x = 3, y = 1 },
	cost = 4,
	unlocked = true,
	discovered = true,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				mult_mod = card.ability.extra.mult,
				message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
			}
		end
	end
}

-- SMODS.Joker {
-- 	key = 'mrmilchick',
-- 	loc_txt = {
-- 		name = 'Mr. Milchick',
-- 		text = {
-- 			"???"
-- 		}
-- 	},
-- 	config = { extra = { mult = 4 } },
-- 	loc_vars = function(self, info_queue, card)
-- 		return { vars = { card.ability.extra.mult } }
-- 	end,
-- 	rarity = 1,
-- 	atlas = 'svrd_atlas',
-- 	pos = { x = 4, y = 1 },
-- 	cost = 2,
-- 	unlocked = true,
-- 	discovered = true,
-- 	calculate = function(self, card, context)
-- 		if context.joker_main then
-- 			return {
-- 				mult_mod = card.ability.extra.mult,
-- 				message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
-- 			}
-- 		end
-- 	end
-- }

SMODS.Joker {
	key = 'drrickenlazlohalephd',
	config = { extra = { mult = 4 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult } }
	end,
	rarity = 1,
	atlas = 'svrd_atlas',
	pos = { x = 5, y = 1 },
	cost = 2,
	unlocked = true,
	discovered = true,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				mult_mod = card.ability.extra.mult,
				message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
			}
		end
	end
}

SMODS.Joker {
	key = 'wellnesssession',
	config = { extra = { mult = 4 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult } }
	end,
	rarity = 1,
	atlas = 'svrd_atlas',
	pos = { x = 6, y = 1 },
	cost = 2,
	unlocked = true,
	discovered = true,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				mult_mod = card.ability.extra.mult,
				message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
			}
		end
	end
}

SMODS.Joker {
	key = 'cleanslate',
	config = { extra = { mult = 4 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult } }
	end,
	rarity = 1,
	atlas = 'svrd_atlas',
	pos = { x = 0, y = 2 },
	cost = 2,
	unlocked = true,
	discovered = true,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				mult_mod = card.ability.extra.mult,
				message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
			}
		end
	end
}

SMODS.Joker {
	key = 'glasglowblock',
	config = { extra = { mult = 4 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult } }
	end,
	rarity = 1,
	atlas = 'svrd_atlas',
	pos = { x = 1, y = 2 },
	cost = 2,
	unlocked = true,
	discovered = true,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				mult_mod = card.ability.extra.mult,
				message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
			}
		end
	end
}

SMODS.Joker {
	key = 'overtimecontingency',
	config = { extra = { mult = 4 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult } }
	end,
	rarity = 1,
	atlas = 'svrd_atlas',
	pos = { x = 2, y = 2 },
	cost = 2,
	unlocked = true,
	discovered = true,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				mult_mod = card.ability.extra.mult,
				message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
			}
		end
	end
}

SMODS.Joker {
	key = 'ortbotwin',
	config = { extra = { mult = 4 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult } }
	end,
	rarity = 1,
	atlas = 'svrd_atlas',
	pos = { x = 3, y = 2 },
	cost = 2,
	unlocked = true,
	discovered = true,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				mult_mod = card.ability.extra.mult,
				message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
			}
		end
	end
}

SMODS.Joker {
	key = 'regabhi',
	config = { extra = { odds = 4 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { ''..(G.GAME and G.GAME.probabilities.normal or 1), card.ability.extra.odds } }
	end,
	rarity = 1,
	atlas = 'svrd_atlas',
	pos = { x = 4, y = 2 },
	cost = 2,
	unlocked = true,
	discovered = true,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				mult_mod = card.ability.extra.mult,
				message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
			}
		end
	end
}

SMODS.Joker {
	key = 'svrdfloor',
	config = { extra = { xmult = 1, xmult_gain = 0.1 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.xmult_gain, card.ability.extra.xmult } }
	end,
	rarity = 1,
	atlas = 'svrd_atlas',
	pos = { x = 5, y = 2 },
	cost = 2,
	unlocked = true,
	discovered = true,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				mult_mod = card.ability.extra.mult,
				message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
			}
		end
	end
}

---------------------------------------------
--- Helper Functions
---------------------------------------------

-- From Cryptid mod neutron star
function pick_random_hand(ignore, seed, allowhidden)
	local chosen_hand
	ignore = ignore or {}
	seed = seed or "randomhand"
	if type(ignore) ~= "table" then
		ignore = { ignore }
	end
	while true do
		chosen_hand = pseudorandom_element(G.handlist, pseudoseed(seed))
		if G.GAME.hands[chosen_hand].visible or allowhidden then
			local safe = true
			for _, v in pairs(ignore) do
				if v == chosen_hand then
					safe = false
				end
			end
			if safe then
				break
			end
		end
	end
	return chosen_hand
end
