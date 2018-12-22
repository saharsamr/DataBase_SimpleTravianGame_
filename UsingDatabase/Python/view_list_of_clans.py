def view_list_of_clans(cnxn):
    cursor = cnxn.cursor()

    command = 'SELECT clan_name FROM Clan'

    cursor.execute(command)

    for row in cursor.fetchall():
        print row

    cnxn.commit()

