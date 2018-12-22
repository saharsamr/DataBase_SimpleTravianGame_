def view_clan_war_list(cnxn):
    clan_name = raw_input('Enter clan_name:')

    cursor = cnxn.cursor()

    command = 'SELECT * FROM dbo.ClanWars( ? )'
    cursor.execute(command, (clan_name))

    for row in cursor.fetchall():
        print row

