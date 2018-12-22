import connect_to_db


def add_clan(cnxn):
    clan_name = raw_input('Enter clan name:')
    slogan = raw_input('Enter slogan:')            #TODO: seems that slogan can be a single word!
    building = raw_input('Enter default building:')
    doer = raw_input('doer username:')

    # cnxn = connect_to_db.connect_to_db()
    cursor = cnxn.cursor()

    command = 'EXEC dbo.AddClan '+clan_name+', '+slogan+', '+building+', '+doer

    cursor.execute(command)
    cnxn.commit()

