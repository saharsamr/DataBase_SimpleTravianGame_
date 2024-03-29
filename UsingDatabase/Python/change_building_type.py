def change_building_type(doer, cnxn):
    clan_name = raw_input('Enter clan name:') #TODO: ye shakhse khas manteqan bayad betune war ro shoru kone!
    building_type = raw_input('Enter new building type:')

    cursor = cnxn.cursor()

    command = 'EXEC dbo.SetDefaultTypeBuilding ?, ?, ? '

    cursor.execute(command, (clan_name, building_type, doer))
    cnxn.commit()

    command = 'SELECT * FROM dbo.CheckBuildingOfAClan(?, ?)'
    cursor.execute(command, (clan_name, building_type))

    if len(cursor.fetchall()) == 0:
        print 'Not a valid statement'
    else:
        print 'Default building type changed successfully'
