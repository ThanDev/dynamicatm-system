#define 	MAX_ATM_MACHINES 		(50)

// --> ระบบ ATM
new PlayerText:ATMTextDraws[MAX_PLAYERS][20];

enum ATM_DATA {
	atmID,
	atmExists,
	Float:atmPosX,
	Float:atmPosY,
	Float:atmPosZ,
	Float:atmPosA,
	atmInterior,
	atmWorld,
	atmObject,
	Text3D:atmText3D
};
new atmData[MAX_ATM_MACHINES][ATM_DATA];

enum ENTRANCE_DATA {
	entranceID,
	entranceExists,
	entranceName[32],
	entrancePass,
	entranceIcon,
	entranceLocked,
	Float:entrancePosX,
	Float:entrancePosY,
	Float:entrancePosZ,
	Float:entrancePosA,
	Float:entranceIntX,
	Float:entranceIntY,
	Float:entranceIntZ,
	Float:entranceIntA,
	entranceInterior,
	entranceExterior,
	entranceExteriorVW,
	entranceType,
	entranceCustom,
	entranceWorld,
	entrancePickup,
	entranceMapIcon,
	Text3D:entranceText3D,
	entranceExPickup,
	Text3D:entranceExText3D
};
new entranceData[MAX_ENTRANCES][ENTRANCE_DATA];

public OnGameModeInit()
	mysql_tquery(g_SQL, "SELECT * FROM `atm`", "ATM_Load", "");


public OnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid)

	// --> ระบบ ATM

	if (playertextid == ATMTextDraws[playerid][14]) // Deposit
	{
	    HideATM(playerid);
	    Dialog_Show(playerid, DIALOG_DEPOSIT, DIALOG_STYLE_INPUT, "[ฝากเงิน]", "{FFFFFF}ยอดเงินในบัญชี: %s\nกรุณาใส่จำนวนเงินที่คุณต้องการจะฝาก", "ฝาก", "กลับ", FormatMoney(playerData[playerid][pBankMoney]));
	}
	if (playertextid == ATMTextDraws[playerid][16]) // Withdraw
	{
	    HideATM(playerid);
        Dialog_Show(playerid, DIALOG_WITHDRAW, DIALOG_STYLE_INPUT, "[ถอนเงิน]", "{FFFFFF}ยอดเงินในบัญชี: %s\nกรุณาใส่จำนวนเงินที่คุณต้องการจะถอน", "ถอน", "กลับ", FormatMoney(playerData[playerid][pBankMoney]));
	}
	if (playertextid == ATMTextDraws[playerid][18]) // Transfer
	{
	    HideATM(playerid);
        Dialog_Show(playerid, DIALOG_TRANSFER, DIALOG_STYLE_INPUT, "[โอนเงิน]", "{FFFFFF}ยอดเงินในบัญชี: %s\nกรุณาใส่ไอดีหรือชื่อผู้รับเงิน", "โอน", "กลับ", FormatMoney(playerData[playerid][pBankMoney]));
	}
	if (playertextid == ATMTextDraws[playerid][19]) // Transfer
	{
	    HideATM(playerid);
	}

