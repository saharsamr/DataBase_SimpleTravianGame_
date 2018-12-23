def view_list_of_clans(cnxn):
    cursor = cnxn.cursor()

    command = 'SELECT * FROM dbo.GetListOfClans()'

    cursor.execute(command)

    for row in cursor.fetchall():
        print row

    cnxn.commit()

