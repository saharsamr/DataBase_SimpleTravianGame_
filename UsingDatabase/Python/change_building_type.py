def change_building_type(cnxn):
    clan_name = raw_input('Enter clan name:') #TODO: ye shakhse khas manteqan bayad betune war ro shoru kone!
    building_type = raw_input('Enter new building type:')
    doer = raw_input('Enter doer username:')

    cursor = cnxn.cursor()

    command = 'EXEC dbo.SetDefaultTypeBuilding ?, ?, ? '

    cursor.execute(command, (clan_name, building_type, doer))
    cnxn.commit()

