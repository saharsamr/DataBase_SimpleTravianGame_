def set_clan_slogan(cnxn):
    clan_name = raw_input('Enter clan name:')
    slogan = raw_input('Enter slogan:')
    doer = raw_input('Enter doer username:')

    cursor = cnxn.cursor()

    command = 'EXEC dbo.SetSloganOfClan ?, ?, ?'

    cursor.execute(command, (clan_name, slogan, doer))
    cnxn.commit()

    command = 'SELECT * FROM Clan ' \
              'WHERE clan_name = ? AND ' \
              'slogan = ?'
    cursor.execute(command, (clan_name, slogan))

    if len(cursor.fetchall()) == 0:
        print 'Not a valid statement'
    else:
        print 'The slogan changed successfully'

