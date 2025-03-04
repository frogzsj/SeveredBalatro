SMODS.Consumable({
	set = "Tarot",
	key = "blackpaint", 
    atlas = "svrd_atlas",
	pos = { x = 4, y = 5 },
	config = { mod_conv = "m_svrd_goo", max_highlighted = 2 },
	discovered = true,
	loc_vars = function(self, info_queue)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_svrd_goo
		return { vars = { self.config.max_highlighted } }
	end,
})
