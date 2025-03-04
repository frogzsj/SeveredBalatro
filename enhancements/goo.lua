SMODS.Enhancement({
    key = "goo",
    atlas = "svrd_atlas",
    pos = {x = 5, y = 5},
    discovered = true,
    config = {
        bonus = 5,
        steps = 5,
    },
    set_card_type_badge = function(self, card, badges)
        badges[#badges+1] = create_badge(
            localize('svrd_goo_name'),
            G.C.BLACK,
            G.C.WHITE,
            1.2
        )
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        if specific_vars and specific_vars.nominal_chips and not self.replace_base_card then
            localize { type = 'other', key = 'card_chips', nodes = desc_nodes, vars = { specific_vars.nominal_chips } }
        end
        SMODS.Enhancement.super.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card and card.ability.bonus or self.config.bonus,
                card and card.ability.steps or self.config.steps,
            }
        }
    end,
    calculate = function(self, card, context, effect)
        if context.before and context.cardarea == G.play and not context.repetition then
            local bonus = math.floor(card.ability.bonus / card.ability.steps)

            card.ability.bonus = card.ability.bonus + bonus
            card.ability.goo_updated = true

            card_eval_status_text(card, "extra", nil, nil, nil, {
                message = localize({
                    type = "variable",
                    key = "svrd_chip_gain",
                    vars = { bonus }
                }),
                colour = G.C.CHIPS,
            })

            delay(0.8)
       end
    end
})

function dump(o)
    if type(o) == 'table' then
       local s = '{ '
       for k,v in pairs(o) do
          if type(k) ~= 'number' then k = '"'..k..'"' end
          s = s .. '['..k..'] = ' .. dump(v) .. ','
       end
       return s .. '} '
    else
       return tostring(o)
    end
 end
