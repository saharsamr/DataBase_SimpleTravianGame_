def add_clan(cnxn):
    clan_name = raw_input('Enter clan name:')
    slogan = raw_input('Enter slogan:')            #TODO: seems that slogan can be a single word!
    building = raw_input('Enter default building:')
    doer = raw_input('doer username:')

    cursor = cnxn.cursor()

    command = 'EXEC dbo.AddClan '+clan_name+', '+slogan+', '+building+', '+doer

    cursor.execute(command)
    cnxn.commit()

    command = 'SELECT * FROM Clan WHERE clan_name = ?'
    cursor.execute(command, (clan_name))

    if len(cursor.fetchall()) == 0:
        print 'Not a valid clan to insert'
    else:
        print 'Clan added'

