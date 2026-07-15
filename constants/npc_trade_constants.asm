; npctrade struct members (see data/events/npc_trades.asm)
rsreset
DEF NPCTRADE_DIALOG   rb
DEF NPCTRADE_GIVEMON  rb
DEF NPCTRADE_GETMON   rb
DEF NPCTRADE_NICKNAME rb MON_NAME_LENGTH
DEF NPCTRADE_DVS      rw
DEF NPCTRADE_ITEM     rb
DEF NPCTRADE_OT_ID    rw
DEF NPCTRADE_OT_NAME  rb NAME_LENGTH
DEF NPCTRADE_GENDER   rb
                      rb_skip
DEF NPCTRADE_STRUCT_LENGTH EQU _RS

; NPCTrades indexes (see data/events/npc_trades.asm)
	const_def
	const NPC_TRADE_MIKE   ; 0
	const NPC_TRADE_KYLE   ; 1
	const NPC_TRADE_TIM    ; 2
	const NPC_TRADE_EMY    ; 3
	const NPC_TRADE_CHRIS  ; 4
	const NPC_TRADE_KIM    ; 5
	const NPC_TRADE_FOREST ; 6
	const NPC_TRADE_MARCEL   ; 7 ; Gen 1 Route 2 Trade House (TRADE_FOR_MARCEL): ABRA -> MR_MIME
	const NPC_TRADE_DUX      ; 8 ; Gen 1 Vermilion Trade House (TRADE_FOR_DUX): SPEAROW -> FARFETCH'D
	const NPC_TRADE_DORIS    ; 9 ; Gen 1 Cinnabar Lab Trade Room (TRADE_FOR_DORIS): RAICHU -> ELECTRODE
	const NPC_TRADE_CRINKLES ; 10 ; Gen 1 Cinnabar Lab Trade Room (TRADE_FOR_CRINKLES): VENONAT -> TANGELA
	const NPC_TRADE_SAILOR   ; 11 ; Gen 1 Cinnabar Lab Fossil Room (TRADE_FOR_SAILOR): PONYTA -> SEEL
DEF NUM_NPC_TRADES EQU const_value

; trade gender limits
	const_def
	const TRADE_GENDER_EITHER
	const TRADE_GENDER_MALE
	const TRADE_GENDER_FEMALE

; TradeTexts indexes (see engine/events/npc_trade.asm)

; trade dialogs
	const_def
	const TRADE_DIALOG_INTRO
	const TRADE_DIALOG_CANCEL
	const TRADE_DIALOG_WRONG
	const TRADE_DIALOG_COMPLETE
	const TRADE_DIALOG_AFTER
DEF NUM_TRADE_DIALOGS EQU const_value

; trade dialog sets
	const_def
	const TRADE_DIALOGSET_COLLECTOR
	const TRADE_DIALOGSET_HAPPY
	const TRADE_DIALOGSET_NEWBIE
	const TRADE_DIALOGSET_GIRL
DEF NUM_TRADE_DIALOGSETS EQU const_value
