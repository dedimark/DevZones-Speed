// ------ #include ------ //

#include <sourcemod>
#include <devzones>
#include <multicolors>

// ------ ConVar ------ //

ConVar ConVar_Speed;

// ------ #pragma ------ //

#pragma semicolon 1
#pragma newdecls required

// ------ myinfo ------ //

public Plugin myinfo = 
{
	name = "SM DEV ZONES - Speed",
	author = "ByDexter",
	description = "",
	version = "1.0",
	url = "https://steamcommunity.com/id/ByDexterTR/"
};

public void OnPluginStart()
{
	ConVar_Speed = CreateConVar("sm_zones_speed", "1.4", "Bölgeye giren oyuncuların hızı (1.0 default)");
	AutoExecConfig(true, "DevZones-speed", "ByDexter");
}

public void OnClientDisconnect(int client)
{
	SetEntPropFloat(client, Prop_Data, "m_flLaggedMovementValue", 1.0);
}

public void Zone_OnClientEntry(int client, const char[] zone)
{
	if(client < 1 || client > MaxClients || !IsClientInGame(client) ||!IsPlayerAlive(client)) 
		return;
		
	if(StrContains(zone, "speed", false) == 0)
	{
		SetEntPropFloat(client, Prop_Data, "m_flLaggedMovementValue", ConVar_Speed.FloatValue);
		CPrintToChat(client, "{darkred}[ByDexter] {green}speed bölgesine {default}girdiniz.");
	}
}

public void Zone_OnClientLeave(int client, const char[] zone)
{
	if(StrContains(zone, "speed", false) == 0)
	{
		SetEntPropFloat(client, Prop_Data, "m_flLaggedMovementValue", 1.0);
		CPrintToChat(client, "{darkred}[ByDexter] {green}speed bölgesinden {default}ayrıldınız.");
	}
}