def add_building(cnxn):
    building_name = raw_input('Enter building name:')

    cursor = cnxn.cursor()

    command = 'EXEC dbo.AddBuilding ?'

    cursor.execute(command, (building_name))
    cnxn.commit()

