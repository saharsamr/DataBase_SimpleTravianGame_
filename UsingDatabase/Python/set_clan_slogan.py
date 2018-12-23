def set_clan_slogan(doer, cnxn):
    clan_name = raw_input('Enter clan name:')
    slogan = raw_input('Enter slogan:')

    cursor = cnxn.cursor()

    command = 'EXEC dbo.SetSloganOfClan ?, ?, ?'

    cursor.execute(command, (clan_name, slogan, doer))
    cnxn.commit()

    command = 'SELECT * FROM dbo.CheckClanSlogan(?, ?)'
    cursor.execute(command, (clan_name, slogan))

    if len(cursor.fetchall()) == 0:
        print 'Not a valid statement'
    else:
        print 'The slogan changed successfully'

