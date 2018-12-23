def change_building_type(cnxn):
    clan_name = raw_input('Enter clan name:') #TODO: ye shakhse khas manteqan bayad betune war ro shoru kone!
    building_type = raw_input('Enter new building type:')
    doer = raw_input('Enter doer username:')

    cursor = cnxn.cursor()

    command = 'EXEC dbo.SetDefaultTypeBuilding ?, ?, ? '

    cursor.execute(command, (clan_name, building_type, doer))
    cnxn.commit()

    command = 'SELECT * FROM BuildingsOfClans AS BC ' \
              'INNER JOIN ' \
              'Building AS B ' \
              'ON BC.building_id = B.building_id ' \
              'WHERE BC.clan_name = ? AND ' \
              'B.building_name = ?'
    cursor.execute(command, (clan_name, building_type))

    if len(cursor.fetchall()) == 0:
        print 'Not a valid statement'
    else:
        print 'Default building type changed successfully'
