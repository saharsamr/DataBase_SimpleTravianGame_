def remove_user_from_clan(doer, cnxn):
    clan_name = raw_input('Enter clan name:')
    username = raw_input('Enter target username:')

    cursor = cnxn.cursor()

    command = 'EXEC dbo.RemoveUserFromClan ?, ?, ?'

    cursor.execute(command, (clan_name, username, doer))
    cnxn.commit()

    command = 'SELECT * FROM dbo.CheckUserMembership(?, ?)'
    cursor.execute(command, (username, clan_name))

    if len(cursor.fetchall()) != 0:
        print 'Not a valid statement'
    else:
        print 'User successfully removed'

