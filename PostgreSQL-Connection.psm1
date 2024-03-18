<#	
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2021 v5.8.196
	 Created on:   	2022. 10. 04. 15:05
	 Created by:   	Cservenyi Szabolcs
	 Organization: 	
	 Filename:     	PostgreSQL-Connection.psm1
	 Description:	https://www.postgresql.org/ftp/odbc/versions/msi/
	 ReleaseNotes:
	 Version:		1.0
	-------------------------------------------------------------------------
	 Module Name: 	PostgreSQL-Connection
	===========================================================================
#>

function PostgreSQL-Connect
{
	param (
		$Username = "",
		$Password = "",
		$Server = "",
		$Port = "5432",
		$DBName = "",
        	[bool]$Test = $false,
		$Query = ""
	)
    if($Test -eq $true)
    {
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
    else
    {
        $Connection = New-Object System.Data.Odbc.OdbcConnection
	$Connection.ConnectionString = "Driver={PostgreSQL UNICODE(x64)};Server=$Server;Port=$Port;Database=$DBName;Uid=$Username;Pwd=$Password"
	$Cmd = New-Object System.Data.Odbc.OdbcCommand
	$Cmd.CommandText = $Query
	$Cmd.Connection = $Connection
	$Adapter = New-Object System.Data.Odbc.OdbcDataAdapter
	$Adapter.SelectCommand = $Cmd
	$DataSet = New-Object System.Data.DataSet
	$Adapter.Fill($DataSet)
	$DataSet.Tables[0]
	$Connection.Close()
    }
}

# Export-ModuleMember PostgreSQL-Connection





