def add_clan(doer, cnxn):
    clan_name = raw_input('Enter clan name:')
    slogan = raw_input('Enter slogan:')
    building = raw_input('Enter default building:')

    cursor = cnxn.cursor()

    command = 'SELECT * FROM dbo.GetAClanInfo( ? )'
    cursor.execute(command, (clan_name))

    if len(cursor.fetchall()) == 0:
        command = 'EXEC dbo.AddClan '+clan_name+', '+slogan+', '+building+', '+doer

        cursor.execute(command)
        cnxn.commit()

        command = 'SELECT * FROM dbo.GetAClanInfo( ? )'
        cursor.execute(command, (clan_name))

        if len(cursor.fetchall()) == 0:
            print 'Not a valid clan to insert'
        else:
            print 'Clan added'
    else:
        print 'This clan already exists'

