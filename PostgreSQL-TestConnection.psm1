<#	
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2021 v5.8.196
	 Created on:   	2022. 10. 04. 15:05
	 Created by:   	Cservenyi Szabolcs
	 Organization: 	
	 Filename:     	PostgreSQL-TestConnect.psm1
	 Description:
	 ReleaseNotes:
	 Version:		1.0
	-------------------------------------------------------------------------
	 Module Name: 	PostgreSQL-TestConnection
	===========================================================================
#>

function PostgreSQL-TestConnection
{
	param (
		$Username = "",
		$Password = "",
		$Server = "",
		$Port = "",
		$DBName = "",
		$Query = ""
	)
	$ErrorActionPreference = 'Stop'
	try
	{
		$Connection = New-Object System.Data.Odbc.OdbcConnection
		$Connection.ConnectionString = "Driver={PostgreSQL UNICODE(x64)};Server=$Server;Port=$Port;Database=$DBName;Uid=$Username;Pwd=$Password"
		$Connection.Open()
		$true
	}
	catch
	{
		$false
	}
	finally
	{
		$Connection.Close()
	}
}

# Export-ModuleMember PostgreSQL-TestConnection





