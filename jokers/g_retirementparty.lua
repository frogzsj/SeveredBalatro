SMODS.Joker {
	key = "retirementparty",
	config = { extra = { } },
	loc_vars = function(self, info_queue, card)
		return { vars = { } }
	end,
	rarity = 3,
	atlas = "svrd_atlas",
	pos = { x = 1, y = 0 },
	cost = 12,
	-- unlocked = true,
	-- discovered = true,
	add_to_deck = function(self, card, from_debuff)
		G.E_MANAGER:add_event(Event({
			func = function()
				G.GAME.svrd_shop_joker_price_modifier = G.GAME.svrd_shop_joker_price_modifier * 2
				for k, v in pairs(G.I.CARD) do
					if v.set_cost then
						v:set_cost()
					end
				end
				return true
			end,
		}))
	end,
	remove_from_deck = function(self, card, from_debuff)
		G.E_MANAGER:add_event(Event({
			func = function()
				G.GAME.svrd_shop_joker_price_modifier = G.GAME.svrd_shop_joker_price_modifier / 2
				for k, v in pairs(G.I.CARD) do
					if v.set_cost then
						v:set_cost()
					end
				end
				return true
			end,
		}))
	end,
}

local CardDissolve = Card.start_dissolve
function Card:start_dissolve(dissolve_colours, silent, dissolve_time_fac, no_juice, from_exports_hall)
  local retirementparty = SMODS.find_card("j_svrd_retirementparty")
	if next(retirementparty) and self.ability.set == "Joker" and self.config.center_key ~= "j_svrd_retirementparty" then
		G.GAME.banned_keys[self.config.center_key] = true
	end

	return CardDissolve(self)
end