onplayerconnect

	// --> ระบบ ATM

	ATMTextDraws[playerid][0] = CreatePlayerTextDraw(playerid, 321.000000, 143.000000, "_");
	PlayerTextDrawFont(playerid, ATMTextDraws[playerid][0], 1);
	PlayerTextDrawLetterSize(playerid, ATMTextDraws[playerid][0], 0.600000, 22.149923);
	PlayerTextDrawTextSize(playerid, ATMTextDraws[playerid][0], 298.500000, 206.000000);
	PlayerTextDrawSetOutline(playerid, ATMTextDraws[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, ATMTextDraws[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, ATMTextDraws[playerid][0], 2);
	PlayerTextDrawColor(playerid, ATMTextDraws[playerid][0], -1);
	PlayerTextDrawBackgroundColor(playerid, ATMTextDraws[playerid][0], 255);
	PlayerTextDrawBoxColor(playerid, ATMTextDraws[playerid][0], 180);
	PlayerTextDrawUseBox(playerid, ATMTextDraws[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, ATMTextDraws[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, ATMTextDraws[playerid][0], 0);

	ATMTextDraws[playerid][1] = CreatePlayerTextDraw(playerid, 321.000000, 145.000000, "_");
	PlayerTextDrawFont(playerid, ATMTextDraws[playerid][1], 1);
	PlayerTextDrawLetterSize(playerid, ATMTextDraws[playerid][1], 0.600000, 8.649996);
	PlayerTextDrawTextSize(playerid, ATMTextDraws[playerid][1], 298.500000, 203.000000);
	PlayerTextDrawSetOutline(playerid, ATMTextDraws[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, ATMTextDraws[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, ATMTextDraws[playerid][1], 2);
	PlayerTextDrawColor(playerid, ATMTextDraws[playerid][1], -16776961);
	PlayerTextDrawBackgroundColor(playerid, ATMTextDraws[playerid][1], 255);
	PlayerTextDrawBoxColor(playerid, ATMTextDraws[playerid][1], -16777036);
	PlayerTextDrawUseBox(playerid, ATMTextDraws[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, ATMTextDraws[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, ATMTextDraws[playerid][1], 0);

	ATMTextDraws[playerid][2] = CreatePlayerTextDraw(playerid, 321.000000, 228.000000, "_");
	PlayerTextDrawFont(playerid, ATMTextDraws[playerid][2], 1);
	PlayerTextDrawLetterSize(playerid, ATMTextDraws[playerid][2], 0.600000, 12.399999);
	PlayerTextDrawTextSize(playerid, ATMTextDraws[playerid][2], 298.500000, 203.000000);
	PlayerTextDrawSetOutline(playerid, ATMTextDraws[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, ATMTextDraws[playerid][2], 0);
	PlayerTextDrawAlignment(playerid, ATMTextDraws[playerid][2], 2);
	PlayerTextDrawColor(playerid, ATMTextDraws[playerid][2], -16776961);
	PlayerTextDrawBackgroundColor(playerid, ATMTextDraws[playerid][2], 255);
	PlayerTextDrawBoxColor(playerid, ATMTextDraws[playerid][2], -741092582);
	PlayerTextDrawUseBox(playerid, ATMTextDraws[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, ATMTextDraws[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, ATMTextDraws[playerid][2], 0);

	ATMTextDraws[playerid][3] = CreatePlayerTextDraw(playerid, 322.000000, 149.000000, "welcome");
	PlayerTextDrawFont(playerid, ATMTextDraws[playerid][3], 3);
	PlayerTextDrawLetterSize(playerid, ATMTextDraws[playerid][3], 0.420833, 1.650000);
	PlayerTextDrawTextSize(playerid, ATMTextDraws[playerid][3], 400.000000, 187.000000);
	PlayerTextDrawSetOutline(playerid, ATMTextDraws[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, ATMTextDraws[playerid][3], 0);
	PlayerTextDrawAlignment(playerid, ATMTextDraws[playerid][3], 2);
	PlayerTextDrawColor(playerid, ATMTextDraws[playerid][3], -1);
	PlayerTextDrawBackgroundColor(playerid, ATMTextDraws[playerid][3], 255);
	PlayerTextDrawBoxColor(playerid, ATMTextDraws[playerid][3], 50);
	PlayerTextDrawUseBox(playerid, ATMTextDraws[playerid][3], 0);
	PlayerTextDrawSetProportional(playerid, ATMTextDraws[playerid][3], 1);
	PlayerTextDrawSetSelectable(playerid, ATMTextDraws[playerid][3], 0);

	ATMTextDraws[playerid][4] = CreatePlayerTextDraw(playerid, 322.000000, 163.000000, "jones Tiller");
	PlayerTextDrawFont(playerid, ATMTextDraws[playerid][4], 2);
	PlayerTextDrawLetterSize(playerid, ATMTextDraws[playerid][4], 0.166666, 1.200000);
	PlayerTextDrawTextSize(playerid, ATMTextDraws[playerid][4], 400.000000, 143.500000);
	PlayerTextDrawSetOutline(playerid, ATMTextDraws[playerid][4], 1);
	PlayerTextDrawSetShadow(playerid, ATMTextDraws[playerid][4], 0);
	PlayerTextDrawAlignment(playerid, ATMTextDraws[playerid][4], 2);
	PlayerTextDrawColor(playerid, ATMTextDraws[playerid][4], -1);
	PlayerTextDrawBackgroundColor(playerid, ATMTextDraws[playerid][4], 255);
	PlayerTextDrawBoxColor(playerid, ATMTextDraws[playerid][4], 50);
	PlayerTextDrawUseBox(playerid, ATMTextDraws[playerid][4], 0);
	PlayerTextDrawSetProportional(playerid, ATMTextDraws[playerid][4], 1);
	PlayerTextDrawSetSelectable(playerid, ATMTextDraws[playerid][4], 0);

	ATMTextDraws[playerid][5] = CreatePlayerTextDraw(playerid, 218.000000, 132.000000, "los santos Bank");
	PlayerTextDrawFont(playerid, ATMTextDraws[playerid][5], 2);
	PlayerTextDrawLetterSize(playerid, ATMTextDraws[playerid][5], 0.129166, 0.950000);
	PlayerTextDrawTextSize(playerid, ATMTextDraws[playerid][5], 281.500000, 50.000000);
	PlayerTextDrawSetOutline(playerid, ATMTextDraws[playerid][5], 1);
	PlayerTextDrawSetShadow(playerid, ATMTextDraws[playerid][5], 0);
	PlayerTextDrawAlignment(playerid, ATMTextDraws[playerid][5], 1);
	PlayerTextDrawColor(playerid, ATMTextDraws[playerid][5], -1);
	PlayerTextDrawBackgroundColor(playerid, ATMTextDraws[playerid][5], 255);
	PlayerTextDrawBoxColor(playerid, ATMTextDraws[playerid][5], 180);
	PlayerTextDrawUseBox(playerid, ATMTextDraws[playerid][5], 1);
	PlayerTextDrawSetProportional(playerid, ATMTextDraws[playerid][5], 1);
	PlayerTextDrawSetSelectable(playerid, ATMTextDraws[playerid][5], 0);

	ATMTextDraws[playerid][6] = CreatePlayerTextDraw(playerid, 267.000000, 183.000000, "money");
	PlayerTextDrawFont(playerid, ATMTextDraws[playerid][6], 3);
	PlayerTextDrawLetterSize(playerid, ATMTextDraws[playerid][6], 0.283333, 1.100000);
	PlayerTextDrawTextSize(playerid, ATMTextDraws[playerid][6], 400.000000, 34.000000);
	PlayerTextDrawSetOutline(playerid, ATMTextDraws[playerid][6], 1);
	PlayerTextDrawSetShadow(playerid, ATMTextDraws[playerid][6], 0);
	PlayerTextDrawAlignment(playerid, ATMTextDraws[playerid][6], 2);
	PlayerTextDrawColor(playerid, ATMTextDraws[playerid][6], -1);
	PlayerTextDrawBackgroundColor(playerid, ATMTextDraws[playerid][6], 255);
	PlayerTextDrawBoxColor(playerid, ATMTextDraws[playerid][6], -16777036);
	PlayerTextDrawUseBox(playerid, ATMTextDraws[playerid][6], 0);
	PlayerTextDrawSetProportional(playerid, ATMTextDraws[playerid][6], 1);
	PlayerTextDrawSetSelectable(playerid, ATMTextDraws[playerid][6], 0);

	ATMTextDraws[playerid][7] = CreatePlayerTextDraw(playerid, 350.000000, 183.000000, "10,000,000");
	PlayerTextDrawFont(playerid, ATMTextDraws[playerid][7], 2);
	PlayerTextDrawLetterSize(playerid, ATMTextDraws[playerid][7], 0.204166, 1.300000);
	PlayerTextDrawTextSize(playerid, ATMTextDraws[playerid][7], 400.000000, 73.500000);
	PlayerTextDrawSetOutline(playerid, ATMTextDraws[playerid][7], 1);
	PlayerTextDrawSetShadow(playerid, ATMTextDraws[playerid][7], 0);
	PlayerTextDrawAlignment(playerid, ATMTextDraws[playerid][7], 2);
	PlayerTextDrawColor(playerid, ATMTextDraws[playerid][7], -1);
	PlayerTextDrawBackgroundColor(playerid, ATMTextDraws[playerid][7], 255);
	PlayerTextDrawBoxColor(playerid, ATMTextDraws[playerid][7], 180);
	PlayerTextDrawUseBox(playerid, ATMTextDraws[playerid][7], 1);
	PlayerTextDrawSetProportional(playerid, ATMTextDraws[playerid][7], 1);
	PlayerTextDrawSetSelectable(playerid, ATMTextDraws[playerid][7], 0);

	ATMTextDraws[playerid][8] = CreatePlayerTextDraw(playerid, 263.000000, 201.000000, "bank");
	PlayerTextDrawFont(playerid, ATMTextDraws[playerid][8], 3);
	PlayerTextDrawLetterSize(playerid, ATMTextDraws[playerid][8], 0.283333, 1.100000);
	PlayerTextDrawTextSize(playerid, ATMTextDraws[playerid][8], 400.000000, 187.000000);
	PlayerTextDrawSetOutline(playerid, ATMTextDraws[playerid][8], 1);
	PlayerTextDrawSetShadow(playerid, ATMTextDraws[playerid][8], 0);
	PlayerTextDrawAlignment(playerid, ATMTextDraws[playerid][8], 2);
	PlayerTextDrawColor(playerid, ATMTextDraws[playerid][8], -1);
	PlayerTextDrawBackgroundColor(playerid, ATMTextDraws[playerid][8], 255);
	PlayerTextDrawBoxColor(playerid, ATMTextDraws[playerid][8], 50);
	PlayerTextDrawUseBox(playerid, ATMTextDraws[playerid][8], 0);
	PlayerTextDrawSetProportional(playerid, ATMTextDraws[playerid][8], 1);
	PlayerTextDrawSetSelectable(playerid, ATMTextDraws[playerid][8], 0);

	ATMTextDraws[playerid][9] = CreatePlayerTextDraw(playerid, 350.000000, 200.000000, "20,000,000");
	PlayerTextDrawFont(playerid, ATMTextDraws[playerid][9], 2);
	PlayerTextDrawLetterSize(playerid, ATMTextDraws[playerid][9], 0.204166, 1.300000);
	PlayerTextDrawTextSize(playerid, ATMTextDraws[playerid][9], 400.000000, 73.000000);
	PlayerTextDrawSetOutline(playerid, ATMTextDraws[playerid][9], 1);
	PlayerTextDrawSetShadow(playerid, ATMTextDraws[playerid][9], 0);
	PlayerTextDrawAlignment(playerid, ATMTextDraws[playerid][9], 2);
	PlayerTextDrawColor(playerid, ATMTextDraws[playerid][9], -1);
	PlayerTextDrawBackgroundColor(playerid, ATMTextDraws[playerid][9], 255);
	PlayerTextDrawBoxColor(playerid, ATMTextDraws[playerid][9], 180);
	PlayerTextDrawUseBox(playerid, ATMTextDraws[playerid][9], 1);
	PlayerTextDrawSetProportional(playerid, ATMTextDraws[playerid][9], 1);
	PlayerTextDrawSetSelectable(playerid, ATMTextDraws[playerid][9], 0);

	ATMTextDraws[playerid][10] = CreatePlayerTextDraw(playerid, 296.000000, 183.000000, ">");
	PlayerTextDrawFont(playerid, ATMTextDraws[playerid][10], 3);
	PlayerTextDrawLetterSize(playerid, ATMTextDraws[playerid][10], 0.283333, 1.100000);
	PlayerTextDrawTextSize(playerid, ATMTextDraws[playerid][10], 400.000000, 34.000000);
	PlayerTextDrawSetOutline(playerid, ATMTextDraws[playerid][10], 0);
	PlayerTextDrawSetShadow(playerid, ATMTextDraws[playerid][10], 0);
	PlayerTextDrawAlignment(playerid, ATMTextDraws[playerid][10], 2);
	PlayerTextDrawColor(playerid, ATMTextDraws[playerid][10], 255);
	PlayerTextDrawBackgroundColor(playerid, ATMTextDraws[playerid][10], 255);
	PlayerTextDrawBoxColor(playerid, ATMTextDraws[playerid][10], 180);
	PlayerTextDrawUseBox(playerid, ATMTextDraws[playerid][10], 0);
	PlayerTextDrawSetProportional(playerid, ATMTextDraws[playerid][10], 1);
	PlayerTextDrawSetSelectable(playerid, ATMTextDraws[playerid][10], 0);

	ATMTextDraws[playerid][11] = CreatePlayerTextDraw(playerid, 296.000000, 201.000000, ">");
	PlayerTextDrawFont(playerid, ATMTextDraws[playerid][11], 3);
	PlayerTextDrawLetterSize(playerid, ATMTextDraws[playerid][11], 0.283333, 1.100000);
	PlayerTextDrawTextSize(playerid, ATMTextDraws[playerid][11], 400.000000, 34.000000);
	PlayerTextDrawSetOutline(playerid, ATMTextDraws[playerid][11], 0);
	PlayerTextDrawSetShadow(playerid, ATMTextDraws[playerid][11], 0);
	PlayerTextDrawAlignment(playerid, ATMTextDraws[playerid][11], 2);
	PlayerTextDrawColor(playerid, ATMTextDraws[playerid][11], 255);
	PlayerTextDrawBackgroundColor(playerid, ATMTextDraws[playerid][11], 255);
	PlayerTextDrawBoxColor(playerid, ATMTextDraws[playerid][11], 180);
	PlayerTextDrawUseBox(playerid, ATMTextDraws[playerid][11], 0);
	PlayerTextDrawSetProportional(playerid, ATMTextDraws[playerid][11], 1);
	PlayerTextDrawSetSelectable(playerid, ATMTextDraws[playerid][11], 0);

	ATMTextDraws[playerid][12] = CreatePlayerTextDraw(playerid, 322.000000, 229.000000, "choose a service");
	PlayerTextDrawFont(playerid, ATMTextDraws[playerid][12], 3);
	PlayerTextDrawLetterSize(playerid, ATMTextDraws[playerid][12], 0.366666, 1.450000);
	PlayerTextDrawTextSize(playerid, ATMTextDraws[playerid][12], 400.000000, 118.500000);
	PlayerTextDrawSetOutline(playerid, ATMTextDraws[playerid][12], 1);
	PlayerTextDrawSetShadow(playerid, ATMTextDraws[playerid][12], 0);
	PlayerTextDrawAlignment(playerid, ATMTextDraws[playerid][12], 2);
	PlayerTextDrawColor(playerid, ATMTextDraws[playerid][12], -1);
	PlayerTextDrawBackgroundColor(playerid, ATMTextDraws[playerid][12], 255);
	PlayerTextDrawBoxColor(playerid, ATMTextDraws[playerid][12], -1962934092);
	PlayerTextDrawUseBox(playerid, ATMTextDraws[playerid][12], 0);
	PlayerTextDrawSetProportional(playerid, ATMTextDraws[playerid][12], 1);
	PlayerTextDrawSetSelectable(playerid, ATMTextDraws[playerid][12], 0);

	ATMTextDraws[playerid][13] = CreatePlayerTextDraw(playerid, 322.000000, 249.000000, "_");
	PlayerTextDrawFont(playerid, ATMTextDraws[playerid][13], 1);
	PlayerTextDrawLetterSize(playerid, ATMTextDraws[playerid][13], 0.600000, 1.800003);
	PlayerTextDrawTextSize(playerid, ATMTextDraws[playerid][13], 298.500000, 75.000000);
	PlayerTextDrawSetOutline(playerid, ATMTextDraws[playerid][13], 1);
	PlayerTextDrawSetShadow(playerid, ATMTextDraws[playerid][13], 0);
	PlayerTextDrawAlignment(playerid, ATMTextDraws[playerid][13], 2);
	PlayerTextDrawColor(playerid, ATMTextDraws[playerid][13], -1);
	PlayerTextDrawBackgroundColor(playerid, ATMTextDraws[playerid][13], 255);
	PlayerTextDrawBoxColor(playerid, ATMTextDraws[playerid][13], -16777036);
	PlayerTextDrawUseBox(playerid, ATMTextDraws[playerid][13], 1);
	PlayerTextDrawSetProportional(playerid, ATMTextDraws[playerid][13], 1);
	PlayerTextDrawSetSelectable(playerid, ATMTextDraws[playerid][13], 0);

	ATMTextDraws[playerid][14] = CreatePlayerTextDraw(playerid, 303.000000, 250.000000, "Deposit");
	PlayerTextDrawFont(playerid, ATMTextDraws[playerid][14], 2);
	PlayerTextDrawLetterSize(playerid, ATMTextDraws[playerid][14], 0.220833, 1.550000);
	PlayerTextDrawTextSize(playerid, ATMTextDraws[playerid][14], 342.500000, 20.500000);
	PlayerTextDrawSetOutline(playerid, ATMTextDraws[playerid][14], 1);
	PlayerTextDrawSetShadow(playerid, ATMTextDraws[playerid][14], 0);
	PlayerTextDrawAlignment(playerid, ATMTextDraws[playerid][14], 1);
	PlayerTextDrawColor(playerid, ATMTextDraws[playerid][14], -1);
	PlayerTextDrawBackgroundColor(playerid, ATMTextDraws[playerid][14], 255);
	PlayerTextDrawBoxColor(playerid, ATMTextDraws[playerid][14], 50);
	PlayerTextDrawUseBox(playerid, ATMTextDraws[playerid][14], 0);
	PlayerTextDrawSetProportional(playerid, ATMTextDraws[playerid][14], 1);
	PlayerTextDrawSetSelectable(playerid, ATMTextDraws[playerid][14], 1);

	ATMTextDraws[playerid][15] = CreatePlayerTextDraw(playerid, 322.000000, 273.000000, "_");
	PlayerTextDrawFont(playerid, ATMTextDraws[playerid][15], 1);
	PlayerTextDrawLetterSize(playerid, ATMTextDraws[playerid][15], 0.600000, 1.800003);
	PlayerTextDrawTextSize(playerid, ATMTextDraws[playerid][15], 298.500000, 75.000000);
	PlayerTextDrawSetOutline(playerid, ATMTextDraws[playerid][15], 1);
	PlayerTextDrawSetShadow(playerid, ATMTextDraws[playerid][15], 0);
	PlayerTextDrawAlignment(playerid, ATMTextDraws[playerid][15], 2);
	PlayerTextDrawColor(playerid, ATMTextDraws[playerid][15], -1);
	PlayerTextDrawBackgroundColor(playerid, ATMTextDraws[playerid][15], 255);
	PlayerTextDrawBoxColor(playerid, ATMTextDraws[playerid][15], -16777036);
	PlayerTextDrawUseBox(playerid, ATMTextDraws[playerid][15], 1);
	PlayerTextDrawSetProportional(playerid, ATMTextDraws[playerid][15], 1);
	PlayerTextDrawSetSelectable(playerid, ATMTextDraws[playerid][15], 0);

	ATMTextDraws[playerid][16] = CreatePlayerTextDraw(playerid, 298.000000, 273.000000, "Withdraw");
	PlayerTextDrawFont(playerid, ATMTextDraws[playerid][16], 2);
	PlayerTextDrawLetterSize(playerid, ATMTextDraws[playerid][16], 0.229166, 1.550000);
	PlayerTextDrawTextSize(playerid, ATMTextDraws[playerid][16], 349.500000, 20.500000);
	PlayerTextDrawSetOutline(playerid, ATMTextDraws[playerid][16], 1);
	PlayerTextDrawSetShadow(playerid, ATMTextDraws[playerid][16], 0);
	PlayerTextDrawAlignment(playerid, ATMTextDraws[playerid][16], 1);
	PlayerTextDrawColor(playerid, ATMTextDraws[playerid][16], -1);
	PlayerTextDrawBackgroundColor(playerid, ATMTextDraws[playerid][16], 255);
	PlayerTextDrawBoxColor(playerid, ATMTextDraws[playerid][16], 50);
	PlayerTextDrawUseBox(playerid, ATMTextDraws[playerid][16], 0);
	PlayerTextDrawSetProportional(playerid, ATMTextDraws[playerid][16], 1);
	PlayerTextDrawSetSelectable(playerid, ATMTextDraws[playerid][16], 1);

	ATMTextDraws[playerid][17] = CreatePlayerTextDraw(playerid, 322.000000, 297.000000, "_");
	PlayerTextDrawFont(playerid, ATMTextDraws[playerid][17], 1);
	PlayerTextDrawLetterSize(playerid, ATMTextDraws[playerid][17], 0.600000, 1.800003);
	PlayerTextDrawTextSize(playerid, ATMTextDraws[playerid][17], 298.500000, 75.000000);
	PlayerTextDrawSetOutline(playerid, ATMTextDraws[playerid][17], 1);
	PlayerTextDrawSetShadow(playerid, ATMTextDraws[playerid][17], 0);
	PlayerTextDrawAlignment(playerid, ATMTextDraws[playerid][17], 2);
	PlayerTextDrawColor(playerid, ATMTextDraws[playerid][17], -1);
	PlayerTextDrawBackgroundColor(playerid, ATMTextDraws[playerid][17], 255);
	PlayerTextDrawBoxColor(playerid, ATMTextDraws[playerid][17], -16777036);
	PlayerTextDrawUseBox(playerid, ATMTextDraws[playerid][17], 1);
	PlayerTextDrawSetProportional(playerid, ATMTextDraws[playerid][17], 1);
	PlayerTextDrawSetSelectable(playerid, ATMTextDraws[playerid][17], 0);

	ATMTextDraws[playerid][18] = CreatePlayerTextDraw(playerid, 300.000000, 297.000000, "transfer");
	PlayerTextDrawFont(playerid, ATMTextDraws[playerid][18], 2);
	PlayerTextDrawLetterSize(playerid, ATMTextDraws[playerid][18], 0.220833, 1.550000);
	PlayerTextDrawTextSize(playerid, ATMTextDraws[playerid][18], 347.500000, 20.500000);
	PlayerTextDrawSetOutline(playerid, ATMTextDraws[playerid][18], 1);
	PlayerTextDrawSetShadow(playerid, ATMTextDraws[playerid][18], 0);
	PlayerTextDrawAlignment(playerid, ATMTextDraws[playerid][18], 1);
	PlayerTextDrawColor(playerid, ATMTextDraws[playerid][18], -1);
	PlayerTextDrawBackgroundColor(playerid, ATMTextDraws[playerid][18], 255);
	PlayerTextDrawBoxColor(playerid, ATMTextDraws[playerid][18], 50);
	PlayerTextDrawUseBox(playerid, ATMTextDraws[playerid][18], 0);
	PlayerTextDrawSetProportional(playerid, ATMTextDraws[playerid][18], 1);
	PlayerTextDrawSetSelectable(playerid, ATMTextDraws[playerid][18], 1);

	ATMTextDraws[playerid][19] = CreatePlayerTextDraw(playerid, 409.000000, 329.000000, "CLOSE");
	PlayerTextDrawFont(playerid, ATMTextDraws[playerid][19], 3);
	PlayerTextDrawLetterSize(playerid, ATMTextDraws[playerid][19], 0.270833, 1.200000);
	PlayerTextDrawTextSize(playerid, ATMTextDraws[playerid][19], 400.000000, 20.500000);
	PlayerTextDrawSetOutline(playerid, ATMTextDraws[playerid][19], 1);
	PlayerTextDrawSetShadow(playerid, ATMTextDraws[playerid][19], 0);
	PlayerTextDrawAlignment(playerid, ATMTextDraws[playerid][19], 2);
	PlayerTextDrawColor(playerid, ATMTextDraws[playerid][19], -1);
	PlayerTextDrawBackgroundColor(playerid, ATMTextDraws[playerid][19], 255);
	PlayerTextDrawBoxColor(playerid, ATMTextDraws[playerid][19], 50);
	PlayerTextDrawUseBox(playerid, ATMTextDraws[playerid][19], 0);
	PlayerTextDrawSetProportional(playerid, ATMTextDraws[playerid][19], 1);
	PlayerTextDrawSetSelectable(playerid, ATMTextDraws[playerid][19], 1);

	// --> SPACEBAR
	if (newkeys & KEY_SPRINT)
	{
		// --> โชว์ ATM
		if (ATM_Nearest(playerid) != -1)
		{
	    	ShowATM(playerid);
		}

	}


forward ATM_Load();
public ATM_Load()
{
    static
	    rows;

	cache_get_row_count(rows);

	for (new i = 0; i < rows; i ++) if (i < MAX_ATM_MACHINES)
	{
	    atmData[i][atmExists] = true;
	    cache_get_value_name_int(i, "atmID", atmData[i][atmID]);
	    cache_get_value_name_float(i, "atmX", atmData[i][atmPosX]);
        cache_get_value_name_float(i, "atmY", atmData[i][atmPosY]);
        cache_get_value_name_float(i, "atmZ", atmData[i][atmPosZ]);
        cache_get_value_name_float(i, "atmA", atmData[i][atmPosA]);
        cache_get_value_name_int(i, "atmInterior", atmData[i][atmInterior]);
		cache_get_value_name_int(i, "atmWorld", atmData[i][atmWorld]);

		ATM_Refresh(i);
	}
	printf("[SERVER]: %i ATM were loaded from \"%s\" database...", rows, MYSQL_DATABASE);
	return 1;
}

forward OnATMCreated(atmid);
public OnATMCreated(atmid)
{
    if (atmid == -1 || !atmData[atmid][atmExists])
		return 0;

	atmData[atmid][atmID] = cache_insert_id();
 	ATM_Save(atmid);

	return 1;
}

ATM_Delete(atmid)
{
	if (atmid != -1 && atmData[atmid][atmExists])
	{
	    new
	        string[64];

		mysql_format(g_SQL, string, sizeof(string), "DELETE FROM `atm` WHERE `atmID` = '%d'", atmData[atmid][atmID]);
		mysql_tquery(g_SQL, string);

        if (IsValidDynamicObject(atmData[atmid][atmObject]))
	        DestroyDynamicObject(atmData[atmid][atmObject]);

	    if (IsValidDynamic3DTextLabel(atmData[atmid][atmText3D]))
	        DestroyDynamic3DTextLabel(atmData[atmid][atmText3D]);

	    atmData[atmid][atmExists] = false;
	    atmData[atmid][atmID] = 0;
	}
	return 1;
}

ATM_Nearest(playerid)
{
    for (new i = 0; i != MAX_ATM_MACHINES; i ++) if (atmData[i][atmExists] && IsPlayerInRangeOfPoint(playerid, 2.5, atmData[i][atmPosX], atmData[i][atmPosY], atmData[i][atmPosZ]))
	{
		if (GetPlayerInterior(playerid) == atmData[i][atmInterior] && GetPlayerVirtualWorld(playerid) == atmData[i][atmWorld])
			return i;
	}
	return -1;
}

ATM_Create(playerid)
{
    new
	    Float:x,
	    Float:y,
	    Float:z,
	    Float:angle;

	if (GetPlayerPos(playerid, x, y, z) && GetPlayerFacingAngle(playerid, angle))
	{
		for (new i = 0; i < MAX_ATM_MACHINES; i ++) if (!atmData[i][atmExists])
		{
		    atmData[i][atmExists] = true;

		    x += 1.0 * floatsin(-angle, degrees);
			y += 1.0 * floatcos(-angle, degrees);

            atmData[i][atmPosX] = x;
            atmData[i][atmPosY] = y;
            atmData[i][atmPosZ] = z;
            atmData[i][atmPosA] = angle;

            atmData[i][atmInterior] = GetPlayerInterior(playerid);
            atmData[i][atmWorld] = GetPlayerVirtualWorld(playerid);

			ATM_Refresh(i);
			mysql_tquery(g_SQL, "INSERT INTO `atm` (`atmInterior`) VALUES(0)", "OnATMCreated", "d", i);

			return i;
		}
	}
	return -1;
}

ATM_Refresh(atmid)
{
	if (atmid != -1 && atmData[atmid][atmExists])
	{
	    if (IsValidDynamicObject(atmData[atmid][atmObject]))
	        DestroyDynamicObject(atmData[atmid][atmObject]);

	    if (IsValidDynamic3DTextLabel(atmData[atmid][atmText3D]))
	        DestroyDynamic3DTextLabel(atmData[atmid][atmText3D]);

		atmData[atmid][atmObject] = CreateDynamicObject(2942, atmData[atmid][atmPosX], atmData[atmid][atmPosY], atmData[atmid][atmPosZ] - 0.4, 0.0, 0.0, atmData[atmid][atmPosA], atmData[atmid][atmWorld], atmData[atmid][atmInterior]);
        atmData[atmid][atmText3D] = CreateDynamic3DTextLabel("ตู้ ATM: {FFFFFF}\nกด 'SPACEBAR' ในการใช้งาน", COLOR_GREEN, atmData[atmid][atmPosX], atmData[atmid][atmPosY], atmData[atmid][atmPosZ], 15.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, atmData[atmid][atmWorld], atmData[atmid][atmInterior]);

		return 1;
	}
	return 0;
}

ATM_Save(atmid)
{
	new
	    query[200];

	mysql_format(g_SQL, query, sizeof(query), "UPDATE `atm` SET `atmX` = '%.4f', `atmY` = '%.4f', `atmZ` = '%.4f', `atmA` = '%.4f', `atmInterior` = '%d', `atmWorld` = '%d' WHERE `atmID` = '%d'",
	    atmData[atmid][atmPosX],
	    atmData[atmid][atmPosY],
	    atmData[atmid][atmPosZ],
	    atmData[atmid][atmPosA],
	    atmData[atmid][atmInterior],
	    atmData[atmid][atmWorld],
	    atmData[atmid][atmID]
	);
	return mysql_tquery(g_SQL, query);
}

Dialog:DIALOG_BANKACCOUNT(playerid, response, listitem, inputtext[])
{
	if (!IsPlayerInBank(playerid) && ATM_Nearest(playerid) == -1)
	    return 0;

	if (response)
	{
	    switch (listitem)
	    {
	        case 0:
	        {
				Dialog_Show(playerid, DIALOG_WITHDRAW, DIALOG_STYLE_INPUT, "[ถอนเงิน]", "{FFFFFF}ยอดเงินในบัญชี: %s\nกรุณาใส่จำนวนเงินที่คุณต้องการจะถอน", "ถอน", "กลับ", FormatMoney(playerData[playerid][pBankMoney]));
			}
	        case 1:
	        {
				Dialog_Show(playerid, DIALOG_DEPOSIT, DIALOG_STYLE_INPUT, "[ฝากเงิน]", "{FFFFFF}ยอดเงินในบัญชี: %s\nกรุณาใส่จำนวนเงินที่คุณต้องการจะฝาก", "ฝาก", "กลับ", FormatMoney(playerData[playerid][pBankMoney]));
			}
			case 2:
			{
			    Dialog_Show(playerid, DIALOG_TRANSFER, DIALOG_STYLE_INPUT, "[โอนเงิน]", "{FFFFFF}ยอดเงินในบัญชี: %s\nกรุณาใส่ไอดีหรือชื่อผู้รับเงิน", "โอน", "กลับ", FormatMoney(playerData[playerid][pBankMoney]));
			}
	    }
	}
	else
	{
	    Dialog_Show(playerid, DIALOG_BANK, DIALOG_STYLE_LIST, "[บัญชีธนาคาร]", "ยอดเงินปัจจุบัน: %s", "เลือก", "ปิด", FormatMoney(playerData[playerid][pBankMoney]));
	}
	return 1;
}

Dialog:DIALOG_TRANSFER(playerid, response, listitem, inputtext[])
{
	if (!IsPlayerInBank(playerid) && ATM_Nearest(playerid) == -1)
	    return 0;

	if (response)
	{
	    static
	        userid;

		if (playerData[playerid][pHours] < 15)
		    return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}คุณจำเป็นต้องมีชั่วโมงการเล่นมากกว่า 15 ขึ้นไป");

		if (sscanf(inputtext, "u", userid))
		    return Dialog_Show(playerid, DIALOG_TRANSFER, DIALOG_STYLE_INPUT, "[โอนเงิน]", "{FFFFFF}ยอดเงินในบัญชี: %s\nกรุณาใส่ไอดีหรือชื่อผู้รับเงิน", "โอน", "กลับ", FormatMoney(playerData[playerid][pBankMoney]));

		if (userid == INVALID_PLAYER_ID)
		    return Dialog_Show(playerid, DIALOG_TRANSFER, DIALOG_STYLE_INPUT, "[โอนเงิน]", "{FFFFFF}ยอดเงินในบัญชี: %s\nกรุณาใส่ไอดีหรือชื่อผู้รับเงิน\n\n{FF0000}*** ผู้เล่นไอดีนี้ไม่ได้อยู่ในเกม", "โอน", "กลับ", FormatMoney(playerData[playerid][pBankMoney]));

		if (userid == playerid)
		    return Dialog_Show(playerid, DIALOG_TRANSFER, DIALOG_STYLE_INPUT, "[โอนเงิน]", "{FFFFFF}ยอดเงินในบัญชี: %s\nกรุณาใส่ไอดีหรือชื่อผู้รับเงิน\n\n{FF0000}*** โอนเงินเข้าบัญชีตัวเองไม่ได้", "โอน", "กลับ", FormatMoney(playerData[playerid][pBankMoney]));

		playerData[playerid][pTransfer] = userid;
		Dialog_Show(playerid, DIALOG_TRANSFERCASH, DIALOG_STYLE_INPUT, "[โอนเงิน]", "{FFFFFF}ยอดเงินในบัญชี: %s\nกรุณาใส่จำนวนเงินที่คุณต้องการจะโอนให้กับ %s", "โอน", "กลับ", FormatMoney(playerData[playerid][pBankMoney]), GetPlayerNameEx(userid));
	}
    else {
	    //Dialog_Show(playerid, DIALOG_BANKACCOUNT, DIALOG_STYLE_LIST, "[บัญชีธนาคาร]", "ถอนเงิน\nฝากเงิน\nโอนเงิน", "เลือก", "กลับ");
		ShowATM(playerid);
	}
	return 1;
}

Dialog:DIALOG_TRANSFERCASH(playerid, response, listitem, inputtext[])
{
	if (!IsPlayerInBank(playerid) && ATM_Nearest(playerid) == -1)
	    return 0;

	if (response)
	{
	    new amount = strval(inputtext);

	    if (isnull(inputtext))
	        return Dialog_Show(playerid, DIALOG_TRANSFERCASH, DIALOG_STYLE_INPUT, "[โอนเงิน]", "{FFFFFF}ยอดเงินในบัญชี: %s\nกรุณาใส่จำนวนเงินที่คุณต้องการจะโอนให้กับ %s", "โอน", "กลับ", FormatMoney(playerData[playerid][pBankMoney]), GetPlayerNameEx(playerData[playerid][pTransfer]));

		if (amount < 1 || amount > playerData[playerid][pBankMoney])
			return Dialog_Show(playerid, DIALOG_TRANSFERCASH, DIALOG_STYLE_INPUT, "[โอนเงิน]", "{FFFFFF}ยอดเงินในบัญชี: %s\nกรุณาใส่จำนวนเงินที่คุณต้องการจะโอนให้กับ %s\n\n{FF0000}*** เงินในบัญชีของคุณไม่พอที่จะโอน", "โอน", "กลับ", FormatMoney(playerData[playerid][pBankMoney]), GetPlayerNameEx(playerData[playerid][pTransfer]));

		playerData[playerid][pBankMoney] -= amount;
		playerData[playerData[playerid][pTransfer]][pBankMoney] += amount;

	    SendClientMessageEx(playerid, COLOR_YELLOW, "[ธนาคาร] {FFFFFF}คุณได้โอนเงินจำนวน %s ให้กับ %s สำเร็จ", FormatMoney(amount), GetPlayerNameEx(playerData[playerid][pTransfer]));
	    SendClientMessageEx(playerData[playerid][pTransfer], COLOR_YELLOW, "[ธนาคาร] {FFFFFF}ผู้เล่น %s ได้โอนเงินให้คุณจำนวน %s สำเร็จ", GetPlayerNameEx(playerid), FormatMoney(amount));

		ShowATM(playerid);
        //Dialog_Show(playerid, DIALOG_BANKACCOUNT, DIALOG_STYLE_LIST, "[บัญชีธนาคาร]", "ถอนเงิน\nฝากเงิน\nโอนเงิน", "เลือก", "กลับ");
	}
	else {
	    //Dialog_Show(playerid, DIALOG_BANKACCOUNT, DIALOG_STYLE_LIST, "[บัญชีธนาคาร]", "ถอนเงิน\nฝากเงิน\nโอนเงิน", "เลือก", "กลับ");
		ShowATM(playerid);
	}
	return 1;
}

Dialog:DIALOG_WITHDRAW(playerid, response, listitem, inputtext[])
{
	if (!IsPlayerInBank(playerid) && ATM_Nearest(playerid) == -1)
	    return 0;

	if (response)
	{
	    new amount = strval(inputtext);

	    if (isnull(inputtext))
	        return Dialog_Show(playerid, DIALOG_WITHDRAW, DIALOG_STYLE_INPUT, "[ถอนเงิน]", "{FFFFFF}ยอดเงินในบัญชี: %s\nกรุณาใส่จำนวนเงินที่คุณต้องการจะถอน", "ถอน", "กลับ", FormatMoney(playerData[playerid][pBankMoney]));

		if (amount < 1 || amount > playerData[playerid][pBankMoney])
			return Dialog_Show(playerid, DIALOG_WITHDRAW, DIALOG_STYLE_INPUT, "[ถอนเงิน]", "{FFFFFF}ยอดเงินในบัญชี: %s\nกรุณาใส่จำนวนเงินที่คุณต้องการจะถอน\n\n{FF0000}*** ยอดเงินที่คุณต้องการจะถอนไม่เพียงพอ", "ถอน", "กลับ", FormatMoney(playerData[playerid][pBankMoney]));

		playerData[playerid][pBankMoney] -= amount;
	    GivePlayerMoneyEx(playerid, amount);

	    SendClientMessageEx(playerid, COLOR_YELLOW, "[ธนาคาร] {FFFFFF}คุณได้ถอนเงินจำนวน %s ออกจากบัญชีสำเร็จ", FormatMoney(amount));
        Dialog_Show(playerid, DIALOG_WITHDRAW, DIALOG_STYLE_INPUT, "[ถอนเงิน]", "{FFFFFF}ยอดเงินในบัญชี: %s\nกรุณาใส่จำนวนเงินที่คุณต้องการจะถอน", "ถอน", "กลับ", FormatMoney(playerData[playerid][pBankMoney]));
	}
	else {
	    //Dialog_Show(playerid, DIALOG_BANKACCOUNT, DIALOG_STYLE_LIST, "[บัญชีธนาคาร]", "ถอนเงิน\nฝากเงิน\nโอนเงิน", "เลือก", "กลับ");
		ShowATM(playerid);
	}
	return 1;
}

Dialog:DIALOG_DEPOSIT(playerid, response, listitem, inputtext[])
{
	if (!IsPlayerInBank(playerid) && ATM_Nearest(playerid) == -1)
	    return 0;

	if (response)
	{
	    new amount = strval(inputtext);

	    if (isnull(inputtext))
	        return Dialog_Show(playerid, DIALOG_DEPOSIT, DIALOG_STYLE_INPUT, "[ฝากเงิน]", "{FFFFFF}ยอดเงินในบัญชี: %s\nกรุณาใส่จำนวนเงินที่คุณต้องการจะฝาก", "ฝาก", "กลับ", FormatMoney(playerData[playerid][pBankMoney]));

		if (amount < 1 || amount > GetPlayerMoneyEx(playerid))
			return Dialog_Show(playerid, DIALOG_DEPOSIT, DIALOG_STYLE_INPUT, "[ฝากเงิน]", "{FFFFFF}ยอดเงินในบัญชี: %s\nกรุณาใส่จำนวนเงินที่คุณต้องการจะฝาก\n\n{FF0000}*** ยอดเงินที่คุณต้องการจะฝากไม่เพียงพอ", "ฝาก", "กลับ", FormatMoney(playerData[playerid][pBankMoney]));

		playerData[playerid][pBankMoney] += amount;
	    GivePlayerMoneyEx(playerid, -amount);

	    SendClientMessageEx(playerid, COLOR_YELLOW, "[ธนาคาร] {FFFFFF}คุณได้ฝากเงินจำนวน %s เข้าธนาคารสำเร็จ", FormatMoney(amount));
        Dialog_Show(playerid, DIALOG_DEPOSIT, DIALOG_STYLE_INPUT, "[ฝากเงิน]", "{FFFFFF}ยอดเงินในบัญชี: %s\nกรุณาใส่จำนวนเงินที่คุณต้องการจะฝาก", "ฝาก", "กลับ", FormatMoney(playerData[playerid][pBankMoney]));
	}
	else {
	    //Dialog_Show(playerid, DIALOG_BANKACCOUNT, DIALOG_STYLE_LIST, "[บัญชีธนาคาร]", "ถอนเงิน\nฝากเงิน\nโอนเงิน", "เลือก", "กลับ");
        ShowATM(playerid);
	}
	return 1;
}

Dialog:DIALOG_BANK(playerid, response, listitem, inputtext[])
{
	if (!IsPlayerInBank(playerid) && ATM_Nearest(playerid) == -1)
	    return 0;

	if (response)
	{
	    switch (listitem)
	    {
	        case 0:
	        {
	            ShowATM(playerid);
				//Dialog_Show(playerid, DIALOG_BANKACCOUNT, DIALOG_STYLE_LIST, "[บัญชีธนาคาร]", "ถอนเงิน\nฝากเงิน\nโอนเงิน", "เลือก", "กลับ");
			}
		}
	}
	return 1;
}

CMD:createatm(playerid, params[])
{
	static
	    id = -1;

    if (playerData[playerid][pAdmin] < 5)
	    return 1;

	id = ATM_Create(playerid);

	if (id == -1)
	    return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}ความจุของ ATM ในฐานข้อมูลเต็มแล้ว ไม่สามารถสร้างได้อีก (ติดต่อผู้พัฒนา)");

	SendClientMessageEx(playerid, COLOR_SERVER, "คุณได้สร้าง ตู้ ATM  ขึ้นมาใหม่ ไอดี: %d", id);
	return 1;
}

CMD:deleteatm(playerid, params[])
{
	static
	    id = 0;

    if (playerData[playerid][pAdmin] < 5)
	    return 1;

	if (sscanf(params, "d", id))
	    return SendClientMessage(playerid, COLOR_WHITE, "/deleteatm [ไอดี]");

	if ((id < 0 || id >= MAX_ATM_MACHINES) || !atmData[id][atmExists])
	    return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}ไม่มีไอดี ATM นี้อยู่ในฐานข้อมูล");

	ATM_Delete(id);
	SendClientMessageEx(playerid, COLOR_SERVER, "คุณได้ลบ ตู้ ATM ไอดี %d ออกสำเร็จ", id);
	return 1;
}
// --> ระบบ ATM

ShowATM(playerid)
{
	PlayerTextDrawShow(playerid, ATMTextDraws[playerid][0]);
	PlayerTextDrawShow(playerid, ATMTextDraws[playerid][1]);
	PlayerTextDrawShow(playerid, ATMTextDraws[playerid][2]);
	PlayerTextDrawShow(playerid, ATMTextDraws[playerid][3]);
	PlayerTextDrawShow(playerid, ATMTextDraws[playerid][4]);
	PlayerTextDrawShow(playerid, ATMTextDraws[playerid][5]);
	PlayerTextDrawShow(playerid, ATMTextDraws[playerid][6]);
	PlayerTextDrawShow(playerid, ATMTextDraws[playerid][7]);
	PlayerTextDrawShow(playerid, ATMTextDraws[playerid][8]);
	PlayerTextDrawShow(playerid, ATMTextDraws[playerid][9]);
	PlayerTextDrawShow(playerid, ATMTextDraws[playerid][10]);
	PlayerTextDrawShow(playerid, ATMTextDraws[playerid][11]);
	PlayerTextDrawShow(playerid, ATMTextDraws[playerid][12]);
	PlayerTextDrawShow(playerid, ATMTextDraws[playerid][13]);
	PlayerTextDrawShow(playerid, ATMTextDraws[playerid][14]);
	PlayerTextDrawShow(playerid, ATMTextDraws[playerid][15]);
	PlayerTextDrawShow(playerid, ATMTextDraws[playerid][16]);
	PlayerTextDrawShow(playerid, ATMTextDraws[playerid][17]);
	PlayerTextDrawShow(playerid, ATMTextDraws[playerid][18]);
	PlayerTextDrawShow(playerid, ATMTextDraws[playerid][19]);
	SelectTextDraw(playerid, 0xFF0000FF);

	new string[128];

	format(string, sizeof(string), "%s", GetPlayerNameEx(playerid));
	PlayerTextDrawSetString(playerid, ATMTextDraws[playerid][4], string);

	format(string, sizeof(string), "%s", FormatNumber(GetPlayerMoneyEx(playerid)));
	PlayerTextDrawSetString(playerid, ATMTextDraws[playerid][7], string);

	format(string, sizeof(string), "%s", FormatNumber(playerData[playerid][pBankMoney]));
	PlayerTextDrawSetString(playerid, ATMTextDraws[playerid][9], string);

	return 1;
}

HideATM(playerid)
{
	PlayerTextDrawHide(playerid, ATMTextDraws[playerid][0]);
	PlayerTextDrawHide(playerid, ATMTextDraws[playerid][1]);
	PlayerTextDrawHide(playerid, ATMTextDraws[playerid][2]);
	PlayerTextDrawHide(playerid, ATMTextDraws[playerid][3]);
	PlayerTextDrawHide(playerid, ATMTextDraws[playerid][4]);
	PlayerTextDrawHide(playerid, ATMTextDraws[playerid][5]);
	PlayerTextDrawHide(playerid, ATMTextDraws[playerid][6]);
	PlayerTextDrawHide(playerid, ATMTextDraws[playerid][7]);
	PlayerTextDrawHide(playerid, ATMTextDraws[playerid][8]);
	PlayerTextDrawHide(playerid, ATMTextDraws[playerid][9]);
	PlayerTextDrawHide(playerid, ATMTextDraws[playerid][10]);
	PlayerTextDrawHide(playerid, ATMTextDraws[playerid][11]);
	PlayerTextDrawHide(playerid, ATMTextDraws[playerid][12]);
	PlayerTextDrawHide(playerid, ATMTextDraws[playerid][13]);
	PlayerTextDrawHide(playerid, ATMTextDraws[playerid][14]);
	PlayerTextDrawHide(playerid, ATMTextDraws[playerid][15]);
	PlayerTextDrawHide(playerid, ATMTextDraws[playerid][16]);
	PlayerTextDrawHide(playerid, ATMTextDraws[playerid][17]);
	PlayerTextDrawHide(playerid, ATMTextDraws[playerid][18]);
	PlayerTextDrawHide(playerid, ATMTextDraws[playerid][19]);
	CancelSelectTextDraw(playerid);
	return 1;
}
