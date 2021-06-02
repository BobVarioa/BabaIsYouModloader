local Array = module.use("lib.array")

local ast = {
    type = "base",
    rules = Array({
        type = "rule",
        subjects = Array({
            type = "noun",
            name = "baba",
            negated = true,
            conditions = Array({
                type = "prefix",
                name = "idle",
                negated = true
            }, {
                type = "prefix",
                name = "lonely",
                negated = false
            }, {
                type = "infix",
                name = "facing",
                negated = false,
                operands = Array({
                    type = "noun",
                    name = "me",
                    negated = false
                }, {
                    type = "property",
                    name = "up",
                    negated = true
                })
            }, {
                type = "infix",
                name = "on",
                negated = true,
                operands = Array({
                    type = "noun",
                    name = "keke",
                    negated = false
                })
            }, {
                type = "infix",
                name = "feeling",
                negated = false,
                operands = Array({
                    type = "property",
                    name = "push",
                    negated = false
                })
            })
        }),
        actions = Array({
            type = "verb",
            name = "is",
            negated = false,
            operands = Array({
                type = "noun",
                name = "baba",
                negated = true
            }, {
                type = "property",
                name = "you",
                negated = false
            })
        }, {
            type = "verb",
            name = "play",
            negated = false,
            operands = Array({
                type = "letter",
                name = "A"
            }, {
                type = "letter",
                name = "#"
            })
        }, {
            type = "verb",
            name = "follow",
            negated = true,
            operands = Array({
                type = "noun",
                name = "keke",
                negated = false
            })
        })
    })
}

-- not idle and lonely not baba facing me and not up and not on keke and feeling not push is not not not baba and you and play A# and not follow KEKE 

--  negated prefix and prefix negated noun infix noun and negated property and negated infix noun infix negated property is 3x negated noun and property and play LETTER PARAMETERS and negated verb
--[[
    The above Tests :
    negated prefixes
    prefixes
    combination of prefixes and negated prefixes
    infixes 
    multiple infixes -- Like baba facing me and feeling you 
    multiple infix parameters 
    negated infixes 
    combination of infixes and multiple infixes and negated infixes
    nouns
    negated nouns 
    triple negation 
--]]

--[[
    noun1 and noun2 is property =
    noun1 is property
    noun2 is property
--]]

--[[
inital: not idle and lonely not baba facing me and not up and not on keke and feeling not push is not not not baba and you and play A# and not follow KEKE

-- Should remove letters first i.e. KEKE -> keke
-- Note : KEKEISYOU should still turn into keke is you

Blockify =
[ not idle and lonely ] [ not baba ] facing [ me and not up ] and not on [ keke ] and feeling [ not push ] is [ not not not baba and you ] and play [ A# ] and not follow [ keke ]

Assign types =
[ not idle and lonely ]: prefix [ not baba ]: noun facing: infix [ me and not up ]: operand and [not on]: infix [ keke ]: noun and feeling: infix [ not push ]: property is: verb [ not not not baba and you ]: operand and play [ A# ]: operand and not follow: verb [ keke ]: noun

prefix noun infix operand and not infix noun and infix property verb operand and verb operand and not verb property
-- This makes it so we can figure out relationships easier i.e :
[prefix noun] [infix operand and not infix noun and infix property] verb [operand] and verb [operand] and not verb [property]
-- Then :
[conditional noun] operation operand and ...
-- etc.

Seperate into logical operations based off seperations 
    not baba 
        not idle
        lonely
        facing 
            me 
            not up
        not on 
            keke
        feeling
            not push 
    is 
        not not not baba -> not baba (this step normalises the nots )
        you 
    play 
        A#
    not follow 
        keke
--]]