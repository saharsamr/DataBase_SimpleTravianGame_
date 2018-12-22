def set_clan_slogan(cnxn):
    clan_name = raw_input('Enter clan name:')
    slogan = raw_input('Enter slogan:')
    doer = raw_input('Enter doer username:')

    cursor = cnxn.cursor()

    command = 'EXEC dbo.SetSloganOfClan ?, ?, ?'

    cursor.execute(command, (clan_name, slogan, doer))
    cnxn.commit()

