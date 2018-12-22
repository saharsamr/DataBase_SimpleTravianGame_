def remove_user_from_clan(cnxn):
    clan_name = raw_input('Enter clan name:')
    username = raw_input('Enter target username:')
    doer = raw_input('Enter doer username:')

    cursor = cnxn.cursor()

    command = 'EXEC dbo.RemoveUserFromClan ?, ?, ?'

    cursor.execute(command, (clan_name, username, doer))
    cnxn.commit()

