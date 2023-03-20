#include <sourcemod>
#include <devzones>

#pragma semicolon 1
#pragma newdecls required

public Plugin myinfo = 
{
	name = "SM DEV ZONES - Speed", 
	author = "ByDexter", 
	description = "", 
	version = "1.1", 
	url = "https://steamcommunity.com/id/ByDexterTR/"
};

public void Zone_OnClientEntry(int client, const char[] zone)
{
	if (StrContains(zone, "speed", false) != -1)
	{
		
		SetEntPropFloat(client, Prop_Data, "m_flLaggedMovementValue", StringToFloat(zone));
	}
}

public void Zone_OnClientLeave(int client, const char[] zone)
{
	if (StrContains(zone, "speed", false) != -1)
	{
		SetEntPropFloat(client, Prop_Data, "m_flLaggedMovementValue", 1.0);
	}
} 